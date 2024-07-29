package semiProject.board.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semiProject.board.model.service.BoardService;

@WebServlet("/community/list")
public class CommunityListServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//String path = "/WEB-INF/views/community.jsp";
		
		//req.getRequestDispatcher(path).forward(req, resp);
		try {
			
			// board/list?type, CP ** 헤더에서 지정해 주어야 함!!
			
			
			int type = Integer.parseInt(req.getParameter("type"));
			// 4 -> 휴양지  ,, 5 -> 맛집
			
			// board/list?type
			// 쿼리스트링에 cp가 없음 --> cp 1로 고정
			int cp = 1;
			
			
			// 페이지네이션의 번호 선택 시
			// 쿼리스트링에 cp가 있음 --> cp = 쿼리스트링의 cp값
			if(req.getParameter("cp") != null) {
			 cp = Integer.parseInt(req.getParameter("cp"));
			}
			
			BoardService service = new BoardService();
			
			// 게시판 이름, 페이지네이션 객체, 게시글 리스트를 한 번에 반환하는 Service 호출
			Map<String, Object> map = null; 
					
			map = service.selectBoardList(type, cp);
			
			req.setAttribute("map", map);
			
			req.getRequestDispatcher("/WEB-INF/views/community.jsp").forward(req, resp);			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}