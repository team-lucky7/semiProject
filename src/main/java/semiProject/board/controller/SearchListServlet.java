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

@WebServlet("/search")
public class SearchListServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String query = req.getParameter("query");
		String reqExp = "^#[\\w\\dㄱ-힣]*$";
		
		BoardService service = new BoardService();
		
		try {
			List<Map<String, Object>> mapList = null;
			
			if(Pattern.matches(reqExp, query)) {
				mapList = service.searchHashtag(query);
			}else {
				mapList = service.searchKeyword(query);
			}
			
			req.setAttribute("mapList", mapList);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		String path = "/WEB-INF/views/board/searchBoardList.jsp";
		req.getRequestDispatcher(path).forward(req, resp);
	}
	
}
