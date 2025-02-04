function infoValidate(){
    
    const memberEmail = document.getElementsByName("memberEmail")[0];
    const memberTel = document.getElementsByName("memberTel")[0];
    const inputImage = document.getElementById("input-image");
    
    const regEx1 = /^[\w\-\_]{4,}@[a-z]+(\.\w+){1,2}$/ // 이메일 정규식
    const regEx2 = /^0(10|2|[3-6][1-5]|70)\d{3,4}\d{4}$/ // 전화번호 정규식 

    if(memberEmail.value.length == 0){
        return printAlert(memberEmail, "이메일을 입력해주세요.")
    }

    if(!regEx1.test(memberEmail.value)){
        return printAlert(memberEmail, "이메일 형식이 맞지 않습니다.")
    }
    
    if(memberTel.value.trim().length == 0){
        return printAlert(memberTel, "전화번호를 입력해주세요.")
    }

    if(!regEx2.test(memberTel.value)){
        return printAlert(memberTel, "-없이 숫자만 입력")
    }

    if(inputImage.value == ""){
        alert("이미지를 선택한 후 변경 버튼을 클릭해주세요.");
        return false;
    }

    return true;
}

function printAlert(el, message){ 
    alert(message);
    el.focus();
    return false;
}

const inputImage = document.getElementById("input-image");

inputImage.addEventListener("change", function(){
	
	if(this.files[0] != undefined){
		const reader = new FileReader;
		
		reader.readAsDataURL(this.files[0]);
		
		reader.onload = function(e){
			const profileImage = document.getElementById("profileImage");
			
			profileImage.setAttribute("src", e.target.result);
		}
	}
})
