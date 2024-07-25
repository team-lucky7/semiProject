package semiProject.board.model.service;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import semiProject.board.model.dao.BoardDAO;
import semiProject.board.model.vo.Board;
import semiProject.board.model.vo.BoardArticle;
import semiProject.board.model.vo.BoardDetail;
import semiProject.board.model.vo.BoardImage;
import semiProject.board.model.vo.Like;
import semiProject.board.model.vo.Pagination;
import semiProject.board.model.vo.Reply;
import semiProject.common.Util;


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

		String boardName = dao.selectBoardName(conn, type);

		int listCount = dao.getListCount(conn, type);

		Pagination pagination = new Pagination(cp, listCount);

		List<Board> boardList = dao.selectBoardList(conn, type, pagination);

		Map<String, Object> map = new HashMap<>();

		map.put("boardName", boardName);
		map.put("pagination", pagination);
		map.put("boardList", boardList);

		close(conn);

		return map;
	}

	/**
	 * 게시글 상세조회 Service
	 * 
	 * @param boardNo
	 * @return detail
	 * @throws Exception
	 */
	public BoardDetail selectBoardDetail(int boardNo) throws Exception {
		Connection conn = getConnection();

		BoardDetail detail = dao.selectBoardDetail(conn, boardNo);

		if (detail != null) {
			List<Like> likeList = dao.getLikeMember(conn, boardNo);
			detail.setLikeList(likeList);

			List<BoardArticle> articleList = dao.selectBoardArticle(conn, boardNo);
			detail.setArticleList(articleList);

			List<BoardImage> imageList = dao.selectBoardImage(conn, boardNo);
			detail.setImageList(imageList);
		}

		close(conn);

		return detail;
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
		detail.setBoardTitle(Util.XSSHandling(detail.getBoardTitle()));
		detail.setBoardContent(Util.XSSHandling(detail.getBoardContent()));

		// *) 개행 문자 처리(내용)
		detail.setBoardContent(Util.newLineHandling(detail.getBoardContent()));

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

}
