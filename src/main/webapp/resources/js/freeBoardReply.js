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
		alert("로그인 후 이용해주세요");
		this.setAttribute("readonly", "readonly");
	}else{
		this.removeAttribute("readonly");
	}
})