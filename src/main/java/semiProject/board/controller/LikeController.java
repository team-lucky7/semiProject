package semiProject.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semiProject.board.model.service.LikeService;

@WebServlet("/like/*")
public class LikeController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = uri.substring((contextPath + "/like/").length());
		
		LikeService service = new LikeService();
		
		try {
			if(command.equals("insert")) {
				int boardReplyNo = Integer.parseInt(req.getParameter("boardReplyNo"));
				int memberNo = Integer.parseInt(req.getParameter("memberNo"));
				
				int result = service.insertLike(boardReplyNo, memberNo);
				
				resp.getWriter().print(result);
			}
			
			if(command.equals("delete")) {
				int boardReplyNo = Integer.parseInt(req.getParameter("boardReplyNo"));
				int memberNo = Integer.parseInt(req.getParameter("memberNo"));
				
				int result = service.deleteLike(boardReplyNo, memberNo);
				
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
