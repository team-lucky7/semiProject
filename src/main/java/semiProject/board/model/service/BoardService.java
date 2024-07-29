package semiProject.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import semiProject.board.model.dao.BoardDAO;
import semiProject.board.model.vo.Board;
import semiProject.board.model.vo.BoardArticle;
import semiProject.board.model.vo.BoardDetail;
import semiProject.board.model.vo.BoardImage;
import semiProject.board.model.vo.Hashtag;
import semiProject.board.model.vo.Pagination;
import semiProject.common.Utill;

import semiProject.member.model.vo.Member;

import static semiProject.common.JDBCTemplate.*;

public class BoardService {

	private BoardDAO dao = new BoardDAO();

	/**
	 * 게시글 목록 조회 Service
	 * 
	 * @param type
	 * @param cp
	 * @return boardList
	 * @throws Exception
	 */
	public Map<String, Object> selectBoardList(int type, int cp) throws Exception {

		Connection conn = getConnection();
		
		Map<String, Object> map = new HashMap<>();

		String boardName = dao.selectBoardName(conn, type);

		int listCount = dao.getListCount(conn, type);

		Pagination pagination = new Pagination(cp, listCount);

		List<BoardDetail> boardList = dao.selectBoardList(conn, type, pagination);
		
	      if (type == 4 || type == 5) {
	          
	          List<Hashtag> hashtagList = dao.selectHashtag(conn); // 전체 해시태그 리스트

	          List<List<String>> hashtag = new ArrayList<>(); // 게시글 각각 해시태그 
	          
	          List<String> thumbnail = new ArrayList<>(); // 게시글 각각 썸네일
	          
	          List<Integer> replyCount = new ArrayList<>();
	          
	          for(BoardDetail board : boardList) {
		          System.out.println(board);

	          hashtag.add(dao.selectBoardHashtag(conn, board.getBoardNo()));
	          thumbnail.add(dao.selectThumbnail(conn, board.getBoardNo()));
	          replyCount.add(dao.selectReplyCount(conn, board.getBoardNo()));
	          
	          }
	          
	          map.put("hashtag", hashtag);
	          map.put("thumbnail", thumbnail);
	          map.put("hashtagList", hashtagList);
	          map.put("replyCount", replyCount);

	          }



	      map.put("pagination", pagination);
	      map.put("boardList", boardList);
	      map.put("boardName", boardName);

	      close(conn);

	      return map;
	}

	
	/** 게시글 상세조회 Service
	 * @param boardNo
	 * @param loginMember 
	 * @return detail
	 * @throws Exception
	 */

	public BoardDetail selectBoardDetail(int boardNo, Member loginMember) throws Exception{

		Connection conn = getConnection();
		
		BoardDetail detail = dao.selectBoardDetail(conn, boardNo);
		
		System.out.println(boardNo);
		System.out.println(detail);
		
		if(detail != null) {

			
			int result = dao.increaseReadCount(conn, boardNo);
			
			if(result > 0) {
				commit(conn);
				detail.setReadCount(detail.getReadCount() + result);
			}else {
				rollback(conn);
			}
			
			List<BoardArticle> articleList = dao.selectBoardArticle(conn, boardNo);
			
			for(BoardArticle article : articleList) {
				article.setContent(article.getContent().replaceAll("<br>", "\n"));
			}
			
			List<BoardImage> imageList = dao.selectBoardImage(conn, boardNo);

	        

			System.out.println(detail.getBoardCode());
			if (detail.getBoardCode() == 4 || detail.getBoardCode() == 5) {
				
				for(BoardImage image : imageList) { // 정렬을 위해 이미지를 아티클에 추가한다.
					BoardArticle article = new BoardArticle();
					article.setContentNo(image.getImageNo());
					article.setContent(image.getImageRename());
					article.setContentSize(image.getImageSize());
					article.setContentLevel(image.getImageLevel());
					articleList.add(article);
				}
				
				articleList.sort(Comparator.comparing(BoardArticle::getContentLevel));			
				detail.setHashtagList(dao.selectBoardHashtag(conn, boardNo));
				
			}
			

			detail.setArticleList(articleList);
			detail.setImageList(imageList);
			
			// -> 커뮤니티는 이미지랑 아티클이랑 순서대로 통합 해서 넘겨주고 if로 사이즈 비교해서 그리는 방식으로 간다
			//    (공통 가져갈 것 -> content(글내용, 사진 경위도, 지도는 json), 사이즈, 리스트가 순서여서 순서는 불필요하다)
			// 	  sortedUserDtoList.sort(Comparator.comparing(UserDto::getUserNm));
			//			객체명									클래스 :: 필드   
			
			// -> 지도는 리스트 맨 마지막에 넣어준다. 경위도는 가서 쪼개는 걸로 사
			// -> 
			
			if(loginMember != null) {
				int memberNo = loginMember.getMemberNo();
				
				result = dao.getIsLike(conn, boardNo, memberNo);
				
				if(result > 0) {
					detail.setLike(true);
				}
			}
		}
		
		close(conn);
		
		return detail;
	}
	
