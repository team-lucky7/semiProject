package semiProject.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

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

		List<Board> boardList = dao.selectBoardList(conn, type, pagination);
		
		if (type == 4 || type == 5) {
		
		List<Hashtag> hashtagList = dao.selectHashtag(conn);	

		int i = 0;
		for(Board board : boardList) {
			
		map.put("hashtag" + (i++), dao.selectBoardHashtag(conn, board.getBoardNo()));
		
		map.put("thumbnail", dao.selectThumbnail(conn, board.getBoardNo()));
		
		}
		
		map.put("hashtag", hashtagList);
		
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
			detail.setArticleList(articleList);
			
			
			List<BoardImage> imageList = dao.selectBoardImage(conn, boardNo);
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
	
	/** 게시글 검색 Service
	 * @param query
	 * @return map
	 * @throws Exception
	 */
	public Map<String, Object> searchBoardList(int cp, String query) throws Exception{
		
		Connection conn = getConnection();
		
		int listCount = dao.getSearchListCount(conn, query);
		
		Pagination pagination = new Pagination(cp, listCount);

		List<Board> boardList = dao.searchBoardList(conn, pagination, query);
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("pagination", pagination);
		map.put("boardList", boardList);
		
		close(conn);

		return map;
	}

	public int deleteBoard(int boardNo) throws Exception {

		Connection conn = getConnection();
		
		int result = dao.deleteBoard(conn, boardNo);
		
		if(result > 0)	commit(conn);
		else			rollback(conn);
		
		close(conn);
		
		return result;
	}
	

	public BoardDetail selectRegionBoardDetail(int boardNo,Member loginMember) throws Exception{
		
		Connection conn = getConnection();
		
		BoardDetail detail =  dao.selectRegionBoardDetail(conn, boardNo);
		
		
		if(detail != null) { 
			
			List<BoardImage> imageList = dao.selectRegionImageList(conn,boardNo);
			
			detail.setImageList(imageList);
			
			List<BoardArticle> articleList = dao.selectBoardArticle(conn, boardNo);
			
			detail.setArticleList(articleList);
			
		}
		
		int result = dao.increaseReadCount(conn, boardNo);
		
		if(result > 0) {
			commit(conn);
			
			detail.setReadCount(detail.getReadCount() + result);
		}else {
			rollback(conn);
		}
		
		if(loginMember != null) {
			int memberNo = loginMember.getMemberNo();
			
			result = dao.getIsLike(conn, boardNo, memberNo);
			
			if(result > 0) {
				detail.setLike(true);
			}
		}
		
		
		close(conn);
		
		return detail;
	}

	/** 지역 게시글 수정
	 * @param detail
	 * @param imageList
	 * @param deleteList
	 * @return result
	 */
	public int updateBoard(BoardDetail detail, List<BoardImage> imageList, String deleteList) throws Exception {
		
		detail.setBoardTitle(Utill.XSSHandling(detail.getBoardTitle()));
		detail.setBoardContent(Utill.XSSHandling(detail.getBoardContent()));	
		
		detail.setBoardContent(Utill.newLineHandling(detail.getBoardContent()));
//		int re
//		
//		if(result > 0) {
//			
//			for(BoardImage img : imageList) {
//				
//				img.
//			}
//		}
		
		
		
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
		
		int locationCode = dao.selectLocationCode(conn, boardNo, detail);
		
		detail.setLocationCode(locationCode);
		
		
		int updateLocation = dao.updateLocation(conn, boardNo, detail);
		
		detail.setBoardNo(boardNo);
		
		int result = dao.regioninsertBoard(conn,detail,boardCode);
		
		if(result > 0) { 
			
			commit(conn);
			
			for(BoardImage image : imageList) { 
				image.setBoardNo(boardNo); 
				
				result = dao.regioninsertBoardImage(conn,image);
				
				article.setBoardNo(detail.getBoardNo());
				
				BoardArticle article2 = new BoardArticle();
				article2.setContent(detail.getMapAddress());
				article2.setContentLevel(1);
				article2.setBoardNo(detail.getBoardNo());
				
				result = dao.insertBoardArticle(conn, article2);
				
				if(result == 0) { 
					break;
				}
			}
		
		}


		if(result > 0) {
			result = dao.insertBoardArticle(conn, article);
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

	public List<BoardDetail> selectRegionList(int type) throws Exception{
		
		Connection conn = getConnection();
		
		List<BoardDetail> boardList = dao.selectRegionList(conn,type);
		
		for(BoardDetail board : boardList) {
			List<BoardImage> imageList = dao.selectRegionImageList(conn,board.getBoardNo());
			
			board.setImageList(imageList);
		}
		
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
		
		dao.deleteBoardArticle(conn, detail.getBoardNo());
		dao.deleteBoardImage(conn, detail.getBoardNo());
		
		int result = dao.updateFreeBoard(conn, detail);

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

	public int communityWrite(List<BoardArticle> boardArticleList, List<BoardImage> imageList, Board board,
							  List<String> hashtagList, List<String> hashtagOption, String address) throws Exception {

		Connection conn = getConnection();

		int boardNo = dao.nextBoardNo(conn);
		// 1. 다음 작성할 게시글 번호 얻어오기
		// -> BOARD 테이블 INSERT / BOARD_IMG 테이블 INSERT / 반환값(상제조회 번호)

		
		// 지역코드 찾고 게시글에 넣기         
        int locationCode = dao.locationCode(conn, address); // 코드 검색해서 게시판에 넣어준다

        board.setLocationCode(locationCode);
		
		// 2. 게시글 보드넘버 삽입
		board.setBoardNo(boardNo); // 조회된 다음 게시글 번호세팅

		
		// 3. 게시글 DB에 보내기
		int result = dao.insertBoard(conn, board);

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
	         for(int i = 0; i < hashtagList.size(); i++) {
	            
	            result = dao.insertHashtagList(hashtagList.get(i), hashtagOption.get(i), conn);
	            
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
		
		detail.setBoardNo(boardNo); 
		
		int locationCode = dao.selectLocationCode(conn, boardNo, detail);
	
		detail.setLocationCode(locationCode);
		
		int updateLocation = dao.updateLocation(conn,boardNo, detail);
		
		int result = 0;
		
		// *) XSS 방지 처리(제목/내용)
		detail.setBoardTitle(Utill.XSSHandling(detail.getBoardTitle()));
		detail.setBoardContent(Utill.XSSHandling(detail.getBoardContent()));

		// *) 개행 문자 처리(내용)
		detail.setBoardContent(Utill.newLineHandling(detail.getBoardContent()));

		result = dao.insertThemaBoard(conn, detail, boardCode);

		if (result > 0) { // 게시글 삽입 성공 시

			// 3. 이미지 정보만 삽입(imageList 사용)
			for (BoardImage image : imageList) { // 하나씩 꺼내서 DAO 수행

				image.setBoardNo(boardNo); // 1번에서 조회된 다음 게시글 번호 세팅

				result = dao.insertThemaBoardImage(conn, image);
				
				
				// BoardArticle에 MapAddress 값 삽입 **BORRD가 부모기 때문에 먼저 세팅 필요
				BoardArticle article = new BoardArticle();
				article.setContent(detail.getMapAddress());
				article.setBoardNo(detail.getBoardNo());
				
				int  insertArticle = dao.insertBoardArticle(conn, article);

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


	/** 내가 작성한 게시글 목록 조회 Service
	 * @param memberNo
	 * @param bCp
	 * @return map
	 * @throws Exception
	 */
	public Map<String, Object> selectMyBoardList(int memberNo, int bCp) throws Exception {
		
		Connection conn = getConnection();
		
		int listCount = dao.getMyBoardListCount(conn, memberNo);
		
		Pagination pagination = new Pagination(bCp, listCount);
		pagination.setLimit(5);
		
		List<Board> boardList = dao.selectMyBoardList(conn, memberNo, pagination);
		
		Map<String, Object> map = new HashMap<>();
		map.put("boardList", boardList);
		map.put("pagination", pagination);
		
		close(conn);
		
		return map;
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


	/**(테마) 게시글 수정
	 * @param detail
	 * @param imageList
	 * @param deleteList
	 * @return result
	 * @throws Exception
	 */
	public int updateThemaBoard(BoardDetail detail, List<BoardImage> imageList, String deleteList)throws Exception{
		
		Connection conn = getConnection();
		
		//XSS
		detail.setBoardTitle(Utill.XSSHandling(detail.getBoardTitle()));
		detail.setBoardContent(Utill.XSSHandling(detail.getBoardContent()));
		// 개행문자
		detail.setBoardContent(Utill.newLineHandling(detail.getBoardContent()));
		
		int locationCode = dao.selectLocationCode(conn, detail.getBoardNo(), detail);
		
		detail.setLocationCode(locationCode);
		
		int Coordinate = dao.updateBoardArticle(conn, detail);
		
		int result = dao.updateThemaBoard(conn,detail);
		
		if(result>0) { // 게시글 수정 성공 시
			
			// 이미지 부분 수정(기존 -> 변경, 없다가 -> 추가)
			for(BoardImage image : imageList) {
				image.setBoardNo(detail.getBoardNo()); 
				
				result = dao.updateBoardImage(conn, image);
				
				if(result == 0) {
					result = dao.insertBoardImage(conn, image);
				}	
			}
			// 이미지 삭제 : deleteList에 값이 존재하면 "0,1,2..", 없으면 ""
			if(!deleteList.equals("")) { 
				result = dao.deleteThemaBoardImage(conn, deleteList, detail.getBoardNo());
			}
		}
		
		if(result>0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
	}


	
	
}
