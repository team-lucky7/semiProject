package semiProject.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semiProject.board.model.service.BoardService;
import semiProject.board.model.vo.BoardArticle;
import semiProject.board.model.vo.BoardDetail;
import semiProject.member.model.vo.Member;

@WebServlet("/regionSubpage/detail")
public class RegionSubPageServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
				int boardNo = Integer.parseInt(req.getParameter("no"));
				HttpSession session = req.getSession();
				Member loginMember= (Member)session.getAttribute("loginMember");
				
				BoardDetail detail = new BoardService().selectRegionBoardDetail(boardNo,loginMember);

				req.setAttribute("detail", detail);

				

		} catch (Exception e) {
			e.printStackTrace();
		}
		req.getRequestDispatcher("/WEB-INF/views/regionSubPage.jsp").forward(req, resp);
	}
	
}
