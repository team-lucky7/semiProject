package semiProject.board.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class Board {
	private int boardNo;
	private String boardTitle;
	private String boardComment;
	private String createDate;
	private String updateDate;
	private String readCount;
	private String memberNo;
	private String boardName;
	private String locationName;
	private int likeCount;
	
	private String[] hashtagName;
}
