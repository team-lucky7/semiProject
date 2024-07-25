package semiProject.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import semiProject.board.model.dao.BoardDAO;
import semiProject.board.model.vo.Board;
import semiProject.board.model.vo.BoardArticle;
import semiProject.board.model.vo.BoardDetail;
import semiProject.board.model.vo.BoardImage;
<<<<<<< HEAD
import semiProject.board.model.vo.Hashtag;
import semiProject.board.model.vo.Like;
import semiProject.board.model.vo.Pagination;
=======
import semiProject.board.model.vo.Pagination;
import semiProject.member.model.vo.Member;

>>>>>>> origin/main
import static semiProject.common.JDBCTemplate.*;

public class BoardService {
	
	private BoardDAO dao = new BoardDAO();

	/** 게시글 목록 조회 Service
	 * @param type
	 * @param cp
	 * @return boardList
	 * @throws Exception
	 */
	public Map<String, Object> selectBoardList(int type, int cp) throws Exception{
		
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
		
		close(conn);
		
		return map;
	}

	
	/** 게시글 상세조회 Service
	 * @param boardNo
	 * @param loginMember 
	 * @return detail
	 * @throws Exception
	 */
<<<<<<< HEAD
	
	public BoardDetail selectBoardDetail(int boardNo) throws Exception{
=======
	public BoardDetail selectBoardDetail(int boardNo, Member loginMember) throws Exception{
>>>>>>> origin/main
		Connection conn = getConnection();
		
		BoardDetail detail = dao.selectBoardDetail(conn, boardNo);

		if(detail != null) {
<<<<<<< HEAD
			List<Like> likeList = dao.getLikeMember(conn, boardNo);
			detail.setLikeList(likeList);
			// 아직 준비 안됨
			
=======
			
			int result = dao.increaseReadCount(conn, boardNo);
			
			if(result > 0) {
				commit(conn);
				detail.setReadCount(detail.getReadCount() + result);
			}else {
				rollback(conn);
			}
>>>>>>> origin/main
			
			List<BoardArticle> articleList = dao.selectBoardArticle(conn, boardNo);
			detail.setArticleList(articleList);
			
			List<BoardImage> imageList = dao.selectBoardImage(conn, boardNo);
			detail.setImageList(imageList);
			
<<<<<<< HEAD
			// -> 커뮤니티는 이미지랑 아티클이랑 순서대로 통합 해서 넘겨주고 if로 사이즈 비교해서 그리는 방식으로 간다
			//    (공통 가져갈 것 -> content(글내용, 사진 경위도, 지도는 json), 사이즈, 리스트가 순서여서 순서는 불필요하다)
			// 	  sortedUserDtoList.sort(Comparator.comparing(UserDto::getUserNm));
			//			객체명									클래스 :: 필드   
			
			// -> 지도는 리스트 맨 마지막에 넣어준다. 경위도는 가서 쪼개는 걸로 사
			// -> 
			
=======
			if(loginMember != null) {
				int memberNo = loginMember.getMemberNo();
				
				result = dao.getIsLike(conn, boardNo, memberNo);
				
				if(result > 0) {
					detail.setLike(true);
				}
			}
>>>>>>> origin/main
		}
		
		close(conn);
		
		return detail;
	}
	
<<<<<<< HEAD
=======
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
		
		List<Board> boardList = dao.searchBoardList(conn, type, pagination, query);
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("boardName", boardName);
		map.put("pagination", pagination);
		map.put("boardList", boardList);
		
		close(conn);
		
		return map;
	}

	/** 게시글 삭제 Service
	 * @param boardNo
	 * @return result
	 * @throws Exception
	 */
	public int deleteBoard(int boardNo) throws Exception {

		Connection conn = getConnection();
		
		int result = dao.deleteBoard(conn, boardNo);
		
		if(result > 0)	commit(conn);
		else			rollback(conn);
		
		return result;
	}
>>>>>>> origin/main

	

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
}