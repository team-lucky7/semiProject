package semiProject.board.model.dao;

import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import semiProject.board.model.vo.Board;
import semiProject.board.model.vo.BoardArticle;
import semiProject.board.model.vo.BoardDetail;
import semiProject.board.model.vo.BoardImage;
import semiProject.board.model.vo.Hashtag;
import semiProject.board.model.vo.Like;
import semiProject.board.model.vo.Pagination;

import static semiProject.common.JDBCTemplate.*;

public class BoardDAO {

	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private Properties prop;

	public BoardDAO() {
		try {
			prop = new Properties();

			String path = BoardDAO.class.getResource("/semiProject/sql/board-sql.xml").getPath();
			prop.loadFromXML(new FileInputStream(new File(path)));

		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 게시판 이름 조회 DAO
	 * 
	 * @param conn
	 * @param type
	 * @return boardName
	 * @throws Exception
	 */
	public String selectBoardName(Connection conn, int type) throws Exception {

		String boardName = null;

		try {
			String sql = prop.getProperty("selectBoardName");

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, type);

			rs = pstmt.executeQuery();

			if(rs.next()) {
				boardName = rs.getString("BOARD_NM");
			}

		}finally {
			close(rs);
			close(pstmt);
		}

		return boardName;
	}


	/** 특정 게시판의 전체 게시글 수 조회 DAO

	 * @param conn
	 * @param type
	 * @param cp
	 * @return listCount
	 * @throws Exception
	 */
	public int getListCount(Connection conn, int type) throws Exception {
		int listCount = 0;

		try {
			String sql = prop.getProperty("getListCount");

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, type);

			rs = pstmt.executeQuery();

			if(rs.next()) {
				listCount = rs.getInt("COUNT(*)");
			}

		}finally {
			close(rs);
			close(pstmt);
		}

		return listCount;
	}

	/**
	 * 특정 게시판에서 일정한 범위의 목록 조회 DAO
	 * 
	 * @param conn
	 * @param type
	 * @param pagination
	 * @return boardList
	 * @throws Exception
	 */
	public List<Board> selectBoardList(Connection conn, int type, Pagination pagination) throws Exception {
		List<Board> boardList = new ArrayList<>();

		try {
			String sql = prop.getProperty("selectBoardList");

			int start = (pagination.getCurrentPage() - 1) * pagination.getLimit() + 1;
			int end = start + pagination.getLimit() - 1;

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, type);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);

			rs = pstmt.executeQuery();

