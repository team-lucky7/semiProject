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
import semiProject.board.model.vo.Board;
import semiProject.board.model.vo.BoardDetail;
import semiProject.member.model.vo.Member;

@WebServlet("/region")
public class RegionServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			
			String type = "10, 11 , 12 ,13 ,14 ,15, 16";
			
			BoardService service = new BoardService();
			
			List<Board> boardList = service.searchRegionBoardList(type);
			
			int boardNo = Integer.parseInt(req.getParameter("no"));
			
			BoardDetail detail = new BoardService().selectRegionBoardDetail(boardNo);
			
			req.setAttribute("boardList", boardList);
			req.setAttribute("detail", detail);

			System.out.println(detail);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String path = "/WEB-INF/views/region.jsp";
		req.getRequestDispatcher(path).forward(req, resp);
	}

}
