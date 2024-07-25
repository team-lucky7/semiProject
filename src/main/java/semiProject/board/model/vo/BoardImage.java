package semiProject.board.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardImage {
	
	int imgNo;
	int imgSize;
	String imgRename;
	String imgOriginal;
	int imgLevel;
	int boardNo;
}