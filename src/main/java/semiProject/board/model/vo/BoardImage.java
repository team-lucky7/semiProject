package semiProject.board.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardImage {
	private int imageNo;
	private int imageSize;
	private String imageRename;
	private String imageOriginal;
	private int imageLevel;
	private int boardNo;
}
