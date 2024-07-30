package semiProject.board.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semiProject.board.model.service.BoardService;

@WebServlet("")
public class indexServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			BoardService service = new BoardService();
			
			Map<String, Object> map = service.selectBoardList(3, 1);
			Map<String, Object> map2 = service.selectBoardList(4, 1);
			
			Map<String, Object> wordMap = service.selectPopualrWordList();
			
			req.setAttribute("map", map);
			req.setAttribute("map2", map2);
			
			HttpSession session = req.getSession();
			session.setAttribute("wordMap", wordMap);
			
			String path = "/index.jsp";
			
			req.getRequestDispatcher(path).forward(req, resp);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
