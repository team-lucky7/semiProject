package semiProject.member.controller;

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



@WebServlet("/thema/list")
public class ThemaServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {

			String type = " 6, 7, 8, 9 ";
			BoardService service = new BoardService();			
			List<Board> boardList = service.selectThemaBoardList(type);
		
			
			req.setAttribute("boardList", boardList);
			
			req.getRequestDispatcher("/WEB-INF/views/thema.jsp").forward(req, resp);
			
			for(Board board : boardList) {
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
