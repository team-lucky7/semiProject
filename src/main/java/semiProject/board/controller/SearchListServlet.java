package semiProject.board.controller;

import java.io.IOException;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/search")
public class SearchListServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String query = req.getParameter("query");
		String reqExp = "^#[\\w\\dㄱ-힣]*$";
		Pattern.matches(reqExp, query);
		String path = "/WEB-INF/views/board/searchBoardList.jsp";
		req.getRequestDispatcher(path).forward(req, resp);
	}
	
}
