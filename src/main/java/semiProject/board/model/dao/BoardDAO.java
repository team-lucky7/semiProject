package semiProject.board.model.dao;

import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import semiProject.board.model.vo.Board;
import semiProject.board.model.vo.BoardArticle;
import semiProject.board.model.vo.BoardDetail;
import semiProject.board.model.vo.BoardImage;
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

	/** 게시판 이름 조회 DAO
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

	/** 특정 게시판에서 일정한 범위의 목록 조회 DAO
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
				board.setMemberName(rs.getString("MEMBER_NM"));
				board.setCreateDate(rs.getString("CREATE_DT"));
				board.setReadCount(rs.getInt("READ_COUNT"));
				board.setLikeCount(rs.getInt("LIKE_COUNT"));
				
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
	 * @return 
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
				detail.setProfileImage(rs.getString("PROFILE_IMG"));
				detail.setMemberName(rs.getString("MEMBER_NM"));
				detail.setCreateDate(rs.getString("CREATE_DT"));
				detail.setUpdateDate(rs.getString("UPDATE_DT"));
				detail.setReadCount(rs.getInt("READ_COUNT"));
				detail.setMemberNo(rs.getInt("MEMBER_NO"));
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
				
				article.setBoardContentNo(rs.getInt("BOARD_CT_NO"));
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

	public List<Like> getLikeMember(Connection conn, int boardNo) throws Exception {
		List<Like> likeList = new ArrayList<>();
		
		try {
			String sql = prop.getProperty("getLikeMember");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Like like = new Like();
				like.setBoardReplyNo(rs.getInt("BOARD_REPLY_NO"));
				like.setMemberNo(rs.getInt("MEMBER_NO"));
				likeList.add(like);
			}
			
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return likeList;
	}

	public int getSearchListCount(Connection conn, int type, String query) throws Exception {
		
		int listCount = 0;
		query = "%" + query + "%";
		
		try {
			String sql = prop.getProperty("getSearchListCount");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, type);
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

	/** 게시글 검색
	 * @param conn
	 * @param type
	 * @param pagination
	 * @param query
	 * @return boardList
	 * @throws Exception
	 */
	public List<Board> searchBoardList(Connection conn, int type, Pagination pagination, String query) throws Exception {
		List<Board> boardList = new ArrayList<>();
		query = "%" + query + "%";
		
		try {
			String sql = prop.getProperty("searchBoardList");
			
			int start = (pagination.getCurrentPage() - 1) * pagination.getLimit() + 1;
			int end = start + pagination.getLimit() - 1;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, type);
			pstmt.setString(2, query);
			pstmt.setString(3, query);
			pstmt.setString(4, query);
			pstmt.setString(5, query);
			pstmt.setInt(6, start);
			pstmt.setInt(7, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Board board = new Board();
				
				board.setBoardNo(rs.getInt("BOARD_NO"));
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

}
