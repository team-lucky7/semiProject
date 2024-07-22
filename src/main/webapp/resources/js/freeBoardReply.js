/* 댓글 목록 조회(ajax) */
function selectReplyList(){
	
}

/* 댓글 수정 */
function showUpdateReply(replyNo, btn){

}

/* 댓글 작성 */
const replyContent = document.getElementById("replyContent");

replyContent.addEventListener("click", function(){
	if(loginMemberNo == ""){
		this.setAttribute("readonly", "readonly");
	}
})