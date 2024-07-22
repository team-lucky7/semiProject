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

import semiProject.board.model.vo.Reply;
import static semiProject.common.JDBCTemplate.*;

public class ReplyDAO {
	
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Properties prop;
	
	public ReplyDAO() {
		
		try {
			prop = new Properties();
			
			String path = ReplyDAO.class.getResource("/semiProject/sql/reply-sql.xml").getPath();
			
			prop.loadFromXML(new FileInputStream(new File(path)));
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	

	/** 댓글 목록 조회 DAO
	 * @param conn
	 * @param boardNo
	 * @return replyList
	 * @throws Exception
	 */
	public List<Reply> selectReplyList(Connection conn, int boardNo) throws Exception{
		
		List<Reply> replyList = new ArrayList<>();
		
		try {
			String sql = prop.getProperty("selectReplyList");
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Reply reply = new Reply();
				
				reply.setReplyNo(rs.getInt("REPLY_NO"));
				reply.setReplyContent(rs.getString("REPLY_CONTENT"));
				reply.setCreateDate(rs.getString("CREATE_DT"));
				reply.setBoardNo(rs.getInt("BOARD_NO"));
				reply.setMemberNo(rs.getInt("MEMBER_NO"));
				reply.setMemberName(rs.getString("MEMBER_NM"));
				reply.setProfileImage(rs.getString("PROFILE_IMG"));
				
				replyList.add(reply);
			}
			
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return replyList;
	}


	/** 좋아요 여부 조회
	 * @param conn
	 * @param replyNo
	 * @param memberNo 
	 * @return result
	 * @throws Exception
	 */
	public int getIsLike(Connection conn, int replyNo, int memberNo) throws Exception {
		
		int result = 0;
		
		try {
			String sql = prop.getProperty("getIsLike");
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, replyNo);
			pstmt.setInt(2, memberNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
}
