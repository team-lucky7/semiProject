package semiProject.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semiProject.board.model.service.BoardService;
import semiProject.board.model.service.ReplyService;
import semiProject.board.model.vo.Board;
import semiProject.board.model.vo.Reply;
import semiProject.member.model.vo.Member;

@WebServlet("/myPage/boardList")
public class MyPageBoardListServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			HttpSession session = req.getSession();
			Member loginMember = (Member)session.getAttribute("loginMember");
			
			int memberNo = loginMember.getMemberNo();
			int bCp = Integer.parseInt(req.getParameter("bCp"));
			int rCp = Integer.parseInt(req.getParameter("rCp"));
			
			BoardService service = new BoardService();
			ReplyService service2 = new ReplyService();
			
			List<Board> boardList = service.selectMyBoardList(memberNo, bCp);
			List<Reply> replyList = service2.selectMyReplyList(memberNo, rCp);
			
			req.setAttribute("boardList", boardList);
			req.setAttribute("replyList", replyList);
			
			String path = "/WEB-INF/views/member/myBoardList.jsp";
			
			req.getRequestDispatcher(path).forward(req, resp);
			
			System.out.println(boardList);
			System.out.println(replyList);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
