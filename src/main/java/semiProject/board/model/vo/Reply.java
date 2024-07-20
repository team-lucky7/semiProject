package semiProject.board.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class Reply {
	private int replyNo;
	private String replyContent;
	private String replyStatus;
	private String createDate;
	private String boardNo;
	private String memberNo;
	private int likeCount;
}
