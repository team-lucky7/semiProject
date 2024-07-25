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
<<<<<<< HEAD
	private String boardComment;
=======
>>>>>>> origin/main
	private String createDate;
	private int readCount;
	private int likeCount;
	private int locationCode;
	private int memberNo;
	private int boardCd;
	private List<String> hashtagOption;
	private String locationName;
	private String memberName;
<<<<<<< HEAD
	private int boardCode;
	private int locationCode;
	private int memberNo;
	private String  boardName;
	
=======
>>>>>>> origin/main
	private String thumbnail;
	
	private List<String> hashtagList;
}