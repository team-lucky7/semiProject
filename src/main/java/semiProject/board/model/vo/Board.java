package semiProject.board.model.vo;

import java.util.List;

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
	private int readCount;
	private int likeCount;
	private String locationName;
	private String memberName;
	private String thumbnail;
	
	private List<String> hashtagList;
}
