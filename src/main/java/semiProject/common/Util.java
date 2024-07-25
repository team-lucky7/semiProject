package semiProject.common;

public class Util {
	
	public static String newLineHandling(String content) {
		return content.replaceAll("(\r\n|\n\r|\n|\r)","<br>");
	}
	
	public static String XSSHandling(String content) {
		
		content = content.replaceAll("&", "&amp;");
		content = content.replaceAll("<", "&lt;");
		content = content.replaceAll(">", "&gt;");
		content = content.replaceAll("\"", "&quot;");

		return content;
	}
	
}