	/** 키워드 검색
	 * @param query
	 * @return mapList
	 * @throws Exception
	 */
	public List<Map<String, Object>> searchKeyword(String query) throws Exception{
		
		List<Map<String, Object>> mapList = new ArrayList<>();
		
		mapList.add(searchBoardList(1, 1, query));
		mapList.add(searchBoardList(2, 1, query));
		mapList.add(searchBoardList(3, 1, query));
		
		return mapList;
	}

	/** 해시태그 검색
	 * @param query
	 * @return mapList
	 * @throws Exception
	 */
	public List<Map<String, Object>> searchHashtag(String query) throws Exception{
		
		List<Map<String, Object>> mapList = new ArrayList<>();
		
		mapList.add(searchBoardList(4, 1, query));
		mapList.add(searchBoardList(5, 1, query));
		
		return mapList;
	}
	
	
	
	public Map<String, Object> searchBoardList(int type, int cp, String query) throws Exception{
		
		Connection conn = getConnection();
		
		String boardName = dao.selectBoardName(conn, type);
		
		int listCount = dao.getSearchListCount(conn, type, query);
		
		Pagination pagination = new Pagination(cp, listCount);
		
		List<BoardDetail> boardList = dao.searchBoardList(conn, type, pagination, query);
				
		Map<String, Object> map = new HashMap<>();

		// 커뮤니티 추가
		
		if (type == 4 || type == 5) {
	          
			  boardList = dao.selectCommunityBoardList(conn, type, pagination, query);

			  
			
	          List<Hashtag> hashtagList = dao.selectHashtag(conn); // 전체 해시태그 리스트

	          List<List<String>> hashtag = new ArrayList<>(); // 게시글 각각 해시태그 
	          
	          List<String> thumbnail = new ArrayList<>(); // 게시글 각각 썸네일
	          
	          List<Integer> replyCount = new ArrayList<>();

	          
	          for(BoardDetail board : boardList) {

	          hashtag.add(dao.selectBoardHashtag(conn, board.getBoardNo()));
	          thumbnail.add(dao.selectThumbnail(conn, board.getBoardNo()));
	          replyCount.add(dao.selectReplyCount(conn, board.getBoardNo()));
	          
	          }
	          
	          map.put("hashtag", hashtag);
	          map.put("thumbnail", thumbnail);
	          map.put("hashtag", hashtagList);
	          map.put("query", query);
	          map.put("replyCount", replyCount);
	          
	          }
		// 커뮤니티 추가 끝
		
		map.put("boardName", boardName);
		map.put("pagination", pagination);
		map.put("boardList", boardList);

		close(conn);

		return map;
	}
	
public Map<String, Object> searchCommunityBoardList(int type, int cp, String query) throws Exception{
		
		Connection conn = getConnection();
		
		String boardName = dao.selectBoardName(conn, type);
		
		int listCount = dao.getHashtagSearchListCount(conn, type, query);
		
		Pagination pagination = new Pagination(cp, listCount);
		
		List<BoardDetail> boardList = dao.selectCommunityBoardList(conn, type, pagination, query);
		
		Map<String, Object> map = new HashMap<>();

	    List<Hashtag> hashtagList = dao.selectHashtag(conn); // 전체 해시태그 리스트

	    List<List<String>> hashtag = new ArrayList<>(); // 게시글 각각 해시태그 
	          
	    List<String> thumbnail = new ArrayList<>(); // 게시글 각각 썸네일
	        
	    List<Integer> replyCount = new ArrayList<>();
	        
	    for(BoardDetail board : boardList) {

	      hashtag.add(dao.selectBoardHashtag(conn, board.getBoardNo()));
	      thumbnail.add(dao.selectThumbnail(conn, board.getBoardNo()));
	      replyCount.add(dao.selectReplyCount(conn, board.getBoardNo()));

	    }
	          
	    map.put("hashtag", hashtag); // 게시글 각각 해시태그
	    map.put("thumbnail", thumbnail); // 각 게시글 첫번째 그림
	    map.put("hashtagList", hashtagList); // 전체 해시태그
	    map.put("query", query); // 해시태그 선택한거 검색결과에 표시
		map.put("boardName", boardName); 
		map.put("pagination", pagination);
		map.put("boardList", boardList);
		map.put("replyCount", replyCount);
		
		close(conn);

		return map;
	}
	
	

