package semiProject.board.model.service;

import java.sql.Connection;
import java.util.List;

import semiProject.board.model.dao.ReplyDAO;
import semiProject.board.model.vo.Reply;
import static semiProject.common.JDBCTemplate.*;

public class ReplyService {
	
	private ReplyDAO dao = new ReplyDAO();

	/** 댓글 목록 조회 Service
	 * @param boardNo
	 * @return replyList
	 * @throws Exception
	 */
	public List<Reply> selectReplyList(int boardNo) throws Exception{
		
		Connection conn = getConnection();
		
		List<Reply> replyList = dao.selectReplyList(conn, boardNo);
		
		close(conn);
		
		return replyList;
	}
	
	
}
