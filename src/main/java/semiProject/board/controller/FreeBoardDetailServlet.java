package semiProject.board.controller;

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
import semiProject.board.model.vo.BoardDetail;
import semiProject.board.model.vo.Reply;
import semiProject.member.model.vo.Member;

@WebServlet("/freeBoard/detail")
public class FreeBoardDetailServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int boardNo = Integer.parseInt(req.getParameter("no"));
		
		HttpSession session = req.getSession();
		Member loginMember= (Member)session.getAttribute("loginMember");
		
		try {
			BoardService service = new BoardService();
			
			BoardDetail detail = service.selectBoardDetail(boardNo, loginMember);
			
			if(detail != null) {
				List<Reply> replyList = new ReplyService().selectReplyList(boardNo, loginMember);
				req.setAttribute("replyList", replyList);
			}
			
			req.setAttribute("detail", detail);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		String path = "/WEB-INF/views/board/freeBoardDetail.jsp";
		req.getRequestDispatcher(path).forward(req, resp);
	}

}
