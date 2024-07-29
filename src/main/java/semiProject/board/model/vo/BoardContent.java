package semiProject.board.model.vo;



import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter // getter 자동 추가
@Setter // setter 자동 추가
@ToString // toString 자동 추가import lombok.Getter;

public class BoardContent {
	
	int contentNo;
	String content;
	int contentSize;
	int contentLevel;
	int boardNo;
	
	public BoardContent() {}

	public BoardContent(int contentNo, String content, int contentSize, int contentLevel, int boardNo) {
		super();
		this.contentNo = contentNo;
		this.content = content;
		this.contentSize = contentSize;
		this.contentLevel = contentLevel;
		this.boardNo = boardNo;
	}

	// 마지막은 지도임을 잊지말자!!
	


	
	
}
