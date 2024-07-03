document.getElementsByName("saveId")[0].addEventListener("change", function(){
    
    if(this.checked){
        
        const str = "개인 정보 보호를 위해 개인 PC에서의 사용을 권장합니다. 개인 PC가 아닌 경우 취소를 눌러주세요.";

        this.checked = confirm(str);
        
    }

})