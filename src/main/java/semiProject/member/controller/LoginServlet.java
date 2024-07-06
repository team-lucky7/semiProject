package semiProject.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semiProject.member.model.service.MemberService;
import semiProject.member.model.vo.Member;

@WebServlet("/login")
public class LoginServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = "/WEB-INF/views/member/login.jsp";
		req.getRequestDispatcher(path).forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String inputId = req.getParameter("inputId");
		String inputPw = req.getParameter("inputPw");
		
		System.out.println(inputId);
		System.out.println(inputPw);
		
		try {
			
			MemberService service = new MemberService();
			
			Member loginMember = service.login(inputId, inputPw);
			
			if(loginMember != null) { // 로그인 성공 시
				
			}else { //로그인 실패 시
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
}
