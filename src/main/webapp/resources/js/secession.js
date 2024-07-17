function printAlert(el, message) {
  alert(message);
  el.focus();
  return false;
}

function secessionValidate() {
  const memberName = document.getElementById("memberName");
  const memberPw = document.getElementById("memberPw");
  const memberPwConfirm = document.getElementById("memberPwConfirm");
  const secession = document.getElementById("secession");

  

  if (memberName.value.length == 0) { // 미작성

    return printAlert(memberName, "이름을 입력해주세요.")
  }

  if ( memberName.value != loginMemberName){
    
    return printAlert(memberName, "이름이 일치하지 않습니다.")
  }

  if (memberPw.value.length == 0) {

    return printAlert(memberPw, "비밀번호를 입력해주세요.")
  }

  if (memberPwConfirm.value.length == 0) {

    return printAlert(memberPwConfirm, "비밀번호를 다시 입력해주세요.")
  }

  if(memberPw.value != memberPwConfirm.value){

    return printAlert(memberPwConfirm, "비밀번호가 일치하지 않습니다.")
  }

  if (secession.value.length == 0 || secession.value != '탈퇴하겠습니다') {
    return printAlert(secession, "'탈퇴하겠습니다'를 입력해주세요.'")
  }

  if (!confirm("정말 탈퇴 하시겠습니까?")) {

    return false;
    
  }

  return true;


}




