package semiProject.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semiProject.board.model.service.BoardService;
import semiProject.board.model.vo.BoardDetail;
import semiProject.member.model.vo.Member;

@WebServlet("/region")
public class RegionServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int type = Integer.parseInt(req.getParameter("type"));
		int boardNo = Integer.parseInt(req.getParameter("no") ); 

		HttpSession session = req.getSession();
		Member loginMember= (Member)session.getAttribute("loginMember");
		
		try {
			
			BoardService service = new BoardService();
			
			BoardDetail detail = service.selectRegionList(type,loginMember,boardNo);
			
			req.setAttribute("detail", detail);
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}

		String path = "/WEB-INF/views/region.jsp";
		req.getRequestDispatcher(path).forward(req, resp);
	}

}
