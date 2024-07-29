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
public class BoardDetail {
	private int boardNo;
	private String boardTitle;
	private String boardName;
	private String boardContent;
	private String profileImage;
	private String createDate;
	private String updateDate;
	private int readCount;
	private String locationName;
	private int locationCode;
	private String memberName;
	private int memberNo;
	private int boardCode;
	private int likeCount;
	private boolean isLike;
	private String mapAddress;
	private String content;

	private List<BoardArticle> articleList;
	private List<BoardImage> ImageList;
	private List<String> hashtagList;

	
	// community용 추가(2개)
	private List<String> hashtagOption;
	private String thumbnail;
	
}
