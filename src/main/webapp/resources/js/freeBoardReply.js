function selectReplyList(){

    $.ajax({
        url : contextPath + "/reply/selectReplyList",
        data : {"boardNo" : boardNo},
        type : "GET",
        dataType : "JSON", // JSON 형태 문자열 응답 데이터를 JS 객체로 자동 변환

        success : function(rList){
            const replyList = document.getElementById("reply-list"); // ul태그
            replyList.innerHTML = "";

            for(let reply of rList){

                // 행
                const replyRow = document.createElement("li");
                replyRow.classList.add("reply-row");

                // 작성자
                const replyWriter = document.createElement("p");
                replyWriter.classList.add("reply-writer");

                // 프로필 이미지
                const profileImage = document.createElement("img");
                if(reply.profileImage != null){ // 프로필 이미지가 있는 경우
                    profileImage.setAttribute("src", contextPath + reply.profileImage);
                }else{ // 없는 경우 == 기본 이미지
                    profileImage.setAttribute("src", contextPath + "/resources/images/user.png");
                }

                // 작성자
                const memberName = document.createElement("span");
                memberName.innerText = reply.memberName;

                // 작성일
                const replyDate = document.createElement("span");
                replyDate.innerText = " ("+ reply.createDate + ")";
                replyDate.classList.add("reply-date");

				// 좋아요 버튼
				const likeBtn = document.createElement("button");
				likeBtn.innerText = "좋아요 " + reply.likeCount;
				console.log(reply.isLike);
				likeBtn.classList.add("like-btn");
				if(reply.isLike){
					likeBtn.classList.add("like-true");
					likeBtn.setAttribute("onclick", "deleteLike(" + reply.replyNo + ")");
				}else{
					likeBtn.setAttribute("onclick", "insertLike(" + reply.replyNo + ")");
				}

                // 작성자 영역(p)에 프로필, 작성자, 작성일 마지막 자식으로 추가
                replyWriter.append(profileImage, memberName, replyDate, likeBtn);
                
                // 내용
                const replyContent = document.createElement("p");
                replyContent.classList.add("reply-content");
                replyContent.innerHTML = reply.replyContent;

                // 행에 작성자, 내용, 버튼 추가
                replyRow.append(replyWriter, replyContent);

                // 로그인한 회원 번호와 댓글 작성자의 회원 번호가 같을 때만 버튼 추가
                if(reply.memberNo == loginMemberNo){

                    // 버튼 영역
                    const replyBtnArea = document.createElement("div");
                    replyBtnArea.classList.add("reply-btn-area");
                    
                    // 수정 버튼
                    const updateBtn = document.createElement("button");
                    updateBtn.innerText = "수정";
                    updateBtn.setAttribute("onclick", "showUpdateReply(" + reply.replyNo +", this)");

                    // 삭제 버튼
                    const deleteBtn = document.createElement("button");
                    deleteBtn.innerText = "삭제";

                    // 삭제 버튼에 onlick 이벤트 속성 추가
                    deleteBtn.setAttribute("onclick", "deleteReply(" + reply.replyNo + ")");

                    // 버튼 영역 마지막 자식으로 수정/삭제 버튼 추가
                    replyBtnArea.append(updateBtn, deleteBtn);

                    // 행에 버튼 영역 추가
                    replyRow.append(replyBtnArea);
                }

                // 댓글 목록(ul)에 행(li)추가
                replyList.append(replyRow);

            }
        },
        error : function(){
            console.log("에러 발생")
        }
    })
}

/* 댓글 수정 */
let beforeReplyRow; // 수정 전 원래 행의 상태를 저장할 변수

