package semiProject.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/myPage/secession")
public class MyPageSecessionServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String Path = "/WEB-INF/views/member/myPage-secession.jsp";
		
		req.getRequestDispatcher(Path).forward(req, resp);
	}

}
