const currenPw = document.getElementById("currentPw");
const newPw = document.getElementsByName("newPw")[0];
const newPwConfirm = document.getElementsByName("newPwConfirm")[0];

const currentPwMessage = document.getElementById("currentPwMessage");
const newPwMessage = document.getElementById("newPwMessage");
const newPwConfirmMessage = document.getElementById("newPwConfirmMessage");

currenPw.addEventListener("click",function(){
    currentPwMessage.innerHTML = "비밀번호를 입력해주세요."
    currentPwMessage.classList.add("error");
})

currenPw.addEventListener("blur",function(){
    currentPwMessage.innerHTML = "";
})

newPw.addEventListener("click",function(){
  newPwMessage.innerHTML = "새 비밀번호를 입력해주세요."
  newPwMessage.classList.add("error");
})

newPw.addEventListener("blur",function(){
  newPwMessage.innerHTML = "";
})

newPwConfirm.addEventListener("click",function(){
  newPwConfirmMessage.innerHTML = "새 비밀번호 확인을 입력해주세요."
  newPwConfirmMessage.classList.add("error");
})

newPwConfirm.addEventListener("blur",function(){
  newPwConfirmMessage.innerHTML = "";
})