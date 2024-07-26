package semiProject.member.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import semiProject.common.MyRenamePolicy;
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
		
		try {
			int maxSize = 1024 * 1024 * 100;
			
			HttpSession session = req.getSession();
			
			
			String root = session.getServletContext().getRealPath("/");
			String folderPath = "/resources/images/memberProfile/";
			String filePath = root + folderPath;
			
			String encoding = "UTF-8";
			
			MultipartRequest mpRep = new MultipartRequest(req, filePath, maxSize, encoding, new MyRenamePolicy());
			
			Member loginMember = (Member)session.getAttribute("loginMember");
			int memberNo = loginMember.getMemberNo();
			
			String memberEmail = mpRep.getParameter("memberEmail");
			String memberTel = mpRep.getParameter("memberTel");
			String profileImage = folderPath + mpRep.getFilesystemName("profileImage");
			
			Member mem = new Member();
			mem.setMemberNo(memberNo);
			mem.setMemberEmail(memberEmail);
			mem.setMemberTel(memberTel);
			mem.setProfileImage(profileImage);
		
			MemberService service = new MemberService();
			
			int result = service.updateMember(mem);
		
			
			if(result > 0) {
				session.setAttribute("message","회원 정보 수정 성공하였습니다.");
				
				loginMember.setMemberEmail(memberEmail);
				loginMember.setMemberTel(memberTel);
				loginMember.setProfileImage(profileImage);
				
			}else {
				session.setAttribute("message", "회원 정보 수정 실패하였습니다.");
			}
			
			resp.sendRedirect(req.getContextPath() + "/myPage/update");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
