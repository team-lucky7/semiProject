package semiProject.board.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semiProject.board.model.service.BoardService;
import semiProject.board.model.vo.Board;

@WebServlet("/search")
public class SearchListServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String query = req.getParameter("query");
		
		BoardService service = new BoardService();
		
		try {
			int cp = 1;
			
			if(req.getParameter("cp") != null) {
				cp = Integer.parseInt(req.getParameter("cp"));
			}
			
			System.out.println(cp);

			Map<String, Object> map = service.searchBoardList(cp, query);
			
			System.out.println(map);
			
			req.setAttribute("map", map);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		String path = "/WEB-INF/views/board/searchBoardList.jsp";
		req.getRequestDispatcher(path).forward(req, resp);
	}
	
}
