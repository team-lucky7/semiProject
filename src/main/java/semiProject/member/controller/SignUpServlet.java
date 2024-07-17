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

@WebServlet("/signUp")
public class SignUpServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = "/WEB-INF/views/member/signUp.jsp";
		req.getRequestDispatcher(path).forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String memberId = req.getParameter("memberId");
	    String memberPw = req.getParameter("memberPw");
	    String memberName = req.getParameter("memberName");
	    String memberDOB = req.getParameter("memberDOB");
	    String memberGender = req.getParameter("memberGender");
	    String memberEmail = req.getParameter("memberEmail");
	    String memberTel = req.getParameter("memberTel");
	    
	    Member mem = new Member();
	    
	    mem.setMemberId(memberId);
	    mem.setMemberPw(memberPw);
	    mem.setMemberName(memberName);
	    mem.setMemberDOB(memberDOB);
	    mem.setMemberGender(memberGender);
	    mem.setMemberEmail(memberEmail);
	    mem.setMemberTel(memberTel);
	    
	    try {
	    	MemberService service = new MemberService();
	    	
	    	int result = service.signUp(mem);
	    	
    		HttpSession session =req.getSession();
			
    		String path = null;
    		
			if(result>0) {
				
				session.setAttribute("message",	"회원 가입 성공!");
				path = req.getContextPath();
				
			} else {
				
				session.setAttribute("message", "회원 가입 실패!");
				path = req.getContextPath() + "/signUp";
			}
			
			resp.sendRedirect(path);
	    	
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
	}
	
}
