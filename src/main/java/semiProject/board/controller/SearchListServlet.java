package semiProject.board.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.net.URLDecoder;

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
			
			Map<String, Object> map = service.searchBoardList(cp, query);
			
			req.setAttribute("map", map);
			
			String recent = "";
			
			Cookie[] cookies = req.getCookies();
			for(Cookie cookie : cookies) {
				if(cookie.getName().equals("query")) {
					recent += URLDecoder.decode(cookie.getValue(), "UTF-8");
				}
			}
			
			if(recent.indexOf(query) == -1) {
				if(!recent.equals("")) {
					recent += "||";
				}
				
				if(!query.equals("")) {
					recent += query;
				}
			}
			
			Cookie c = new Cookie("query", URLEncoder.encode(recent, "UTF-8").replaceAll("\\+", "%20"));
			
			c.setMaxAge(60 * 60 * 24 * 30);
			
			c.setDomain("localhost");
			
			resp.addCookie(c);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		String path = "/WEB-INF/views/board/searchBoardList.jsp";
		req.getRequestDispatcher(path).forward(req, resp);
	}
	
}
