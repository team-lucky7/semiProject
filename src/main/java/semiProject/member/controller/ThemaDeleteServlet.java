package semiProject.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semiProject.board.model.service.BoardService;



@WebServlet("/thema/delete")
public class ThemaDeleteServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BoardService service = new BoardService();

		try {
			int type = Integer.parseInt(req.getParameter("type"));
			int no = Integer.parseInt(req.getParameter("no"));

			int result = service.deleteThemaBoard(no);
			
			
			String message ="";
			String path="";
			HttpSession session = req.getSession();
			
			if(result>0) {
				message = "게시글이 삭제 되었습니다.";
				path = "list?type=" + type;
				
				
			}else {
				message = "게시글 삭제에 실패했습니다.";
				path = req.getHeader("referer");
			}
			
			session.setAttribute("message", message);
			resp.sendRedirect(path);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	
	

}
