package semiProject.board.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semiProject.board.model.service.BoardService;
import semiProject.board.model.vo.Board;

@WebServlet("/freeBoard/list")
public class FreeBoardListServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String path = "/WEB-INF/views/board/freeBoardList.jsp";
			
			int type = Integer.parseInt(req.getParameter("type"));
			int cp = Integer.parseInt(req.getParameter("cp"));
			
			BoardService service = new BoardService();
			
			Map<String, Object> map = service.selectBoardList(type, cp);
			
			req.setAttribute("map", map);
			req.getRequestDispatcher(path).forward(req, resp);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
