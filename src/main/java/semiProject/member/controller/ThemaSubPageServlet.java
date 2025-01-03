package semiProject.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semiProject.board.model.service.BoardService;
import semiProject.board.model.vo.BoardDetail;

@WebServlet("/thema/subPage")
public class ThemaSubPageServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int boardNo = Integer.parseInt(req.getParameter("no"));
			int boardCode = Integer.parseInt(req.getParameter("type"));
			
			BoardService service = new BoardService();
			
			BoardDetail detail = service.selectThemaBoardDetail(boardNo, boardCode);
			
			
			req.setAttribute("detail", detail);
			
			String path = "/WEB-INF/views/thema-subPage.jsp";
			req.getRequestDispatcher(path).forward(req, resp);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	
	
}
