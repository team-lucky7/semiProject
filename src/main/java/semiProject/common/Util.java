package semiProject.common;

public class Util {
	
	// 개행 문자 -> <br>변경 메소드
	public static String newLineHandling(String content) {
		return content.replaceAll("(\r\n|\n\r|\n|\r)","<br>");
		
		// \r\n|\n\r|\n|\r 순서 이유
		//   1 |  2 | 3| 4
		
		// textarea의 엔터 : \r\n
		// \r : 캐리지 리턴(첫 번째로 돌아가기)
		// \n : new line(다음줄로 이동)
	}
	
	// Cross Site Scripting(XSS, 크로스 사이트 스크립팅) 공격 방지 처리 메소드
	public static String XSSHandling(String content) {
		// <, >, &, " 문자를 HTML 코그가 아닌 문자 그대로 보이도록 변경
		
		content = content.replaceAll("&", "&amp;"); // &lt;h1&gt;
		content = content.replaceAll("<", "&lt;"); // &lt;h1>
		content = content.replaceAll(">", "&gt;"); // &lt;h1&gt;
		content = content.replaceAll("\"", "&quot;"); // &lt;h1&gt;
		// content = content.replaceAll("&", "&amp;"); // &amp;lt;h1&amp;gt;
		//  ** content.replaceAll("&", "&amp;")가 순서가 아래일 경우 &amp;lt;h1&amp;gt; 상황발생
		return content;
	}
	

}
