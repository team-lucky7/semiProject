package semiProject.board.model.dao;

import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import static semiProject.common.JDBCTemplate.*;

public class LikeDAO {
	
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Properties prop;
	
	public LikeDAO() {
		
		try {
			prop = new Properties();
			
			String path = LikeDAO.class.getResource("/semiProject/sql/like-sql.xml").getPath();
			
			prop.loadFromXML(new FileInputStream(new File(path)));
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	/** 좋아요 삽입 DAO
	 * @param conn
	 * @param boardReplyNo
	 * @param memberNo
	 * @return result
	 * @throws Exception
	 */
	public int insertLike(Connection conn, int boardReplyNo, int memberNo) throws Exception {
		int result = 0;
		
		try {
			String sql = prop.getProperty("insertLike");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardReplyNo);
			pstmt.setInt(2, memberNo);
			
			result = pstmt.executeUpdate();
			
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	/** 좋아요 삭제 DAO
	 * @param conn
	 * @param boardReplyNo
	 * @param memberNo
	 * @return result
	 * @throws Exception
	 */
	public int deleteLike(Connection conn, int boardReplyNo, int memberNo) throws Exception {
		int result = 0;
		
		try {
			String sql = prop.getProperty("deleteLike");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardReplyNo);
			pstmt.setInt(2, memberNo);
			
			result = pstmt.executeUpdate();
			
		}finally {
			close(pstmt);
		}

		return result;
	}

}
