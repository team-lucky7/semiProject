package semiProject.member.model.service;

import java.sql.Connection;

import semiProject.member.model.dao.MemberDAO;
import semiProject.member.model.vo.Member;

import static semiProject.common.JDBCTemplate.*;

public class MemberService {
	
	private MemberDAO dao = new MemberDAO();

	/** 로그인 Service
	 * @param memberId
	 * @param memberPw
	 * @return loginMember
	 * @throws Exception
	 */
	public Member login(String inputId, String inputPw) throws Exception{
		
		Connection conn = getConnection();
		
		Member loginMember = dao.login(conn, inputId, inputPw);
		
		close(conn);
		
		return loginMember;
	}

	/** 아이디 중복 검사 Service
	 * @param memberId
	 * @return result
	 * @throws Exception
	 */
	public int idDupCheck(String memberId) throws Exception{
		
		Connection conn = getConnection();
		
		int result = dao.idDupCheck(conn, memberId);
		
		close(conn);
		
		return result;
	}

	/** 회원 가입 Service
	 * @param mem
	 * @return result
	 * @throws Exception
	 */
	public int signUp(Member mem) throws Exception{
		Connection conn = getConnection();
		
		int result = dao.signUp(conn, mem);
		
		if(result > 0) commit(conn);
		else	       rollback(conn);
		
		close(conn);
		
		return result;
	}

	/** 비밀번호 변경 Service
	 * @param currentPw
	 * @param newPw
	 * @param memberNo
	 * @return result
	 * @throws Exception
	 */
	public int changePw(String currentPw, String newPw, int memberNo) throws Exception {
		
		Connection conn = getConnection();
		
		int result = dao.changePw(conn,currentPw,newPw,memberNo );
		
		if(result > 0) commit(conn);
		else		   rollback(conn);
		
		close(conn);
		
		return result;
	}

	/** 회원 탈퇴 Service
	 * @param memberPw
	 * @param memberNo
	 * @return result
	 * @throws Exception
	 */
	public int secession(String memberPw, int memberNo) throws Exception{
		
		Connection conn = getConnection();
		
		int result = dao.secession(conn, memberPw, memberNo);
		
		if(result > 0) commit(conn);
		else	       rollback(conn);
		
		close(conn);
		
		return result;
	}

	/** 회원 정보 수정 Service
	 * @param memberEmail
	 * @param memberTel
	 * @param memberNo
	 * @return result
	 */
	public int updateMember(String memberEmail, String memberTel, int memberNo) throws Exception{
		
		Connection conn = getConnection();
		
		int result = dao.updateMember(conn,memberEmail,memberTel,memberNo);
		
		if(result > 0) commit(conn);
		else		   rollback(conn);
		
		close(conn);
		
		return result;
	}
 
	/** 아이디 찾기 Service
	 * @param inputEmail
	 * @param inputPhone
	 * @return loginMember
	 */
	public Member searchId(String inputEmail, String inputPhone)  throws Exception{
		
		Connection conn = getConnection();
		
		
		Member loginMember = dao.searchId(conn,inputEmail,inputPhone);
		
		close(conn);
		
		return loginMember;
		
	}

}
