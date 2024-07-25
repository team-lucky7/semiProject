package semiProject.board.model.service;

import java.sql.Connection;
import java.util.List;

import semiProject.board.model.dao.ReplyDAO;
import semiProject.board.model.vo.Pagination;
import semiProject.board.model.vo.Reply;
import semiProject.common.Utill;
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

	/** 댓글 등록 Service
	 * @param reply
	 * @return result
	 * @throws Exception
	 */
	public int insertReply(Reply reply) throws Exception {
		
		Connection conn = getConnection();
		
		reply.setReplyContent(Utill.XSSHandling(reply.getReplyContent()));
		reply.setReplyContent(Utill.newLineHandling(reply.getReplyContent()));
		
		int result = dao.insertReply(conn, reply);
		
		if(result > 0)	commit(conn);
		else			rollback(conn);
		
		close(conn);
		
		return result;
	}

	/** 댓글 삭제 Service
	 * @param replyNo
	 * @return result
	 * @throws Exception
	 */
	public int deleteReply(int replyNo) throws Exception {
		
		Connection conn = getConnection();
		
		int result = dao.deleteReply(conn, replyNo);
		
		if(result > 0)	commit(conn);
		else			rollback(conn);
		
		close(conn);
		
		return result;
	}

	/** 댓글 수정 Service
	 * @param replyNo
	 * @param replyContent
	 * @return result
	 * @throws Exception
	 */
	public int updateReply(int replyNo, String replyContent) throws Exception {
		
		Connection conn = getConnection();
		
		replyContent = Utill.XSSHandling(replyContent);
		replyContent = Utill.newLineHandling(replyContent);
		
		int result = dao.updateReply(conn, replyNo, replyContent);
		
		if(result > 0)	commit(conn);
		else			rollback(conn);
		
		close(conn);
		
		return result;
	}

	/** 내가 작성한 전체 댓글의 일정한 범위 목록 조회 Service
	 * @param memberNo
	 * @param rCp
	 * @return replyList
	 * @throws Exception
	 */
	public List<Reply> selectMyReplyList(int memberNo, int rCp) throws Exception {
		
		Connection conn = getConnection();
		
		int listCount = dao.getMyReplyListCount(conn, memberNo);
		
		Pagination pagination = new Pagination(rCp, listCount);
		pagination.setLimit(5);
		
		List<Reply> replyList = dao.selectMyReplyList(conn, memberNo, pagination);
		
		close(conn);
		
		return replyList;
	}
	
	
}
