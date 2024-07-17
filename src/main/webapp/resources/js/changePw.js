function printAlert(el, message){ // 매개변수 el은 요소 
  alert(message);
  el.focus();
  return false;
}

// 비밀번호 변경 제출 시 유효성 검사 
function changePwValidate(){

  const currenPw = document.getElementById("currentPw");
  const newPw = document.getElementsByName("newPw")[0];
  const newPw2 = document.getElementsByName("newPwConfirm")[0];

  const regExp1 = /^[a-zA-Z0-9!@#-_]{6,30}$/;

  if(currenPw.value.length == 0){
      return printAlert(currenPw, "현재 비밀번호를 입력해주세요.")
  }

  if(newPw.value.length == 0){
      return printAlert(newPw, "새 비밀번호를 입력해주세요.")
  }

  if (!regExp1.test(newPw.value)) { 
      return printAlert(newPw, "영어,숫자,특수문자(!,@,#,-,_) 6~30글자 사이로 작성해주세요.")
  }

  if(newPw2.value.length == 0){
      return printAlert(newPw2, "새 비밀번호 확인을 입력해주세요.")
  }

  if(newPw.value != newPw2.value){
      return printAlert(newPw2, "새 비밀번호가 일치하지 않습니다.")
  }

  return true;
}