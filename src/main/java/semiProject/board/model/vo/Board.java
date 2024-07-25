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
	private String boardContent;
	private String createDate;
	private int readCount;
	private int likeCount;
	private int locationCode;
	private int memberNo;
	private List<String> hashtagOption;
	private String locationName;
	private String memberName;
	private int boardCode;
	private String boardName;
	
	private String thumbnail;
	private int boardCode;
	
	private List<String> hashtagList;
}