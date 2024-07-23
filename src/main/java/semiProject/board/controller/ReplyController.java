package semiProject.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import semiProject.board.model.service.ReplyService;
import semiProject.board.model.vo.Reply;
import semiProject.member.model.vo.Member;

@WebServlet("/reply/*")
public class ReplyController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = uri.substring((contextPath + "/reply/").length());
		
		HttpSession session = req.getSession();
		Member loginMember= (Member)session.getAttribute("loginMember");
		
		ReplyService service = new ReplyService();
		
		try {
			if(command.equals("selectReplyList")) {
				int boardNo = Integer.parseInt(req.getParameter("boardNo"));
				
				List<Reply> replyList = service.selectReplyList(boardNo, loginMember);
				
				new Gson().toJson(replyList, resp.getWriter());
			}
			
			if(command.equals("insert")) {
				String replyContent = req.getParameter("replyContent");
				int memberNo = Integer.parseInt(req.getParameter("memberNo"));
				int boardNo = Integer.parseInt(req.getParameter("boardNo"));
				
				// Reply 객체를 생성해서 파라미터 담기
				Reply reply = new Reply();
				reply.setReplyContent(replyContent);
				reply.setMemberNo(memberNo);
				reply.setBoardNo(boardNo);
				
				// 댓글 등록 서비스 호출 후 결과 반환 받기
				int result = service.insertReply(reply);
				
				// 서비스 호출 결과를 그대로 응답 데이터로 내보내기
				resp.getWriter().print(result);
			}
			
			if(command.equals("delete")) {
				int replyNo = Integer.parseInt(req.getParameter("replyNo"));
				
				int result = service.deleteReply(replyNo);
				
				resp.getWriter().print(result);
			}
			
			if(command.equals("update")) {
				int replyNo = Integer.parseInt(req.getParameter("replyNo"));
				String replyContent = req.getParameter("replyContent");
				
				int result = service.updateReply(replyNo, replyContent);
				
				resp.getWriter().print(result);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
}
