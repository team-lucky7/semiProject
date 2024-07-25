package semiProject.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import semiProject.board.model.service.BoardService;
import semiProject.board.model.vo.BoardArticle;
import semiProject.board.model.vo.BoardDetail;
import semiProject.board.model.vo.BoardImage;
import semiProject.common.MyRenamePolicy;
import semiProject.member.model.vo.Member;

@WebServlet("/freeBoard/write")
public class FreeBoardWriteController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String mode = req.getParameter("mode");
			if(mode.equals("update")) {
				int boardNo = Integer.parseInt(req.getParameter("no"));
				
				BoardDetail detail = new BoardService().selectBoardDetail(boardNo, null);
				
				req.setAttribute("detail", detail);
				
			}
			
			String path = "/WEB-INF/views/board/freeBoardWriteForm.jsp";
			req.getRequestDispatcher(path).forward(req, resp);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int maxSize = 1024 * 1024 * 100;
			
			HttpSession session = req.getSession();
			String root = session.getServletContext().getRealPath("/");
			
			String folderPath = "/resources/images/board/";
			String filePath = root + folderPath;
			
			String encoding = "UTF-8";
			
			MultipartRequest mpReq = new MultipartRequest(req, filePath, maxSize, encoding, new MyRenamePolicy());
			
			Enumeration<String> files = mpReq.getFileNames();
			
			List<BoardImage> imageList = new ArrayList<>();
			
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				
				String rename = mpReq.getFilesystemName(name);
				String original = mpReq.getOriginalFileName(name);
				
				if(rename != null) {
					BoardImage image = new BoardImage();
					image.setImageOriginal(original);
					image.setImageRename(folderPath + rename);
					image.setImageLevel(Integer.parseInt(name));
					
					imageList.add(image);
				}
			}
			// * 이미지를 제외한 게시글 관련 정보 *
			int count = Integer.parseInt(mpReq.getParameter("count"));
			
			List<BoardArticle> articleList = new ArrayList<>();
			
			for(int i=0; i<count; i++) {
				if(mpReq.getParameter(i+"") != null) {
					BoardArticle article = new BoardArticle();
					article.setContentLevel(i);
					article.setContent(mpReq.getParameter(i+""));
					article.setContentSize(1);
					
					articleList.add(article);
				}
			}
			
			String boardTitle = mpReq.getParameter("boardTitle");
			
			Member loginMember = (Member)session.getAttribute("loginMember");
			int memberNo = loginMember.getMemberNo();
			
			BoardDetail detail = new BoardDetail();
			detail.setBoardTitle(boardTitle);
			detail.setMemberNo(memberNo);
			// boardCode는 별도 매개변수로 전달 예정
			
			// --------------- 게시글 작성에 필요한 기본 파라미터 얻어오기 완료 ---------------
			BoardService service = new BoardService();
			
			// 모드(insert/update)에 따라서 추가 파라미터 얻어오기 및 서비스 호출
			String mode = mpReq.getParameter("mode");
			
			
			if(mode.equals("insert")) { // 삽입
				
				// 게시글 삽입 서비스 호출 후 결과 반환 받기
				// -> 반환된 게시글 번호를 이용해서 상세조회로 리다이렉트 예정
				int boardNo = service.insertFreeBoard(detail, articleList, imageList);
				
				String path = null;
				if(boardNo > 0) { // 성공
					session.setAttribute("message", "게시글이 등록되었습니다.");
					
					// 등록한 게시글 상세화면
					path = "detail?no=" + boardNo + "&type=3&cp=1";
					
				}else { // 실패
					session.setAttribute("message", "게시글 등록 실패 ㅠㅠ");
					
					// 게시글 작성 화면
					path = "write?mode=" + mode + "&type=3";
				}
				
				resp.sendRedirect(path); // 리다이렉트
			} 
			
			if(mode.equals("update")) {
				int boardNo = Integer.parseInt(mpReq.getParameter("no"));
				
				detail.setBoardNo(boardNo);
				int result = service.updateBoardContent(detail, articleList, imageList);
				
				String path = null;
				if(result > 0) { // 성공
					session.setAttribute("message", "게시글이 수정되었습니다.");
					
					// 등록한 게시글 상세화면
					path = "detail?no=" + boardNo + "&type=3&cp=1";
					
				}else { // 실패
					session.setAttribute("message", "게시글 수정 실패 ㅠㅠ");
					
					// 게시글 작성 화면
					path = "write?mode=" + mode + "&type=3" + "&no=" + boardNo;
				}
				
				resp.sendRedirect(path);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
