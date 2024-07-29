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

@WebServlet("/regionWrite")
public class RegionWriteControllerServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String mode = req.getParameter("mode");

			String path = "/WEB-INF/views/regionWrite.jsp";
			
			req.getRequestDispatcher(path).forward(req, resp);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			int maxSize = 1024 * 1024 * 100;

			HttpSession session = req.getSession(); 

			String root = session.getServletContext().getRealPath("/"); 

			String folderPath = "/resources/images/region/"; 

			String filePath = root + folderPath;

			String encoding = "UTF-8"; 


			MultipartRequest mpReq = new MultipartRequest(req, filePath, maxSize, encoding, new MyRenamePolicy());


			Enumeration<String> files = mpReq.getFileNames();

			List<BoardImage> imageList = new ArrayList<>();

			while (files.hasMoreElements()) {
				String name = files.nextElement();


				String rename = mpReq.getFilesystemName(name); // 변경된 파일명
				String original = mpReq.getOriginalFileName(name); // 원본 파일명


				if (rename != null) {

					BoardImage image = new BoardImage();
					image.setImageOriginal(original); // 원본명 (다운로드 시 사용)
					image.setImageRename(folderPath + rename); // 폴더 경로 + 변경명
					image.setImageLevel(Integer.parseInt(name)); // 이미지 위치(0은 썸네일)

					imageList.add(image); // 리스트에 추가

				} // if문 끝
			} // while문 끝

			// * 이미지를 제외한 게시글 관련 정보 *
			String boardTitle = mpReq.getParameter("regionBoardTitle");
			String boardContent = mpReq.getParameter("boardContent");
			String content = mpReq.getParameter("regionContent");
			String category = mpReq.getParameter("category");
			String locationCode = mpReq.getParameter("locationCode");
			
			int boardCode = Integer.parseInt(category); 

			Member loginMember = (Member) session.getAttribute("loginMember");
			int memberNo = loginMember.getMemberNo(); // 회원 번호

			// 게시글 관련 정보를 하나의 객체(BoardDetail)에 담기
			BoardDetail detail = new BoardDetail();
			BoardArticle article = new BoardArticle();
			
			
			article.setContent(content);
			detail.setBoardTitle(boardTitle);
			detail.setBoardContent(boardContent);
			detail.setLocationName(locationCode);
			detail.setMemberNo(memberNo);
			
			BoardService service = new BoardService();

			String mode = mpReq.getParameter("mode"); // hidden

			if (mode.equals("insert")) { // 삽입

				int boardNo = service.regioninsertBoard(detail, imageList, boardCode, article);

				String path = null;

				if (boardNo > 0) { // 성공
					session.setAttribute("message", "게시글이 등록되었습니다.");

					path = "regionSubpage/detail?no=" + boardNo + "&type=" + boardCode;

				} else {
					session.setAttribute("message", "게시글 등록 실패 ㅠㅠ");

					path = "regionWrite?mode=" + mode + "&type=" + boardCode;

				}

				resp.sendRedirect(path); // 리다이렉트
			}

			if (mode.equals("update")) { // 수정


				int boardNo = Integer.parseInt(mpReq.getParameter("no"));
				String deleteList = mpReq.getParameter("deleteList"); 


				detail.setBoardNo(boardNo);

				int result = service.updateBoard(detail, imageList, deleteList);

				String path = null;
				String message = null;

				if (result > 0) { 

					message = "게시글이 수정되었습니다.";
					
					path = "detail?no=" + boardNo + "&type=" + boardCode;
							
				} else { // 실패

					path = req.getHeader("referer");

					message = "게시글이 수정에 실패하였습니다.";

				}
				session.setAttribute("message", message);

				resp.sendRedirect(path);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
