package semiProject.board.model.service;

import java.sql.Connection;

import semiProject.board.model.dao.LikeDAO;

import static semiProject.common.JDBCTemplate.*;

public class LikeService {
	
	private LikeDAO dao = new LikeDAO();

	/** 좋아요 삽입 Service
	 * @param boardReplyNo
	 * @param memberNo 
	 * @return result
	 * @throws Exception
	 */
	public int insertLike(int boardReplyNo, int memberNo) throws Exception {
		
		Connection conn = getConnection();
		
		int result = dao.insertLike(conn, boardReplyNo, memberNo);
		
		if(result > 0)	commit(conn);
		else			rollback(conn);
		
		close(conn);
		
		return result;
	}

	/** 좋아요 삭제 Service
	 * @param boardReplyNo
	 * @param memberNo 
	 * @return result
	 * @throws Exception
	 */
	public int deleteLike(int boardReplyNo, int memberNo) throws Exception {

		Connection conn = getConnection();
		
		int result = dao.deleteLike(conn, boardReplyNo, memberNo);
		
		if(result > 0)	commit(conn);
		else			rollback(conn);
		
		close(conn);
		
		return result;
	}
	
}
