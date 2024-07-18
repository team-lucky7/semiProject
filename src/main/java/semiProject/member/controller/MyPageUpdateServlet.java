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

@WebServlet("/myPage/update")
public class MyPageUpdateServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String path = "/WEB-INF/views/member/myPageUpdate.jsp";
		
		req.getRequestDispatcher(path).forward(req, resp);
	}
	
	@Override
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String memberEmail = req.getParameter("memberEmail");
		String memberTel = req.getParameter("memberTel");
		
		HttpSession session = req.getSession();
		
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		int memberNo = loginMember.getMemberNo(); 
		
		
		try {
			
			MemberService service = new MemberService();

			int result = service.updateMember(memberEmail,memberTel,memberNo);
		
			
			if(result > 0) {
				
				session.setAttribute("message","회원 정보 수정 성공하였습니다.");
				
				loginMember.setMemberEmail(memberEmail);
				loginMember.setMemberTel(memberTel);
				
			}else {
				
				session.setAttribute("message", "회원 정보 수정 실패하였습니다.");
			}
			
			resp.sendRedirect(req.getContextPath() + "/myPage/update");
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
