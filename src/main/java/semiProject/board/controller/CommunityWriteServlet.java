package semiProject.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import semiProject.member.model.vo.Member;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import semiProject.board.model.service.BoardService;
import semiProject.board.model.vo.BoardImage;
import semiProject.board.model.vo.BoardArticle;
import semiProject.board.model.vo.BoardDetail;
import semiProject.common.MyRenamePolicy;

@WebServlet("/community/write")
public class CommunityWriteServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			String path="/WEB-INF/views/board/communityWrite.jsp";

			req.getRequestDispatcher(path).forward(req, resp);

		} catch (Exception e) {

			e.printStackTrace();
		}

	}

	@Override  
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			int maxSize = 1024 * 1024 * 100; //업로드 최대용량 100MB
			HttpSession session = req.getSession();
			String root = session.getServletContext().getRealPath("/"); // webapp 까지 경로
			String folderPath ="/resources/images/board/"; // 파일 저장 폴더 경로
			String filePath = root + folderPath;
			String encoding = "UTF-8"; // 문자열 인코딩 			
			MultipartRequest mpReq
			= new MultipartRequest(req, filePath, maxSize, encoding, new MyRenamePolicy());			
			// MultipartRequet.getFileNames()
			// - 요청 파라미터 중 모든 file 타입 태그 name 속성 값을 얻어와
			//   Enumeration 형태로 반환 (Iterator의 과거 버전)
			// --> 해당 객체에 여러 값이 담겨있고 이를 순서대로 얻어오는 방법을 제공
			//	  (보통 순서가 없는 모음(set과 같은 경우)에서 하나씩 꺼낼 때 사용)


			Enumeration<String> files = mpReq.getFileNames();
			// file 타입 태그의 name 속성 0,1,2,3,4가 순서가 섞인 상태로 얻어와짐

			// * 업로드된 이미지의 정보를 모아둘 List 생성
			List<BoardImage> imageList = new ArrayList<>();
			//넘길 값
			
			while(files.hasMoreElements()) { // 다음 요소가 있으면 true
				String name = files.nextElement(); // 다음 요소(name 속성 값)를 얻어옴
				//System.out.println("name : " + name);
				//file 타입 태그의 name 속성값이 얻어와짐
				// + 업로드가 안된 file 타입 태그의 name도 얻어와짐

				String rename = mpReq.getFilesystemName(name);
				String original = mpReq.getOriginalFileName(name);


				if(rename != null) {
					// 업로드된 파일이 있을 경우 == 현재 file에서 얻어온 name 속성을 이용해
					// 원본명 또는 변경명을 얻어왔을 때 그 값이 null이 아닌 경우

					// 이미지 정보를 담은 객체(BoardImage)를 생성
					BoardImage image = new BoardImage();

					image.setImageOriginal(original); // 원본명 (다운로드 시 사용)
					image.setImageRename(folderPath + rename); // 폴더 경로 + 변경명

					// 이미지 name 속성 받아서 타입, 순서로 쪼갠다

					String[] str = name.split("_");

					image.setImageLevel(Integer.parseInt(str[0]));

					if(str[1].equals("fullImage")) image.setImageSize(2);
					else image.setImageSize(3);
					// 큰 이미지 사이즈는 2, 작은 이미지 사이즈는 3

					imageList.add(image); // 리스트 추가
					// 보드 넘버는 DAO에서 next.val 시퀀스로 넣어준다!!

				} // if 끝

			} // while 끝			

			List<BoardArticle> boardArticleList = new ArrayList<>();
			//넘길 값
			Enumeration<String> article = mpReq.getParameterNames();

			while(article.hasMoreElements()) { // 다음 요소가 있으면 true

				String name = article.nextElement();

				BoardArticle boardArticle = new BoardArticle();

				if(name.equals("mapAdr")) { // 지도는 Article에 사이즈 4로 저장한다.
					boardArticle.setContent(mpReq.getParameter("mapAdr")); // 맵 json {위도, 경도, 주소}
					boardArticle.setContentLevel(-1); // 제일 마지막에 출력한다
					boardArticle.setContentSize(4);
					boardArticleList.add(boardArticle);
				}

				if(name.contains("_")) {

					String[] str = name.split("_");

					if(str[1].equals("fullText")||str[1].equals("halfText")) {

						boardArticle.setContent(mpReq.getParameter(name));
						boardArticle.setContentLevel(Integer.parseInt(str[0]));

						if(str[1].equals("fullText")) boardArticle.setContentSize(0);
						else boardArticle.setContentSize(1);
						// 텍스트 큰사이즈 : 0, 작은사이즈 : 1

						boardArticleList.add(boardArticle);
					}
				}
			}

			System.out.println(mpReq.getParameter("mapAdr"));
			String mapAddress = mpReq.getParameter("mapAdr");
			int category = Integer.parseInt(mpReq.getParameter("category")); // 휴양지 4, 맛집 5 코드			
			String subtitle = mpReq.getParameter("inputSubtitle"); // 제목
			String intro = mpReq.getParameter("inputIntro"); // 한줄소개
			String[] hashtag = mpReq.getParameterValues("hashtag"); // 해시태그 배열
			String[] hashtagOptionList = mpReq.getParameterValues("hashtagOption"); // 해시태그 배열
			List<String> hashtagList = new ArrayList<>();
			List<String> hashtagOption = new ArrayList<>();

			if (hashtag!=null) {
				
				for(String hash : hashtag) {
					hashtagList.add(hash.substring(1));
				}
				
				hashtagOption = Arrays.asList(hashtagOptionList);
			}
			// 지도 받기
			
			BoardService service = new BoardService();
			
			String address = null;
			
			System.out.println("mapAddress");
			System.out.println(mapAddress);
			
			//if(mapAddress != null && mapAddress.trim() != "") {

			JSONParser parser = new JSONParser();

			JSONObject jObject = null;

			jObject = (JSONObject)parser.parse(mapAddress);

			address = (String)jObject.get("address"); // 잘 될지 모르겠음

			//System.out.println("주소뽑기 : " + address);

			//} 
			
			Member loginMember = (Member)session.getAttribute("loginMember");

			BoardDetail detail = new BoardDetail();
			int memberNo = loginMember.getMemberNo();

			
			detail.setBoardTitle(subtitle);
			detail.setBoardContent(intro);
			detail.setHashtagList(hashtagList);
			detail.setHashtagOption(hashtagOption);
			detail.setBoardCode(category);
			detail.setMemberNo(memberNo);

			int result = service.communityWrite(boardArticleList, imageList, detail, hashtagList, hashtagOption, address);

			String message = null;
			String path = null;
			if(result > 0 ) {
				message = "커뮤니티 게시글 등록을 완료하였습니다.";
				path = req.getContextPath() + "\\community\\list?type="+ category;

			} else {
				message = "게시글 등록을 완료하지 못하였습니다.";
				path = req.getContextPath() + "\\community\\write";

			}
			
			session.setAttribute("message", message);
			
			resp.sendRedirect(path);

		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}

}
