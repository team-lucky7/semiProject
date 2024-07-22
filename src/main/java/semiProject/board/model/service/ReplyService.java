package semiProject.board.model.service;

import java.sql.Connection;
import java.util.List;

import semiProject.board.model.dao.ReplyDAO;
import semiProject.board.model.vo.Reply;
import semiProject.member.model.vo.Member;

import static semiProject.common.JDBCTemplate.*;

public class ReplyService {
	
	private ReplyDAO dao = new ReplyDAO();

	/** 댓글 목록 조회 Service
	 * @param boardNo
	 * @param loginMember 
	 * @return replyList
	 * @throws Exception
	 */
	public List<Reply> selectReplyList(int boardNo, Member loginMember) throws Exception{
		
		Connection conn = getConnection();
		
		List<Reply> replyList = dao.selectReplyList(conn, boardNo);
		
		if(!replyList.isEmpty() && loginMember != null) {
			for(Reply r : replyList) {
				int result = dao.getIsLike(conn, r.getReplyNo(), loginMember.getMemberNo());
				
				if(result > 0) {
					r.setLike(true);
				}
			}
		}
		
		close(conn);
		
		return replyList;
	}
	
	
}
