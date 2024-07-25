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

@WebServlet("/searchIdResult")
public class SearchIdResultServlet extends HttpServlet {

//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String path = "/WEB-INF/views/member/searchIdResult.jsp";
//        req.getRequestDispatcher(path).forward(req, resp);
//
//    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        String path = "/WEB-INF/views/member/searchIdResult.jsp";

        String inputEmail = req.getParameter("inputEmail");
        String inputPhone = req.getParameter("inputPhone");

        System.out.println(inputEmail + inputPhone);
        

        try {
            
            HttpSession session = req.getSession();
            
            
            MemberService service = new MemberService();
            
            Member loginMember = service.searchId(inputEmail, inputPhone);
            
                        
            if(loginMember != null) {
                
                session.setAttribute("message", "찾기 성공");
                
                session.setAttribute("loginMember", loginMember);
                
                req.getRequestDispatcher(path).forward(req, resp);
                
            }else {
                session.setAttribute("message", "찾기 실패");
                
                resp.sendRedirect(req.getContextPath()+ "/searchId");
            }
            
            
        }catch (Exception e){
            e.printStackTrace();
            
        }
    }
    
    
}