function loginValidate(){
    const inputId  = document.getElementsByName("inputId")[0];
    const inputPw  = document.getElementsByName("inputPw")[0];

    if(inputId.value.trim().length == 0){
        return printAlert(inputId, "아이디를 입력해주세요.");
    }

    if(inputPw.value.trim().length == 0){
        return printAlert(inputPw, "비밀번호를 입력해주세요.");
    }

    return true;
}

function printAlert(el, message){
    el.focus();
    alert(message);

    return false;
}

document.getElementsByName("saveId")[0].addEventListener("change", function(){
    
    if(this.checked){
        
        const str = "개인 정보 보호를 위해 개인 PC에서의 사용을 권장합니다. 개인 PC가 아닌 경우 취소를 눌러주세요.";

        this.checked = confirm(str);
        
    }

})