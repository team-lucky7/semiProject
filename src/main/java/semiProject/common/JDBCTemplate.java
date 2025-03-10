package semiProject.common;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class JDBCTemplate {

	/* DB연결, JDBC 자원 반환, 트랜잭션 제어 같은
	 * 반복적으로 사용되는 JDBC 관련 코드를 모아둔 클래스
	 * 
	 * getConnetion() 메소드
	 * 
	 * close( Connection | Statement | ResultSet) 메소드
	 * --> PreparedStatement는 Statement의 자식이므로
	 * 	   매개변수 다형성으로 한번에 처리
	 * 
	 * commit(Connetion)
	 * rollback(Connetion)
	 * 
	 * */

	// 필드

	private static Connection conn; // 초기값 null
	// private static Connection conn = null;
	// 왜 static 필드?
	// -> static 메소드가 참조 가능한 필드는 static 필드 밖에 없기 때문

	// 메소드

	// DB 연결 정보를 담고있는 Connection 객체 반환 메소드
	public static Connection getConnection() {

		try {
			
			// JNDI(Java Naming and Directory Interface API)
			// - 디렉토리에 접근하는 Java API
			// - 애플리케이션(프로그램, 웹앱)은 JNDI를 이용해서 파일 또는 *서버 Resource*를 찾을 수 있음
			
			// import javax.naming.Context;
			Context initContext = new InitialContext();
			
			// servers -> context.xml 파일 찾기
			Context envContext = (Context)initContext.lookup("java:/comp/env");
			
			// DBCP 세팅의 <Resource> 태그를 찾아 DataSource 형식의 객체로 얻어오기
			// DataSource : Connection Pool을 구현하는 객체(Connection 얻어오기 가능)
			DataSource ds = (DataSource)envContext.lookup("jdbc/oracle");
			
			conn = ds.getConnection();
			conn.setAutoCommit(false);
			
		}catch(Exception e) {
			e.printStackTrace();
		}

		return conn;
	}

	// close() 메소드 작성

	// Connection 반환 메소드
	public static void close(Connection conn) {

		try {

			// 참조하는 Connetion이 있으면서 닫혀있지 않은 경우
			if(conn != null && !conn.isClosed()) {
				conn.close();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}

	}

	// Statement(부모), PreparedStatement(자식) 반환 메소드(다형성 적용)
	public static void close(Statement stmt) {

		try {
			// 참조하는 Statement가 있으면서 닫혀있지 않은 경우
			if(stmt != null && !stmt.isClosed()) {
				stmt.close();
			}

		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	// ResultSet 반환 메소드
	public static void close(ResultSet rs) {

		try {
			// 참조하는 ResultSet가 있으면서 닫혀있지 않은 경우
			if(rs != null && !rs.isClosed()) {
				rs.close();
			}

		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 트랜잭션 제어
	
	// commit
	public static void commit(Connection conn) {

		try {
			// 참조하는 Connection이 있으면서 닫혀있지 않은 경우
			if(conn != null && !conn.isClosed()) {
				conn.commit();
			}

		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// rollback 메소드
	public static void rollback(Connection conn) {

		try {
			// 참조하는 Connection이 있으면서 닫혀있지 않은 경우
			if(conn != null && !conn.isClosed()) {
				conn.rollback();
			}

		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
