console.log("test")

function printAlert(el, message){ // 매개변수 el은 요소 
    alert(message);
    el.focus();
    return false;
  }

function searchIdValidate(){
    const inputEmail = document.getElementsByName("inputEmail")[0];
    const inputPhone = document.getElementsByName("inputPhone")[0];

    if(inputEmail.value.trim().length == 0){
        return printAlert(inputEmail, "이메일을 입력해주세요.")
    }

    if(inputPhone.value.trim().length == 0){
        return printAlert(inputPhone, "(-)빼고 전화번호를 입력해주세요.")
    }
    
    return true;

}