			while(rs.next()) {
				Board board = new Board();
				board.setBoardNo(rs.getInt("BOARD_NO"));
				board.setBoardTitle(rs.getString("BOARD_TITLE"));
				board.setBoardContent(rs.getString("BOARD_CONTENT"));
				board.setMemberName(rs.getString("MEMBER_NM"));
				board.setLocationName(rs.getString("LOCATION_NM"));
				board.setCreateDate(rs.getString("CREATE_DT"));
				board.setReadCount(rs.getInt("READ_COUNT"));
				board.setLikeCount(rs.getInt("LIKE_COUNT"));
				board.setThumbnail(rs.getString("THUMBNAIL"));
				
				boardList.add(board);
			}

		}finally {
			close(rs);
			close(pstmt);
		}

		return boardList;
	}

	// community query 검색 결과 반영 용
	public List<BoardDetail> selectCommunityBoardList(Connection conn, int type, Pagination pagination, String query) throws Exception {
		List<BoardDetail> boardList = new ArrayList<>();

		try {
			String sql = prop.getProperty("selectBoardListQuery");

			int start = (pagination.getCurrentPage() - 1) * pagination.getLimit() + 1;
			int end = start + pagination.getLimit() - 1;

			System.out.println(type);
			System.out.println(start);
			System.out.println(end);
			
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, type);
			pstmt.setString(2, query);
			pstmt.setInt(3, start);
			pstmt.setInt(4, end);

			
			
			rs = pstmt.executeQuery();

			while(rs.next()) {
				BoardDetail board = new BoardDetail();
				board.setBoardNo(rs.getInt("BOARD_NO"));
				board.setBoardTitle(rs.getString("BOARD_TITLE"));
				board.setBoardContent(rs.getString("BOARD_CONTENT"));
				board.setMemberName(rs.getString("MEMBER_NM"));
				board.setLocationName(rs.getString("LOCATION_NM"));
				board.setCreateDate(rs.getString("CREATE_DT"));
				board.setReadCount(rs.getInt("READ_COUNT"));
				board.setLikeCount(rs.getInt("LIKE_COUNT"));
				System.out.println("보드");
				System.out.println(board);
				
				boardList.add(board);
			}

		}finally {
			close(rs);
			close(pstmt);
		}

		return boardList;
	}
	
	
	
	
	/** 게시글 상세조회 DAO
	 * @param conn
	 * @param boardNo
	 * @return detail
	 * @throws Exception
	 */
	public BoardDetail selectBoardDetail(Connection conn, int boardNo) throws Exception {
		BoardDetail detail = null;

		try {
			String sql = prop.getProperty("selectBoardDetail");

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);

			rs = pstmt.executeQuery();

			if(rs.next()) {
				detail = new BoardDetail();

				detail.setBoardNo(rs.getInt("BOARD_NO"));
				detail.setBoardName(rs.getString("BOARD_NM"));
				detail.setBoardTitle(rs.getString("BOARD_TITLE"));
				detail.setBoardTitle(rs.getString("BOARD_CONTENT"));
				detail.setProfileImage(rs.getString("PROFILE_IMG"));
				detail.setMemberName(rs.getString("MEMBER_NM"));
				detail.setBoardCode(rs.getInt("BOARD_CD"));
				detail.setCreateDate(rs.getString("CREATE_DT"));
				detail.setUpdateDate(rs.getString("UPDATE_DT"));
				detail.setReadCount(rs.getInt("READ_COUNT"));
				detail.setMemberNo(rs.getInt("MEMBER_NO"));
				detail.setLocationName(rs.getString("LOCATION_NM"));
				detail.setLikeCount(rs.getInt("LIKE_COUNT"));
			}

	
		}finally {
			close(rs);
			close(pstmt);
		}

		return detail;
	}

	/** 게시글 내용(글) 조회 DAO
	 * @param conn
	 * @param boardNo
	 * @return articleList
	 * @throws Exception
	 */
	public List<BoardArticle> selectBoardArticle(Connection conn, int boardNo) throws Exception {
		List<BoardArticle> articleList = new ArrayList<>();

		try {
			String sql = prop.getProperty("selectBoardArticle");

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);

			rs = pstmt.executeQuery();

			while(rs.next()) {
				BoardArticle article = new BoardArticle();

				article.setContentNo(rs.getInt("BOARD_CT_NO"));
				article.setContent(rs.getString("CONTENT"));
				article.setContentSize(rs.getInt("CONTENT_SIZE"));
				article.setContentLevel(rs.getInt("CONTENT_LEVEL"));


				articleList.add(article);
			}

		}finally {
			close(rs);
			close(pstmt);
		}

		return articleList;
	}

	/** 게시글 내용(사진) 조회 DAO
	 * @param conn
	 * @param boardNo
	 * @return imageList
	 * @throws Exception
	 */
	public List<BoardImage> selectBoardImage(Connection conn, int boardNo) throws Exception {
		List<BoardImage> imageList = new ArrayList<>();

		try {
			String sql = prop.getProperty("selectBoardImage");

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);

			rs = pstmt.executeQuery();

			while(rs.next()) {
				BoardImage image = new BoardImage();

				image.setImageNo(rs.getInt("IMG_NO")); 
				image.setImageSize(rs.getInt("IMG_SIZE"));
				image.setImageRename(rs.getString("IMG_RENAME"));
				image.setImageOriginal(rs.getString("IMG_ORIGINAL"));
				image.setImageLevel(rs.getInt("IMG_LEVEL"));
				imageList.add(image);
			}

		}finally {
			close(rs);
			close(pstmt);
		}

		return imageList;
	}

	public int getSearchListCount(Connection conn, String query) throws Exception {
		
		int listCount = 0;
		query = "%" + query + "%";
		
		try {
			String sql = prop.getProperty("getSearchListCount");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, query);
			pstmt.setString(2, query);
			pstmt.setString(3, query);
			pstmt.setString(4, query);
			pstmt.setString(5, query);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				listCount = rs.getInt(1);
			}

		}finally {
			close(rs);
			close(pstmt);
		}
		
		return listCount;
	}

	public int getHashtagSearchListCount(Connection conn, int type, String query) throws Exception {
		
		int listCount = 0;
		
		try {
			String sql = prop.getProperty("getHashtagSearchListCount");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, type);
			pstmt.setString(2, query);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				listCount = rs.getInt(1);
			}

		}finally {
			close(rs);
			close(pstmt);
		}
		
		return listCount;
	}
	
	
	/** 게시글 검색 DAO
	 * @param conn
	 * @param query
	 * @return boardList
	 * @throws Exception
	 */
	public List<Board> searchBoardList(Connection conn, Pagination pagination,String query) throws Exception {
		List<Board> boardList = new ArrayList<>();
		query = "%" + query + "%";
		
		try {
			String sql = prop.getProperty("searchBoardList");
			
			int start = (pagination.getCurrentPage() - 1) * pagination.getLimit() + 1;
			int end = start + pagination.getLimit() - 1;

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, query);
			pstmt.setString(2, query);
			pstmt.setString(3, query);
			pstmt.setString(4, query);
			pstmt.setString(5, query);
			pstmt.setInt(6, start);
			pstmt.setInt(7, end);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Board board = new Board();

				board.setBoardNo(rs.getInt("BOARD_NO"));
				board.setBoardCode(rs.getInt("BOARD_CD"));
				board.setBoardTitle(rs.getString("BOARD_TITLE"));
				board.setMemberName(rs.getString("MEMBER_NM"));
				board.setCreateDate(rs.getString("CREATE_DT"));
				board.setReadCount(rs.getInt("READ_COUNT"));
				board.setLikeCount(rs.getInt("LIKE_COUNT"));
				board.setThumbnail(rs.getString("THUMBNAIL"));
				
				boardList.add(board);
			}

		} finally {
			close(rs);
			close(pstmt);
		}

		return boardList;
	}

	public List<Like> getLikeMember(Connection conn, int boardNo) throws Exception {
		List<Like> likeList = new ArrayList<>();

		try {
			String sql = prop.getProperty("getLikeMember");

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Like like = new Like();
				like.setBoardReplyNo(rs.getInt("BOARD_REPLY_NO"));
				like.setMemberNo(rs.getInt("MEMBER_NO"));
				likeList.add(like);
			}

		} finally {
			close(rs);
			close(pstmt);
		}

		return likeList;
	}

	/** 좋아요 여부 조회 DAO
	 * @param conn
	 * @param boardNo
	 * @param memberNo
	 * @return result
	 * @throws Exception
	 */
	public int getIsLike(Connection conn, int boardNo, int memberNo) throws Exception {
		
		int result = 0;
		
		try {
			String sql = prop.getProperty("getIsLike");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			pstmt.setInt(2, memberNo);
			
			rs= pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}

		} finally {
			close(rs);
			close(pstmt);
		}
		
		return result;
	}

	/** 조회수 증가 DAO
	 * @param conn
	 * @param boardNo
	 * @return result
	 * @throws Exception
	 */
	public int increaseReadCount(Connection conn, int boardNo) throws Exception {
		
		int result = 0;
		
		try {
			String sql = prop.getProperty("increaseReadCount");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			result = pstmt.executeUpdate();
			
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	/** 게시글 삭제 DAO
	 * @param conn
	 * @param boardNo
	 * @return result
	 * @throws Exception
	 */
	public int deleteBoard(Connection conn, int boardNo) throws Exception {
		int result = 0;
		
		try {
			String sql = prop.getProperty("deleteBoard");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			result = pstmt.executeUpdate();
			
		}finally {
			close(pstmt);
		}

		return result;
	}

	/** 자유게시글 삽입 DAO
	 * @param conn
	 * @param boardNo 
	 * @param detail
	 * @return boardNo
	 * @throws Exception
	 */
	public int insertFreeBoard(Connection conn, int boardNo, BoardDetail detail) throws Exception {
		
		int result = 0;
		
		try {
			String sql = prop.getProperty("insertFreeBoard");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			pstmt.setString(2, detail.getBoardTitle());
			pstmt.setInt(3, detail.getMemberNo());
			
			result = pstmt.executeUpdate();
			
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	/** 다음 게시글 번호 얻어오기
	 * @param conn
	 * @return boardNo
	 * @throws Exception
	 */
	public int nextBoardNo(Connection conn) throws Exception {
		
		int boardNo = 0;
		
		try {
			String sql = prop.getProperty("nextBoardNo");
			
			stmt = conn.createStatement();
			
			rs= stmt.executeQuery(sql);
			
			if(rs.next()) {
				boardNo = rs.getInt(1);
			}
			
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return boardNo;
	}

	/** 자유게시글 내용 삽입 DAO
	 * @param conn
	 * @param boardNo
	 * @param article 
	 * @param articleList 
	 * @param detail
	 * @return result
	 * @throws Exception
	 */
	public int insertFreeBoardArticle(Connection conn, int boardNo, BoardArticle article) throws Exception {
		
		int result = 0;
		
		try {
			String sql = prop.getProperty("insertFreeBoardArticle");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, article.getContent());
			pstmt.setInt(2, article.getContentLevel());
			pstmt.setInt(3, boardNo);
			
			result = pstmt.executeUpdate();

		}finally {
			close(pstmt);
		}
		
		return result;
	}

	/** 자유게시글 이미지 삽입 DAO
	 * @param conn
	 * @param boardNo
	 * @param image
	 * @return result
	 * @throws Exception
	 */
	public int insertFreeBoardImage(Connection conn, int boardNo, BoardImage image) throws Exception {
		
		int result = 0;
		
		try {
			String sql = prop.getProperty("insertFreeBoardImage");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, image.getImageRename());
			pstmt.setString(2, image.getImageOriginal());
			pstmt.setInt(3, image.getImageLevel());
			pstmt.setInt(4, boardNo);
			
			result = pstmt.executeUpdate();
			
		}finally {
			close(pstmt);
		}
		return result;
	}

	/** 자유게시글 내용 삭제 DAO
	 * @param conn
	 * @param detail
	 * @return result
	 * @throws Exception
	 */
	public int deleteBoardArticle(Connection conn, int boardNo) throws Exception {
		
		int result = 0;
		
		try {
			String sql = prop.getProperty("deleteBoardArticle");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			result = pstmt.executeUpdate();
			
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int deleteBoardImage(Connection conn, int boardNo) throws Exception {
		
		int result = 0;
		
		try {
			String sql = prop.getProperty("deleteBoardImage");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			result = pstmt.executeUpdate();
			
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	/** 자유게시글 제목 수정 DAO
	 * @param conn
	 * @param detail
	 * @return result
	 * @throws Exception
	 */
	public int updateFreeBoard(Connection conn, BoardDetail detail) throws Exception {
		
		int result = 0;
		
		try {
			String sql = prop.getProperty("updateFreeBoard");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, detail.getBoardTitle());
			pstmt.setInt(2, detail.getBoardNo());
			
			result = pstmt.executeUpdate();
			
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertBoardImage(Connection conn, BoardImage image) throws SQLException {
		int result = 0;

		try {
			String sql = prop.getProperty("insertBoardImage");
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, image.getImageSize());
			pstmt.setString(2, image.getImageRename());
			pstmt.setString(3, image.getImageOriginal());
			pstmt.setInt(4, image.getImageLevel());
			pstmt.setInt(5, image.getBoardNo());

			result = pstmt.executeUpdate();

		} finally {
			close(pstmt);
		}

		return result;
	}

	public int insertBoard(Connection conn, BoardDetail detail) throws SQLException {
		int result = 0;

		try {
			String sql = prop.getProperty("insertBoard");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, detail.getBoardNo());
			pstmt.setString(2, detail.getBoardTitle());
			pstmt.setString(3, detail.getBoardContent());
			pstmt.setInt(4, detail.getBoardCode());
			pstmt.setInt(5, detail.getLocationCode());
			pstmt.setInt(6, detail.getMemberNo());

			result = pstmt.executeUpdate();

		} finally {
			close(pstmt);
		}

		return result;
	}

	/** 지역 게시글 상세 조회 
	 * @param conn
	 * @param boardNo
	 * @param content
	 * @return 
	 * @throws Exception
	 */
	public BoardDetail selectRegionBoardDetail(Connection conn, int boardNo) throws Exception{
		
		BoardDetail detail = null;
		
		try {
			
			String sql = prop.getProperty("regionBoardDetail");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				detail = new BoardDetail();
				
				detail.setBoardNo(rs.getInt("BOARD_NO"));
				detail.setBoardTitle(rs.getString("BOARD_TITLE"));
				detail.setLocationName(rs.getString("LOCATION_NM"));
				detail.setBoardContent(rs.getString("BOARD_CONTENT"));
				detail.setContent(rs.getString("CONTENT"));
				
				
			}
			
		}finally {
			
			close(rs);
			close(pstmt);
			
		}
		
		return detail;
	}

	public List<BoardImage> selectRegionImageList(Connection conn, int boardNo) throws Exception{
		
		List<BoardImage> imageList = new ArrayList<>();
		
		try {
			String sql = prop.getProperty("selectRegionImageList");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				BoardImage image = new BoardImage();
				
				image.setImageNo(rs.getInt(1)); 
				image.setImageSize(rs.getInt(2));
				image.setImageRename(rs.getString(3));
				image.setImageOriginal(rs.getString(4));
				image.setImageLevel(rs.getInt(5));
				image.setBoardNo(rs.getInt(6));
				
				imageList.add(image);
			}
			
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return imageList;
	}

	public int regionnextBoardNo(Connection conn) throws Exception{
		
		int boardNo = 0;
		try {
			
			String sql = prop.getProperty("regionnextBoardNo");
			
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				
				boardNo= rs.getInt(1);
			}
	
		}finally {
			close(rs);
			close(stmt);
		}
		return boardNo;
	}

	public int regioninsertBoard(Connection conn, BoardDetail detail, int boardCode) throws Exception{
		
		int result = 0;
		
		try {
			
			String sql = prop.getProperty("regioninsertBoard");
			
			pstmt = conn.prepareStatement(sql);
			
			
			pstmt.setInt(1,detail.getBoardNo());
			pstmt.setString(2, detail.getBoardTitle());
			pstmt.setString(3, detail.getBoardContent());
			pstmt.setInt(4, boardCode);
			pstmt.setInt(5, detail.getLocationCode());
			pstmt.setInt(6, detail.getMemberNo());
			
			
			result = pstmt.executeUpdate();
			
			
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int regioninsertBoardImage(Connection conn, BoardImage image) throws Exception{
		
		int result = 0;
		
		try {
			
			String sql = prop.getProperty("regioninsertBoardImage");
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, image.getImageRename());
			pstmt.setString(2, image.getImageOriginal());
			pstmt.setInt(3, image.getImageLevel());
			pstmt.setInt(4, image.getBoardNo());
			
			result = pstmt.executeUpdate();
			
			
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public List<BoardDetail> selectRegionList(Connection conn, int type) throws Exception{
		
		List<BoardDetail> boardList = new ArrayList<>();
		
		try {
			
			String sql = prop.getProperty("selectRegionList");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, type);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				BoardDetail board = new BoardDetail();
				
				board.setBoardNo(rs.getInt("BOARD_NO"));
				board.setBoardTitle(rs.getString("BOARD_TITLE"));
				board.setBoardContent(rs.getString("BOARD_CONTENT"));
				board.setBoardCode(rs.getInt("BOARD_CD"));
				board.setContent(rs.getString("CONTENT"));
				boardList.add(board);
			}
		}finally {
			
			close(rs);
			close(stmt);
		}
		
		return boardList;
	}

	public int regioninsertBoard2(Connection conn, BoardArticle article , BoardDetail detail) throws Exception{
		
		int result = 0;
		
		try {
			
			String sql = prop.getProperty("regioninsertBoard2");
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,article.getContent());
			pstmt.setInt(2, detail.getBoardNo());
			
			result = pstmt.executeUpdate();
			
			
			
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertBoardArticle(Connection conn, BoardArticle article) throws SQLException {
		int result = 0;

		try {
			String sql = prop.getProperty("insertArticle");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, article.getContent());
			pstmt.setInt(2, article.getContentSize());
			pstmt.setInt(3, article.getContentLevel());
			pstmt.setInt(4, article.getBoardNo());

			result = pstmt.executeUpdate();

		} finally {
			close(pstmt);
		}

		return result;
	}

	public int insertHashtagList(String hashtagName, String hashtagOption, Connection conn) throws Exception {
		int result = 0;

		try { 
			String sql = prop.getProperty("insertHashtagList");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hashtagName);  // ** 해시태그 네임은 유니크로 해서 중복 없게 한다.
			pstmt.setString(2, hashtagOption);
			result = pstmt.executeUpdate();
		} finally {
			close(pstmt);

		}

		return result;
	}

	
	/** 해시태그 중복검사
	 * @param hashtagName
	 * @param conn
	 * @return
	 * @throws Exception
	 */
	public int HashtagDupCheck(String hashtagName, Connection conn) throws Exception {
		int result = 0;

		try {
			String sql = prop.getProperty("HashtagDupCheck");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hashtagName);
			result = pstmt.executeUpdate();
		} finally {
			close(pstmt);

		}

		return result;
	}
	
	

	public int hashtagNo(String hashtagName, Connection conn) throws Exception {
		int hashtagNo = 0;

		try { 
			String sql = prop.getProperty("hashtagNo");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hashtagName);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				hashtagNo = rs.getInt("HASHTAG_NO");
			}

		} finally {
			close(pstmt);
		}

		return hashtagNo;
	}


	public int insertHashtag(int hashtagNo, int boardNo, Connection conn) throws Exception {
		int result = 0;

		try { 
			String sql = prop.getProperty("insertHashtag");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, hashtagNo);
			pstmt.setInt(2, boardNo);
			result = pstmt.executeUpdate();
		} finally {
			close(pstmt);
		}

		return result;

	}

	public int locationCode(Connection conn, String address) throws Exception {
		int locationCode = 0;

		try { 
			String sql = prop.getProperty("locationCode");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, address);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				locationCode = rs.getInt(1);
			}
		} finally {
			close(rs);
			close(pstmt);
		}

		return locationCode;

	}

	public List<Hashtag> selectHashtag(Connection conn) throws Exception {
		List<Hashtag> hashtagList = new ArrayList<>();
		try { 
			String sql = prop.getProperty("selectHashtag");
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				Hashtag hashtag = new Hashtag();
				hashtag.setCategory(rs.getString(1));
				hashtag.setName(rs.getString(2));
				hashtagList.add(hashtag);
			}
		} finally {
			close(rs);
			close(stmt);
		}
		return hashtagList;
	}

	public List<String> selectBoardHashtag(Connection conn, int boardNo) throws Exception {
		List<String> boardHashtag = new ArrayList<>();
		try {
			String sql = prop.getProperty("selectBoardHashtag");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String hashtag = rs.getString(1);
				boardHashtag.add(hashtag);
			}
		} finally {
			close(rs);
			close(pstmt);
		}	
		return boardHashtag;
	}


	public String selectThumbnail(Connection conn, int boardNo) throws Exception {
		String thumbnail = null;
		try { 
			String sql = prop.getProperty("selectThumbnail");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				thumbnail = rs.getString(1);
			}
		} finally {
			close(rs);
			close(pstmt);
		}	

		return thumbnail;
	}

