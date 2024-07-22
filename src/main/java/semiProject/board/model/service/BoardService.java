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
import semiProject.board.model.vo.Pagination;
import semiProject.member.model.vo.Member;

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
			detail.setArticleList(articleList);
			
			List<BoardImage> imageList = dao.selectBoardImage(conn, boardNo);
			detail.setImageList(imageList);
			
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
		
		List<Board> boardList = dao.searchBoardList(conn, type, pagination, query);
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("boardName", boardName);
		map.put("pagination", pagination);
		map.put("boardList", boardList);
		
		close(conn);
		
		return map;
	}

}
