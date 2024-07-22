package semiProject.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semiProject.member.model.service.MemberService;
import semiProject.member.model.vo.Member;

@WebServlet("/myPage/changePw")
public class MyPageChangePwServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String path = "/WEB-INF/views/member/myPage-changePw.jsp";
		
		req.getRequestDispatcher(path).forward(req, resp);
		
	}
	

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String currentPw = req.getParameter("currentPw");
		String newPw = req.getParameter("newPw");
		
		HttpSession session = req.getSession();
		
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		int memberNo = loginMember.getMemberNo(); 
		
		try {

			MemberService service = new MemberService();

			int result = service.changePw(currentPw,newPw,memberNo);


			if (result > 0) { 
				
				session.setAttribute("message", "비밀번호 변경되었습니다.");

				
				resp.sendRedirect(req.getContextPath() + "");
				
			} else { 
				session.setAttribute("message", "현재 비밀번호가 일치하지 않습니다.");

				resp.sendRedirect(req.getContextPath() + "/myPage/changePw");
			}


		} catch (Exception e) {

			e.printStackTrace();
		}
		
		
	}
}
