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

}
