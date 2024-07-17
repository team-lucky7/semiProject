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

@WebServlet("/myPage/secession")
public class MyPageSecessionServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String Path = "/WEB-INF/views/member/myPage-secession.jsp";
		
		req.getRequestDispatcher(Path).forward(req, resp);
	}
	
		
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String memberPw = req.getParameter("memberPw");
		
		HttpSession session = req.getSession();
		
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		int memberNo = loginMember.getMemberNo();
		
		
		try {
			
			MemberService service = new MemberService();
			
			int result = service.secession(memberPw,memberNo);
			
			
			String path = null;
			
			if(result > 0) {
				
				session.invalidate();

				session = req.getSession();
				
				session.setAttribute("message", "회원 탈퇴가 완료되었습니다.");
				
				path = req.getContextPath();
				
				Cookie c = new Cookie("saveId","");
				
				c.setMaxAge(0); 
				c.setPath(req.getContextPath() + "/login"); 
				resp.addCookie(c);
				
			} else {
				
				session.setAttribute("message", "비밀번호가 일치하지 않습니다.");
				
				path = "secession";
				
			}
			
			resp.sendRedirect(path);
			
		} catch(Exception e) {
			
			e.printStackTrace();
		}
		
	}

}
