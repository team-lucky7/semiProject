const checkObj = { // k:v, k:v ...
    "memberId"       : false,
    "memberPw"          : false,
    "memberPwConfirm"   : false,
    "memberName"    : false,
    "memberGender"         : false,
    "memberDOB"         : false,
    "memberEmail"         : false,
    "memberTel"         : false
};

/* 아이디 유효성 검사 */
const memberId = document.getElementById("memberId");
const idMessage = document.getElementById("idMessage");
memberId.addEventListener("input", () => {})

/* 비밀번호 유효성 검사 */
const memberPw = document.getElementById("memberPw");
const memberPwConfirm = document.getElementById("memberPwConfirm");
const pwMessage = document.getElementById("pwMessage");


/* 이름 유효성 검사 */
const memberName = document.getElementById("memberName");
const nameMessage = document.getElementById("nameMessage");
memberName.addEventListener("input",()=>{
    if(memberName.value.trim().length == 0){
        nameMessage.innerText = "이름을 입력해주세요.";
        nameMessage.classList.remove("error", "confirm");
        return;
    }

    const regExp = /^[가-힣]{2,6}$/;
    if(regExp.test(memberName.value)){
        nameMessage.innerText = "유효한 이름 형식입니다.";
        nameMessage.classList.remove("error");
        nameMessage.classList.add("confirm");
        checkObj.memberName = true;
        return;
    }else{
        nameMessage.innerText = "이름 형식이 올바르지 않습니다.";
        nameMessage.classList.remove("confirm");
        nameMessage.classList.add("error");
        checkObj.memberName = false;
    }
})

/* 성별 유효성 검사 */
const memberGender = document.getElementsByName("memberGender");
const genderMessage = document.getElementById("genderMessage");
for(let i=0; i<memberGender.length; i++){
    memberGender[i].addEventListener("change", ()=>{
        if(memberGender[0].checked || memberGender[1].checked){
            genderMessage.innerText = "유효한 성별 형식입니다..";
            genderMessage.classList.remove("error");
            genderMessage.classList.add("confirm");
            checkObj.memberGender=true; // 유효하지 않은 상태임을 기록
            return;
        }else{
            genderMessage.innerText = "성별을 선택해주세요.";
            genderMessage.classList.remove("confirm");
            genderMessage.classList.add("error");
            checkObj.memberGender=false; // 유효하지 않은 상태임을 기록
            return;
        }
    })
}

/* 생년월일 유효성 검사 */
const memberDOB = document.getElementById("memberDOB");
const dobMessage = document.getElementById("dobMessage");
memberDOB.addEventListener("input", ()=>{
    if(memberDOB.value.trim().length == 0){
        dobMessage.innerText = "생년월일를 입력해주세요.";
        dobMessage.classList.remove("error", "confirm");
        checkObj.memberDOB=false; // 유효하지 않은 상태임을 기록
        return;
    }

    const regExp = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
    if(regExp.test(memberDOB.value)){
        dobMessage.innerText="유효한 생년월일 형식입니다.";
        dobMessage.classList.remove("error");
        dobMessage.classList.add("confirm");
        checkObj.memberDOB=true;
    }else{
        dobMessage.innerText="생년월일 형식이 올바르지 않습니다.";
        dobMessage.classList.remove("confirm");
        dobMessage.classList.add("error");
        checkObj.memberDOB=false;
    }    
})

/* 이메일 유효성 검사 */
const memberEmail = document.getElementById("memberEmail");
const emailMessage = document.getElementById("emailMessage");
memberEmail.addEventListener("input", ()=>{
    if(memberEmail.value.trim().length == 0){
        emailMessage.innerText = "이메일를 입력해주세요.";
        emailMessage.classList.remove("error", "confirm");
        checkObj.memberEmail=false; // 유효하지 않은 상태임을 기록
        return;
    }

    const regExp = /^[\w\-\_]{4,}@[a-z]+(\.\w+){1,3}$/;
    if(regExp.test(memberEmail.value)){
        emailMessage.innerText="유효한 이메일 형식입니다.";
        emailMessage.classList.remove("error");
        emailMessage.classList.add("confirm");
        checkObj.memberEmail=true;
    }else{
        emailMessage.innerText= "이메일 형식이 올바르지 않습니다.";
        emailMessage.classList.remove("confirm");
        emailMessage.classList.add("error");
        checkObj.memberEmail=false;
    }    
})

/* 휴대폰번호 유효성 검사 */
const memberTel = document.getElementById("memberTel");
const telMessage = document.getElementById("telMessage");
memberTel.addEventListener("input", ()=>{
    if(memberTel.value.trim().length == 0){
        telMessage.innerText = "전화번호를 입력해주세요.(-제외)";
        telMessage.classList.remove("error", "confirm");
        checkObj.memberTel=false; // 유효하지 않은 상태임을 기록
        return;
    }

    const regExp = /^0(10|2|[3-6][1-5]|70)\d{3,4}\d{4}$/;
    if(regExp.test(memberTel.value)){
        telMessage.innerText="유효한 전화번호 형식입니다.";
        telMessage.classList.remove("error");
        telMessage.classList.add("confirm");
        checkObj.memberTel=true;
    }else{
        telMessage.innerText="전화번호 형식이 올바르지 않습니다.";
        telMessage.classList.remove("confirm");
        telMessage.classList.add("error");
        checkObj.memberTel=false;
    }    
})

