package semiProject.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semiProject.board.model.service.BoardService;
import semiProject.board.model.service.ReplyService;
import semiProject.board.model.vo.BoardDetail;
import semiProject.board.model.vo.Reply;

@WebServlet("/community/detail")
public class CommunityDetailServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int boardNo = Integer.parseInt(req.getParameter("no"));
		// 4 또는 5
		
		try {
			BoardService service = new BoardService();
			
			BoardDetail detail = service.selectBoardDetail(boardNo);
			
			if(detail != null) {
				List<Reply> replyList = new ReplyService().selectReplyList(boardNo);
				req.setAttribute("replyList", replyList);
			}
			
			req.setAttribute("detail", detail);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		String path = "/WEB-INF/views/board/coummunityDetail.jsp";
		req.getRequestDispatcher(path).forward(req, resp);
	}

}
