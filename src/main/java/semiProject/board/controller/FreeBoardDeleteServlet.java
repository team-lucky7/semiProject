package semiProject.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semiProject.board.model.service.BoardService;

@WebServlet("/freeBoard/delete")
public class FreeBoardDeleteServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int boardNo = Integer.parseInt(req.getParameter("no"));
		int type = Integer.parseInt(req.getParameter("type"));
		
		try {
			BoardService service = new BoardService();
			
			int result = service.deleteBoard(boardNo);
			
			String path = null;
			String message = null;
			HttpSession session = req.getSession();
			
			if(result > 0) {
				message = "게시글이 삭제되었습니다.";
				
				path = "list?type=" + type + "&cp=1";
				
			}else { 
				path = req.getHeader("refere");
			}
			
			session.setAttribute("message", message);
			resp.sendRedirect(path);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
