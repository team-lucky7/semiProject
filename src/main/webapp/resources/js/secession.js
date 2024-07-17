const memberId = document.getElementById("memberId");
const memberPw = document.getElementById("memberPw");
const memberPwConfirm = document.getElementById("memberPwConfirm");
const secession = document.getElementById("secession");

const memberIdMessage = document.getElementById("memberIdMessage");
const memberPwMessage = document.getElementById("memberPwMessage");
const memberPwConfirmMessage = document.getElementById("memberPwConfirmMessage");
const secessionMessage = document.getElementById("secessionMessage");

memberId.addEventListener("click",function(){
    memberIdMessage.innerHTML = "이름을 입력해주세요."
    memberIdMessage.classList.add("error");
})

memberId.addEventListener("blur",function(){
    memberIdMessage.innerHTML = "";
})

memberPw.addEventListener("click",function(){
  memberPwMessage.innerHTML = "비밀번호를 입력해주세요."
  memberPwMessage.classList.add("error");
})

memberPw.addEventListener("blur",function(){
  memberPwMessage.innerHTML = "";
})

memberPwConfirm.addEventListener("click",function(){
  memberPwConfirmMessage.innerHTML = "비밀번호를 한번 더 입력해주세요."
  memberPwConfirmMessage.classList.add("error");
})

memberPwConfirm.addEventListener("blur",function(){
  memberPwConfirmMessage.innerHTML = "";
})