	/**
	 * (테마) 게시글 등록 Service
	 * 
	 * @param detail
	 * @param imageList
	 * @param boardCode
	 * @return result
	 */
	public int insertThemaBoard(BoardDetail detail, List<BoardImage> imageList, int boardCode) throws Exception {

		Connection conn = getConnection();

		int boardNo = dao.nextBoardNo(conn);

		// 2. 게시글 부분만 삽입(detail, boardCode 사용)
		detail.setBoardNo(boardNo); // 1번에서 조회된 다음 게시글 번호 세팅

		// *) XSS 방지 처리(제목/내용)
		detail.setBoardTitle(Utill.XSSHandling(detail.getBoardTitle()));
		detail.setBoardContent(Utill.XSSHandling(detail.getBoardContent()));

		// *) 개행 문자 처리(내용)
		detail.setBoardContent(Utill.newLineHandling(detail.getBoardContent()));

		int result = dao.insertThemaBoard(conn, detail, boardCode);

		if (result > 0) { // 게시글 삽입 성공 시

			// 3. 이미지 정보만 삽입(imageList 사용)
			for (BoardImage image : imageList) { // 하나씩 꺼내서 DAO 수행

				image.setBoardNo(boardNo); // 1번에서 조회된 다음 게시글 번호 세팅

				result = dao.insertThemaBoardImage(conn, image);

				if (result == 0) {// 이미지 삽입 실패
					break;
				}
			} // for문 끝
		} // if문 끝

		// 트랜잭션
		if (result > 0) {

			commit(conn);

		} else { // 2, 3번에서 한 번이라도 실패한 경우
			rollback(conn);
			boardNo = 0; // 게시글 번호를 0으로 바꿔서 실패했음을 컨트롤러로 전달
		}

		close(conn);
		
		return boardNo;

	}

	public int deleteBoard(int boardNo) throws Exception {

		Connection conn = getConnection();
		
		int result = dao.deleteBoard(conn, boardNo);
		
		if(result > 0)	commit(conn);
		else			rollback(conn);
		
		close(conn);
		
		return result;
	}
	

	public BoardDetail selectRegionBoardDetail(int boardNo) throws Exception{
		
		Connection conn = getConnection();
		
		BoardDetail detail =  dao.selectRegionBoardDetail(conn, boardNo);
		
		System.out.println(detail);
		
		if(detail != null) { 
			
			List<BoardImage> imageList = dao.selectRegionImageList(conn,boardNo);
			
			detail.setImageList(imageList);
			
		}
		
			close(conn);
			
			return detail;
		}