function showUpdateReply(replyNo, btn){

    const temp = document.getElementsByClassName("update-textarea");

    if(temp.length > 0){ 
        if(confirm("다른 댓글이 수정 중입니다. 현재 댓글을 수정하시겠습니까?")){
            temp[0].parentElement.innerHTML = beforeReplyRow;
        }else{
            return;
        }
    }

    const replyRow = btn.parentElement.parentElement;

    beforeReplyRow = replyRow.innerHTML;

    let beforeContent = btn.parentElement.previousElementSibling.innerHTML;
    replyRow.innerHTML = "";

    const textarea = document.createElement("textarea");
    textarea.classList.add("update-textarea");

    beforeContent = beforeContent.replaceAll("&amp;", "&");
    beforeContent = beforeContent.replaceAll("&lt;", "<");
    beforeContent = beforeContent.replaceAll("&gt;", ">");
    beforeContent = beforeContent.replaceAll("&quot;", "\"");

    beforeContent = beforeContent.replaceAll("<br>", "\n");

    textarea.value = beforeContent;

    replyRow.append(textarea);

    const replyBtnArea = document.createElement("div");
    replyBtnArea.classList.add("reply-btn-area");
    
    const updateBtn = document.createElement("button");
    updateBtn.innerText = "수정";
    updateBtn.setAttribute("onclick", "updateReply(" + replyNo +", this)");

    const cancelBtn = document.createElement("button");
    cancelBtn.innerText = "취소";
    cancelBtn.setAttribute("onclick", "updateCancel(this)");

    replyBtnArea.append(updateBtn, cancelBtn);
    replyRow.append(replyBtnArea);
}

function updateCancel(btn){
    if(confirm("댓글 수정을 취소하시겠습니까?")){
        btn.parentElement.parentElement.innerHTML = beforeReplyRow;
    }
}

// 댓글 수정
function updateReply(replyNo, btn){

    const replyContent = btn.parentElement.previousElementSibling.value;
    
    $.ajax({
        url : contextPath + "/reply/update",
        data : {"replyNo" : replyNo, 
                "replyContent" : replyContent},
        type : "POST",
        success : function(result){
            if(result > 0){
                alert("댓글이 수정되었습니다.");
                selectReplyList();
            }else{
                alert("댓글 수정 실패");
            }
        },
        error : function(req, status, error){
            console.log("에러 발생");
            console.log(req.responseText);
        }
    })
}

/* 댓글 삭제 */
function deleteReply(replyNo){

    if(confirm ("정말로 삭제 하시겠습니까?")){
        $.ajax({
            url : contextPath + "/reply/delete",
            data : {"replyNo" : replyNo},
            success : function(result){
                if(result > 0){
                    alert("삭제되었습니다.");
                    selectReplyList();
                }else{
                    alert("삭제 실패");
                }
            },
            error : function(req, status, error){
                console.log("댓글 삭제 실패");
                console.log(req.responseText);
            }
        })
    }
}

/* 댓글 작성 */
const replyContent = document.getElementById("replyContent");

replyContent.addEventListener("click", function(){
	if(loginMemberNo == ""){
		this.setAttribute("readonly", "readonly");
	}
})

const addReply = document.getElementById("addReply");

addReply.addEventListener("click", function(){
	if(replyContent.value.trim().length == 0){
		alert("댓글을 작성한 후 버튼을 클릭해주세요.");
        replyContent.focus();
        replyContent.value = "";
        return;
	}

	$.ajax({
		url: contextPath + "/reply/insert",
		data: {"replyContent" : replyContent.value,
				"boardNo" : boardNo,
				"memberNo" : loginMemberNo},
		type: "POST",
		success: function(res){
			if(res > 0){
				alert("댓글이 등록되었습니다.");
                selectReplyList();
                replyContent.value = "";
                replyContent.focus();
			}else{
				console.log("댓글 등록 실패 ㅠㅠ")
			}
		},
		error: function(){}
	})
})

// 좋아요 등록
function insertLike(boardReplyNo){

	if(loginMemberNo == ""){
		alert("로그인 후 이용해주세요");
		return;
	}

	$.ajax({
		url: contextPath + "/like/insert",
		data: {"boardReplyNo" : boardReplyNo,
				"memberNo" : loginMemberNo},
		type: "POST",
		success: function(result){
			if(result > 0){
				alert("좋아요를 등록하였습니다.");
				selectReplyList();
			}else{
				console.log("좋아요 등록 실패 ㅠㅠ")
			}
		},
		error: function(){}
	})
}

// 좋아요 삭제
function deleteLike(boardReplyNo, el){
	$.ajax({
		url: contextPath + "/like/delete",
		data: {"boardReplyNo" : boardReplyNo,
			"memberNo" : loginMemberNo},
		type: "POST",
		success: function(result){
			if(result > 0){
				alert("좋아요를 삭제하였습니다.");
				selectReplyList();
			}else{
				console.log("좋아요 삭제 실패 ㅠㅠ")
			}
		},
		error: function(){}
	})
}

document.getElementById("likeBtn").addEventListener("click", function(){
	location.reload();
})

