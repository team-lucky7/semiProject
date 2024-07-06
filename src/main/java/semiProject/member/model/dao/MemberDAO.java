package semiProject.member.model.dao;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;

import semiProject.member.model.vo.Member;

public class MemberDAO {
	
	private Properties prop;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public MemberDAO() {
		try {
			prop = new Properties();
			String path = MemberDAO.class.getResource("/semiProject/sql/member-sql.xml").getPath();
			prop.loadFromXML(new FileInputStream(path));
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	/** 로그인 DAO
	 * @param conn
	 * @param inputId
	 * @param inputPw
	 * @return loginMember
	 */
	public Member login(Connection conn, String inputId, String inputPw) {
		
		Member loginMember = null;
		
		try {
			
			String sql = prop.getProperty("login");
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return loginMember;
	}

}