	/** 지역 게시글 수정
	 * @param detail
	 * @param imageList
	 * @param deleteList
	 * @return
	 */
	public int updateBoard(BoardDetail detail, List<BoardImage> imageList, String deleteList) throws Exception {
		
		return 0;
	}

	
	
	/** 지역 게시글 삽입 
	 * @param detail
	 * @param imageList
	 * @param boardCode
	 * @return
	 * @throws Exception
	 */
	public int regioninsertBoard(BoardDetail detail, List<BoardImage> imageList, int boardCode, BoardArticle article) throws Exception {
		
		Connection conn = getConnection();
		
		int boardNo = dao.regionnextBoardNo(conn);
		
		
		detail.setBoardNo(boardNo);
		
		
		int result = dao.regioninsertBoard(conn,detail,boardCode);
		
		if(result > 0) { 
			
			for(BoardImage image : imageList) { 
				image.setBoardNo(boardNo); 
				
				result = dao.regioninsertBoardImage(conn,image);
				
				if(result == 0) { 
					break;
				}
			}
			
		}
		
		if(result > 0) {
			result = dao.regioninsertBoard2(conn,article,detail);
		}
		
		if(result > 0) {
			commit(conn);
		
		}else { 
			rollback(conn);
			
			boardNo = 0; 
		}
		
		close(conn);

		return boardNo;
	}

	public List<Board> searchRegionBoardList(String type) throws Exception{
		
		Connection conn = getConnection();
		
		List<Board> boardList = dao.searchRegionBoardList(conn,type);
		
		close(conn);
		
		
		return boardList;
	}

	/** 자유게시글 삽입 Service
	 * @param detail
	 * @param articleList
	 * @param imageList
	 * @return boardNo
	 * @throws Exception
	 */
	public int insertFreeBoard(BoardDetail detail, List<BoardArticle> articleList, List<BoardImage> imageList) throws Exception {
		
		Connection conn = getConnection();
		
		int boardNo = dao.nextBoardNo(conn);
		
		detail.setBoardTitle(Utill.XSSHandling(detail.getBoardTitle()));
		
		int result = dao.insertFreeBoard(conn, boardNo, detail);
		
		if(result > 0) {
			
			for(BoardArticle article : articleList) {
				
				article.setContent(Utill.XSSHandling(article.getContent()));
				article.setContent(Utill.newLineHandling(article.getContent()));
				
				result = dao.insertFreeBoardArticle(conn, boardNo, article);
				
				if(result == 0) {
					boardNo = 0;
					break;
				}
			}
			
			if(boardNo > 0) {
				for(BoardImage image : imageList) {
					
					result = dao.insertFreeBoardImage(conn, boardNo, image);
					
					if(result == 0) {
						boardNo = 0;
						break;
					}
				}
			}
			
		}
		
		if(boardNo > 0)	commit(conn);
		else			rollback(conn);
		
		close(conn);
		
		return boardNo;
	}

	/** 자유게시글 수정 Service
	 * @param imageList 
	 * @param articleList 
	 * @param boardNo
	 * @return result
	 * @throws Exception
	 */
	public int updateBoardContent(BoardDetail detail, List<BoardArticle> articleList, List<BoardImage> imageList) throws Exception {
		
		Connection conn = getConnection();
		
		detail.setBoardTitle(Utill.XSSHandling(detail.getBoardTitle()));
		
		int result = dao.deleteBoardArticle(conn, detail.getBoardNo());
		
		System.out.println(result);
		
		dao.deleteBoardImage(conn, detail.getBoardNo());
		dao.updateFreeBoard(conn, detail);

		if(result > 0) {
			for(BoardArticle article : articleList) {
				
				article.setContent(Utill.XSSHandling(article.getContent()));
				article.setContent(Utill.newLineHandling(article.getContent()));
				
				result = dao.insertFreeBoardArticle(conn, detail.getBoardNo(), article);
				
				if(result == 0) {
					break;
				}
			}
		}
		
		if(result > 0) {
			for(BoardImage image : imageList) {
				
				result = dao.insertFreeBoardImage(conn, detail.getBoardNo(), image);
				
				if(result == 0) {
					break;
				}
			}
		}
		
		if(result > 0)	commit(conn);
		else			rollback(conn);
		
		return result;
	}

