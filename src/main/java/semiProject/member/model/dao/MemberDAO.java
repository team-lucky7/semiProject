package semiProject.member.model.dao;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;

import static semiProject.common.JDBCTemplate.*;
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
	 * @throws Exception
	 */
	public Member login(Connection conn, String inputId, String inputPw) throws Exception{
		
		Member loginMember = null;
		
		try {
			
			String sql = prop.getProperty("login");
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, inputId);
			
			pstmt.setString(2, inputPw);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				loginMember = new Member();
				
				loginMember.setMemberNo(rs.getInt("MEMBER_NO"));
				loginMember.setMemberId(rs.getString("MEMBER_ID"));
				loginMember.setMemberName(rs.getString("MEMBER_NM"));
				loginMember.setMemberGender(rs.getString("MEMBER_GENDER"));
				loginMember.setMemberDOB(rs.getString("MEMBER_DOB"));
				loginMember.setMemberEmail(rs.getString("MEMBER_EMAIL"));
				loginMember.setMemberTel(rs.getString("MEMBER_TEL"));
				loginMember.setProfileImage(rs.getString("PROFILE_IMG"));
			}
			
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return loginMember;
	}

	/** 아이디 중복 검사 DAO
	 * @param conn
	 * @param memberId
	 * @return result
	 * @throws Exception
	 */
	public int idDupCheck(Connection conn, String memberId) throws Exception{
		
		int result = 0;
		
		try {
			String sql = prop.getProperty("idDupCheck");
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memberId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return result;
	}

	/** 회원 가입 DAO
	 * @param conn
	 * @param mem
	 * @return result
	 * @throws Exception
	 */
	public int signUp(Connection conn, Member mem) throws Exception{
		
		int result = 0;
		
		try {
			String sql = prop.getProperty("signUp");
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, mem.getMemberId());
			pstmt.setString(2, mem.getMemberPw());
			pstmt.setString(3, mem.getMemberName());
			pstmt.setString(4, mem.getMemberGender());
			pstmt.setString(5, mem.getMemberDOB());
			pstmt.setString(6, mem.getMemberEmail());
			pstmt.setString(7, mem.getMemberTel());

			result = pstmt.executeUpdate();
			
		}finally {
			
			close(pstmt);
		}
		
		return result;
	}

	/** 비밀번호 변경 DAO
	 * @param conn
	 * @param currentPw
	 * @param newPw
	 * @param memberNo
	 * @return result
	 * @throws Exception
	 */
	public int changePw(Connection conn, String currentPw, String newPw, int memberNo)  throws Exception {
		
		int result = 0;

		try {

			String sql = prop.getProperty("changePw");

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, newPw);
			pstmt.setString(2, currentPw);
			pstmt.setInt(3, memberNo);

			result = pstmt.executeUpdate();

		} finally {

			close(pstmt);
		}

		return result;
	}

	/** 회원 탈퇴 DAO
	 * @param conn
	 * @param memberPw
	 * @param memberNo
	 * @return result 
	 * @throws Exception
	 */
	public int secession(Connection conn, String memberPw, int memberNo) throws Exception{
		
		int result = 0;
		
		try {
			
			String sql = prop.getProperty("secession");
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1,memberNo);
			pstmt.setString(2, memberPw);
			
			result = pstmt.executeUpdate();
			
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	/** 회원 정보 DAO
	 * @param conn
	 * @param memberEmail
	 * @param memberTel
	 * @param memberNo
	 * @return result
	 * @throws Exception
	 */
	public int updateMember(Connection conn, Member mem) throws Exception {
		
		int result = 0;
		
		try {
			String sql = prop.getProperty("updateMember");
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, mem.getMemberEmail());
			pstmt.setString(2, mem.getMemberTel());
			pstmt.setString(3, mem.getProfileImage());
			pstmt.setInt(4, mem.getMemberNo());
			
			result = pstmt.executeUpdate();
			
		}finally {
			close(pstmt);
		}
		
		return result;
	}

    public Member searchId(Connection conn, String inputEmail, String inputPhone) throws Exception {
        
        Member loginMember = null;
        
        try {
            
            String sql = prop.getProperty("searchId");
            
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setString(1,inputEmail);
            pstmt.setString(2,inputPhone);
            
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
                
                loginMember = new Member();
                
                loginMember.setMemberId(rs.getString("MEMBER_ID"));
                
            }
            
        }finally {
            
            close(rs);
            close(pstmt);
        }
        
        return loginMember;
    }
        

	
}
