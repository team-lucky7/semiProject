package semiProject.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import semiProject.board.model.service.BoardService;
import semiProject.board.model.vo.Board;
import semiProject.board.model.vo.BoardArticle;
import semiProject.board.model.vo.BoardDetail;
import semiProject.member.model.vo.Member;

@WebServlet("/region")
public class RegionServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			
			int type = Integer.parseInt(req.getParameter("type"));
			
			BoardService service = new BoardService();
			
			List<BoardDetail> boardList = service.selectRegionList(type);
			
			req.setAttribute("boardList", boardList);
			
			String path = "/WEB-INF/views/region.jsp";
			
			req.getRequestDispatcher(path).forward(req, resp);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