//============================================================================================================================//	

	/**
	 * (테마) 게시글 삽입
	 * 
	 * @param conn
	 * @param detail
	 * @param boardCode
	 * @return result
	 * @throws Exception
	 */
	public int insertThemaBoard(Connection conn, BoardDetail detail, int boardCode) throws Exception {
		int result = 0;

		try {
			String sql = prop.getProperty("insertThemaBoard");

		

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, detail.getBoardNo());
			pstmt.setString(2, detail.getBoardTitle());
			pstmt.setString(3, detail.getBoardContent());
			pstmt.setInt(4, boardCode);
			pstmt.setInt(5, detail.getLocationCode());
			pstmt.setInt(6, detail.getMemberNo());

			result = pstmt.executeUpdate();

		} finally {
			close(pstmt);
		}

		return result;
	}

	/**
	 * (테마) 게시글 이미지 삽입 DAO
	 * 
	 * @param conn
	 * @param image
	 * @return result
	 * @throws Exception
	 */
	public int insertThemaBoardImage(Connection conn, BoardImage image) throws Exception {
		int result = 0;

		try {
			String sql = prop.getProperty("insertThemaBoardImage");


			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, image.getImageRename());
			pstmt.setString(2, image.getImageOriginal());
			pstmt.setInt(3, image.getImageLevel());
			pstmt.setInt(4, image.getBoardNo());

			result = pstmt.executeUpdate();

		} finally {
			close(pstmt);

		}

		return result;
	}

	/**
	 * (테마) 게시글 내용 조회
	 * 
	 * @param conn
	 * @param boardNo
	 * @param boardCode 
	 * @return detail
	 * @throws Exception
	 */
	public BoardDetail selectThemaBoardDetail(Connection conn, int boardNo, int boardCode) throws Exception {

		BoardDetail detail = null;

		try {
			String sql = prop.getProperty("selectThemaBoardDetail");

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, boardNo);
			pstmt.setInt(2, boardCode);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				detail = new BoardDetail();

				detail.setBoardNo(rs.getInt(1));
				detail.setBoardTitle(rs.getString(2));
				detail.setBoardContent(rs.getString(3));
				detail.setCreateDate(rs.getString(4));
				detail.setUpdateDate(rs.getString(5));
				detail.setReadCount(rs.getInt(6));
				detail.setMemberNo(rs.getInt(7));
				detail.setBoardName(rs.getString(8));
				detail.setLocationName(rs.getString(9));
				detail.setContent(rs.getString(10));
				detail.setLocationCode(rs.getInt(11));
				detail.setBoardCode(boardCode);
			}

		} finally {
			close(rs);
			close(pstmt);

		}

		return detail;
	}

	/**
	 * (테마) 게시글에 첨부된 이미지 조회
	 * 
	 * @param conn
	 * @param boardNo
	 * @return imageList
	 * @throws Exception
	 */
	public List<BoardImage> selectThemaImageList(Connection conn, int boardNo) throws Exception {

		List<BoardImage> imageList = new ArrayList<>();

		try {
			String sql = prop.getProperty("selectThemaImageList");

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, boardNo);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardImage image = new BoardImage();
				image.setImageNo(rs.getInt(1));
				image.setImageSize(rs.getInt(2));
				image.setImageRename(rs.getString(3));
				image.setImageOriginal(rs.getString(4));
				image.setImageLevel(rs.getInt(5));
				image.setBoardNo(rs.getInt(6));

				imageList.add(image);
			}

		} finally {
			close(rs);
			close(pstmt);
		}
		return imageList;
	}

	/**
	 * (테마) 게시글 삭제
	 * 
	 * @param conn
	 * @param no
	 * @return result
	 * @throws Exception
	 */
	public int deleteThemaBoard(Connection conn, int no) throws Exception {
		int result = 0;

		try {
			String sql = prop.getProperty("deleteThemaBoard");
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, no);

			result = pstmt.executeUpdate();

		} finally {
			close(pstmt);
		}

		return result;
	}

	/**
	 * 게시판 이름 조회
	 * 
	 * @param conn
	 * @param type
	 * @return boardName
	 * @throws Exception
	 */
	public String selectThemaBoardName(Connection conn, int type) throws Exception {

		String boardName = "";

		try {
			String sql = prop.getProperty("selectThemaBoardName");

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, type);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				boardName = rs.getString(1);
			}

		} finally {
			close(rs);
			close(pstmt);
		}

		return boardName;

	}

	/**(테마) 게시글 목록 조회
	 * @param conn
	 * @param type
	 * @return boardList
	 * @throws Exception
	 */
	public List<Board> selectThemaBoardList(Connection conn, String type)throws Exception{
		List<Board> boardList = new ArrayList<>();

		try {
			String sql = prop.getProperty("selectThemaBoardList1") + type + prop.getProperty("selectThemaBoardList2");

			
			stmt = conn.createStatement();

			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				Board board = new Board();

				board.setBoardNo(rs.getInt("BOARD_NO"));
				board.setBoardTitle(rs.getString("BOARD_TITLE"));
				board.setLocationName(rs.getString("LOCATION_NM"));
				board.setBoardCode(rs.getInt("BOARD_CD"));
				board.setBoardName(rs.getString("BOARD_NM"));
				board.setThumbnail(rs.getString("THUMBNAIL"));

				boardList.add(board);

			}

		} finally {
			close(rs);
			close(stmt);

		}
		return boardList;
	}

	/** 내가 작성한 전체 게시글 수 조회
	 * @param conn
	 * @param memberNo
	 * @return listCount
	 * @throws Exception
	 */
	public int getMyBoardListCount(Connection conn, int memberNo) throws Exception {
		
		int listCount = 0;
		
		try {
			String sql = prop.getProperty("getMyBoardListCount");

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				listCount = rs.getInt(1);
			}
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return listCount;
	}

	/** 내가 작성한 전체 게시글의 일정한 범위 목록 조회
	 * @param conn
	 * @param memberNo
	 * @param pagination
	 * @return boardList
	 * @throws Exception
	 */
	public List<Board> selectMyBoardList(Connection conn, int memberNo, Pagination pagination) throws Exception {
		
		List<Board> boardList = new ArrayList<>();
		
		try {
			String sql = prop.getProperty("selectMyBoardList");
			
			int start = (pagination.getCurrentPage() - 1) * pagination.getLimit() + 1;
			int end = start + pagination.getLimit() - 1;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Board board = new Board();
				
				board.setBoardNo(rs.getInt("BOARD_NO"));
				board.setBoardCode(rs.getInt("BOARD_CD"));
				board.setBoardTitle(rs.getString("BOARD_TITLE"));
				board.setMemberName(rs.getString("MEMBER_NM"));
				board.setCreateDate(rs.getString("CREATE_DT"));
				board.setReadCount(rs.getInt("READ_COUNT"));
				board.setLikeCount(rs.getInt("LIKE_COUNT"));
				board.setThumbnail(rs.getString("THUMBNAIL"));
				
				boardList.add(board);
			}
			
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return boardList;
	}

		/**지역 번호 조회(카카오맵에서 얻어온 address이용)
	 * @param conn
	 * @param boardNo
	 * @param detail 
	 * @return locationCode
	 * @throws Exception
	 */
	public int selectLocationCode(Connection conn, int boardNo, BoardDetail detail)throws Exception {
		int locationCode = 0;
		
		try {
			String sql = prop.getProperty("selectLocationCode");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, detail.getLocationName());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				locationCode = rs.getInt("LOCATION_CODE");
			}
			
			
		}finally {
			close(rs);
			close(pstmt);
			
		}
	
		
		return locationCode;
	}


	/**지역 정보 삽입
	 * @param conn
	 * @param locationCode
	 * @param detail
	 * @return insertLocation
	 * @throws Exception
	 */
	public int updateLocation(Connection conn, int boardNo, BoardDetail detail)throws Exception {
		int updateLocation = 0;
		
		try {
			String sql = prop.getProperty("updateLocation");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, detail.getLocationCode());
			pstmt.setInt(2, boardNo);
			
			updateLocation = pstmt.executeUpdate();
			
		}finally {
			close(pstmt);
			
		}
		
		return updateLocation;
	}

	/**(테마) 게시글 수정
	 * @param conn
	 * @param detail
	 * @return result
	 * @throws Exception
	 */
	public int updateThemaBoard(Connection conn, BoardDetail detail)throws Exception{
		int result = 0;
		
		try {
			String sql = prop.getProperty("updateThemaBoard");
			pstmt =conn.prepareStatement(sql);
			
			pstmt.setString(1, detail.getBoardTitle());
			pstmt.setString(2, detail.getBoardContent());
			pstmt.setInt(3, detail.getBoardCode());
			pstmt.setInt(4, detail.getLocationCode());
			pstmt.setInt(5, detail.getBoardNo());
			
			result = pstmt.executeUpdate();
			
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	/**(테마) 게시글 이미지 수정
	 * @param conn
	 * @param image
	 * @return result
	 * @throws Exception
	 */
	public int updateBoardImage(Connection conn, BoardImage image)throws Exception{
		int result = 0;
		
		try {

			String sql = prop.getProperty("updateBoardImage");
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, image.getImageSize());
			pstmt.setString(2, image.getImageRename());
			pstmt.setString(3, image.getImageOriginal());
			pstmt.setInt(4, image.getImageLevel());
			pstmt.setInt(5, image.getBoardNo());

			result = pstmt.executeUpdate();

		} finally {
			close(pstmt);
		}
		
		return 0;
	}

	/**(테마)이미지 삭제
	 * @param conn
	 * @param deleteList
	 * @param boardNo
	 * @return result
	 */
	public int deleteThemaBoardImage(Connection conn, String deleteList, int boardNo)throws Exception{
		int result = 0;
		
		try {
			String sql = prop.getProperty("deleteBoardImage") + " AND IMG_LEVEL IN ( " + deleteList + " ) ";
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			result = pstmt.executeUpdate();
			
			
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	/**
	 * @param conn
	 * @param mapAddress
	 * @param boardNo
	 * @return
	 * @throws Exception
	 */
	public int updateBoardArticle(Connection conn, BoardDetail detail)throws Exception{
		int Coordinate = 0;
		
		try {
			String sql = prop.getProperty("updateBoardArticle");
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, detail.getMapAddress());
			pstmt.setInt(2, detail.getBoardNo());
			
			Coordinate = pstmt.executeUpdate();
		}finally {
			
		}
		
		return Coordinate;
	}

	public Integer selectReplyCount(Connection conn, int boardNo) throws SQLException {
		int replyCount = 0;
		
		try {
			String sql = prop.getProperty("selectReplyCount");

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, boardNo);
			
			rs = pstmt.executeQuery();

			if (rs.next()) {
				replyCount = rs.getInt("COUNT(*)");
			}

		} finally {
			close(rs);
			close(pstmt);

		}
		return replyCount;
	}

		/**지역 번호 조회(카카오맵에서 얻어온 address이용)
	 * @param conn
	 * @param detail 
	 * @return locationCode
	 * @throws Exception
	 */
	public int selectLocationCode(Connection conn, BoardDetail detail)throws Exception {
		int locationCode = 0;
		
		try {
			String sql = prop.getProperty("selectLocationCode");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, detail.getLocationName());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				locationCode = rs.getInt("LOCATION_CODE");
			}
			
			
		}finally {
			close(rs);
			close(pstmt);
			
		}
	
		
		return locationCode;
	}


	/**지역 정보 삽입
	 * @param conn
	 * @param locationCode
	 * @param detail
	 * @return insertLocation
	 * @throws Exception
	 */
	public int updateLocation(Connection conn, int boardNo, BoardDetail detail)throws Exception {
		int updateLocation = 0;
		
		try {
			String sql = prop.getProperty("updateLocation");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, detail.getLocationCode());
			pstmt.setInt(2, boardNo);
			
			updateLocation = pstmt.executeUpdate();
			
		}finally {
			close(pstmt);
			
		}
		
		return updateLocation;
	}

	/**(테마) 게시글 수정
	 * @param conn
	 * @param detail
	 * @return result
	 * @throws Exception
	 */
	public int updateThemaBoard(Connection conn, BoardDetail detail)throws Exception{
		int result = 0;
		
		try {
			String sql = prop.getProperty("updateThemaBoard");
			pstmt =conn.prepareStatement(sql);
			
			pstmt.setString(1, detail.getBoardTitle());
			pstmt.setString(2, detail.getBoardContent());
			pstmt.setInt(3, detail.getBoardCode());
			pstmt.setInt(4, detail.getLocationCode());
			pstmt.setInt(5, detail.getBoardNo());
			
			result = pstmt.executeUpdate();
			
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	/**(테마) 게시글 이미지 수정
	 * @param conn
	 * @param image
	 * @return result
	 * @throws Exception
	 */
	public int updateBoardImage(Connection conn, BoardImage image)throws Exception{
		int result = 0;
		
		try {

			String sql = prop.getProperty("updateBoardImage");
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, image.getImageSize());
			pstmt.setString(2, image.getImageRename());
			pstmt.setString(3, image.getImageOriginal());
			pstmt.setInt(4, image.getImageLevel());
			pstmt.setInt(5, image.getBoardNo());

			result = pstmt.executeUpdate();

		} finally {
			close(pstmt);
		}
		
		return 0;
	}

	/**(테마)이미지 삭제
	 * @param conn
	 * @param deleteList
	 * @param boardNo
	 * @return result
	 */
	public int deleteThemaBoardImage(Connection conn, String deleteList, int boardNo)throws Exception{
		int result = 0;
		
		try {
			String sql = prop.getProperty("deleteBoardImage") + " AND IMG_LEVEL IN ( " + deleteList + " ) ";
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			result = pstmt.executeUpdate();
			
			
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	/**
	 * @param conn
	 * @param mapAddress
	 * @param boardNo
	 * @return
	 * @throws Exception
	 */
	public int updateBoardArticle(Connection conn, BoardDetail detail)throws Exception{
		int Coordinate = 0;
		
		try {
			String sql = prop.getProperty("updateBoardArticle");
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, detail.getMapAddress());
			pstmt.setInt(2, detail.getBoardNo());
			
			Coordinate = pstmt.executeUpdate();
		}finally {
			close(pstmt);
			
		}
		
		return Coordinate;
	}

	public int updateLocationCode(Connection conn, BoardDetail detail)throws Exception {
		int locationCode = 0;
		
		
		try {
			String sql = prop.getProperty("updateLocationCode");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, detail.getLocationCode());		
			pstmt.setString(2, detail.getLocationName());
			
			locationCode = pstmt.executeUpdate();
			
		}finally {
			close(pstmt);
			
		}
				
		return locationCode;
	}



	public String selectBoardName(Connection conn, BoardDetail detail)throws Exception {
		String boardName = "";
		try {
			String sql = prop.getProperty("selectBoardName");
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, detail.getBoardCode());		
			pstmt.setInt(2, detail.getBoardNo());
			
			rs = pstmt.executeQuery(); 
			
			if (rs.next()) {
				boardName = rs.getString("BOARD_NM");
            }
			
			
		}finally {
			close(rs);
			close(pstmt);
			
		}
		
		
		return boardName;
	}


	
	
	


	

}