	public int communityWrite(List<BoardArticle> boardArticleList, List<BoardImage> imageList, BoardDetail detail,
							  List<String> hashtagList, List<String> hashtagOption, String address) throws Exception {

		Connection conn = getConnection();

		int boardNo = dao.nextBoardNo(conn);
		// 1. 다음 작성할 게시글 번호 얻어오기
		// -> BOARD 테이블 INSERT / BOARD_IMG 테이블 INSERT / 반환값(상제조회 번호)

		
		// 지역코드 찾고 게시글에 넣기         
        int locationCode = dao.locationCode(conn, address); // 코드 검색해서 게시판에 넣어준다

        detail.setLocationCode(locationCode);
		
		// 2. 게시글 보드넘버 삽입
		detail.setBoardNo(boardNo); // 조회된 다음 게시글 번호세팅

		
		// 3. 게시글 DB에 보내기
		int result = dao.insertBoard(conn, detail);

		if(result > 0) { 
			
			// 게시글 삽입 성공 시 이미지 삽입
			for(BoardImage image : imageList) { // 하나씩 꺼내서 DAO 수행
				
				image.setBoardNo(boardNo); // 게시글 번호 세팅

				result = dao.insertBoardImage(conn, image);

				if(result == 0) { // 이미지 삽입 실패
				break;
				}
			} // for문 끝

			// 글 삽입
			for(BoardArticle article : boardArticleList) { // 하나씩 꺼내서 DAO 수행
				article.setBoardNo(boardNo); // 게시글 번호 세팅

				result = dao.insertBoardArticle(conn, article);

				if(result == 0) { // 글 삽입 실패
				   break;
				}
			} // for문 끝
			
			// hashtag 삽입       
			for(int i = 0; i < hashtagList.size(); i++) { // 해시태그가 이미 존재한다면 리스트에 올리지 않는다.

				if (dao.hashtagNo(hashtagList.get(i), conn) == 0) {

					result = dao.insertHashtagList(hashtagList.get(i), hashtagOption.get(i), conn);

				}
					// 해시태그는 중복된거 안받아서 업데이트 안될 가능성 있어서 체크 안해도 된다.


					int hashtagNo = dao.hashtagNo(hashtagList.get(i),conn);

					result = dao.insertHashtag(hashtagNo, boardNo, conn);

					if(result == 0) {
						break;
					}
				
			}

		} // if문 끝

		// 트랜잭션
		if (result > 0) {
			commit(conn);
		}else { // 2, 3번에서 한번이라도 실패한 경우
			rollback(conn);
			//boardNo = 0; // 게시글 번호를 0으로 바꿔 실패를 컨트롤러에 전달
		}

		close(conn);

		return result;

	}

	/** (테마)게시글 삭제
	 * @param no
	 * @return result
	 * @throws Exception
	 */
	public int deleteThemaBoard(int no)throws Exception{
		Connection conn = getConnection();
		
		int result = dao.deleteThemaBoard(conn, no);
		
		if(result>0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
	}

	/**(테마) 게시글 목록 조회
	 * @param type
	 * @param cp
	 * @return map
	 * @throws Exception
	 */
	public List<Board> selectThemaBoardList(String type)throws Exception{
		
		Connection conn = getConnection();
		
		List<Board> boardList = dao.selectThemaBoardList(conn, type);
		
		close(conn);
		
		return boardList;
	}
	
	/**(테마) 게시글 상세 조회
	 * @param boardNo
	 * @return detail
	 * @throws Exception
	 */
	public BoardDetail selectThemaBoardDetail(int boardNo)throws Exception{
		
		Connection conn = getConnection();
		
		BoardDetail detail = dao.selectThemaBoardDetail(conn, boardNo);
		
		if(detail != null) {
			
			List<BoardImage> imageList = dao.selectThemaImageList(conn, boardNo);
			
			detail.setImageList(imageList);
		}
		
		close(conn);
		
		return detail;
	}
	
}
