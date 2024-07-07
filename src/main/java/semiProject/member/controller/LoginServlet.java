package semiProject.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		
		try {
			
			MemberService service = new MemberService();
			
			Member loginMember = service.login(inputId, inputPw);
			
			HttpSession session = req.getSession();
			
			if(loginMember != null) { // 로그인 성공 시
				
				session.setAttribute("loginMember", loginMember);
				
				session.setAttribute("message", loginMember.getMemberId() + "님 환영합니다.");

				session.setMaxInactiveInterval(3600);
				
				Cookie c = new Cookie("saveId", inputId);
				
				if(req.getParameter("saveId") != null) { // 아이디 저장이 체크된 경우
					c.setMaxAge(60 * 60 * 24 * 30);
				}else {
					c.setMaxAge(0);
				}
				
				c.setPath(req.getContextPath() + "/login");
				
				resp.addCookie(c);
				
				resp.sendRedirect( req.getContextPath() );
				
			}else { //로그인 실패 시
				
				session.setAttribute("message", "아이디 또는 비밀번호가 일치하지 않습니다");

				resp.sendRedirect( req.getContextPath() + "/login" );
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
}
