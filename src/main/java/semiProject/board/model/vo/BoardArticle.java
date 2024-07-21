package semiProject.board.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class BoardArticle {
	private int boardContentNo;
	private String content;
	private int contentSize;
	private int contentLevel;
}
