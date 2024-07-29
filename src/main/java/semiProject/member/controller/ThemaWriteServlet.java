package semiProject.member.controller;

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

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.oreilly.servlet.MultipartRequest;

import semiProject.member.model.vo.Member;
import semiProject.board.model.service.BoardService;
import semiProject.board.model.vo.BoardDetail;
import semiProject.board.model.vo.BoardImage;
import semiProject.common.MyRenamePolicy;

@WebServlet("/thema/themaWrite")
public class ThemaWriteServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String mode = req.getParameter("mode");

			if (mode.equals("update")) {

				int boardNo = Integer.parseInt(req.getParameter("no"));
				int boardCode = Integer.parseInt(req.getParameter("type"));

				BoardService service = new BoardService();

				// 게시글 정보 + 이미지 + 좌표
				BoardDetail detail = service.selectThemaBoardDetail(boardNo, boardCode);

				detail.setBoardContent(detail.getBoardContent().replace("<br>", "\n"));

				req.setAttribute("detail", detail);

	
			}

			String path = "/WEB-INF/views/themaWrite.jsp";
			req.getRequestDispatcher(path).forward(req, resp);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			int maxSize = 1024 * 1024 * 20 * 5; // 업로드 최대 용량(100MB)
			HttpSession session = req.getSession(); // session은 얻오기 가능! 파라미터는 X
			String root = session.getServletContext().getRealPath("/"); // webapp 폴더까지 경로
			String folderPath = "/resources/images/thema/"; // 파일 저장 폴더 경로
			String filePath = root + folderPath;
			String encoding = "UTF-8";

			MultipartRequest mpReq = new MultipartRequest(req, filePath, maxSize, encoding, new MyRenamePolicy());

			Enumeration<String> files = mpReq.getFileNames();

			List<BoardImage> imageList = new ArrayList<>();

			while (files.hasMoreElements()) {
				String name = files.nextElement();

				String rename = mpReq.getFilesystemName(name);
				String original = mpReq.getOriginalFileName(name);

				if (rename != null) {

					BoardImage image = new BoardImage();
					image.setImageOriginal(original);
					image.setImageRename(folderPath + rename);
					image.setImageLevel(Integer.parseInt(name));

					imageList.add(image);
				} // if문 끝
			} // while문 끝

			String boardTitle = mpReq.getParameter("themaTitle");
			String boardContent = mpReq.getParameter("themaContent");

			String categoryStr = mpReq.getParameter("category");
			int boardCode = Integer.parseInt(categoryStr);

			
			 
			// 카카오맵 좌표, 주소("lat", "lng", "address")
			String mapAddress = mpReq.getParameter("mapAdr");

			String address = null;

			if (mapAddress != null) {

				JSONParser parser = new JSONParser();

				JSONObject jObject = null;

				jObject = (JSONObject) parser.parse(mapAddress);

				address = (String) jObject.get("address");

			}

			Member loginMember = (Member) session.getAttribute("loginMember");
			int memberNo = loginMember.getMemberNo(); // 회원번호

			// 게시글 관련 정보를 하나의 객체(BoardDetail)에 담기
			BoardDetail detail = new BoardDetail();

			detail.setBoardTitle(boardTitle);
			detail.setBoardContent(boardContent);
			detail.setMemberNo(memberNo);
			detail.setMapAddress(mapAddress);
			detail.setLocationName(address);
			// boardCode 매개변수로 전달 
			
			BoardService service = new BoardService();
			
			// insert/update
			String mode = mpReq.getParameter("mode"); 
			
			if(mode.equals("insert")) { // 삽입
				
				// 게시글 삽입 서비스 호출 후 결과 반환 받기
				// -> 반환된 게시글 번호를 이용해서 상세조회로 리다이렉트 예정
				int boardNo = service.insertThemaBoard(detail, imageList, boardCode);
				
				
				
				String path = null;
				if (boardNo > 0) { // 성공
					session.setAttribute("message", "게시글이 등록되었습니다.");

					path = "subPage?no=" + boardNo + "&type=" + boardCode;
				} else { // 실패
					session.setAttribute("message", "게시글 등록에 실패했습니다.");

					path = "themaWrite?mode=" + mode + "&type=" + boardCode;
				}

				resp.sendRedirect(path);
			}

			if (mode.equals("update")) { //
				

				int boardNo = Integer.parseInt(mpReq.getParameter("no"));
				
				categoryStr = mpReq.getParameter("category");
				boardCode = Integer.parseInt(categoryStr);


				String deleteList = mpReq.getParameter("deleteList"); 
				
				detail.setBoardNo(boardNo);
				detail.setBoardCode(boardCode);

				// detail, imageList, deleteList
				int result = service.updateThemaBoard(detail, imageList, deleteList);

				String path = "";
				String message = "";
				if (result > 0) {
					message = "게시글이 수정되었습니다.";
					path = "subPage?no=" + boardNo + "&type=" + boardCode;

				} else {
					path = req.getHeader("referer");
					message = "게시글 수정에 실패했습니다.";
					/* path = "themaWrite?mode=" + mode + "&type=" + boardCode; */

				}
				resp.sendRedirect(path);
				session.setAttribute("message", message);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
