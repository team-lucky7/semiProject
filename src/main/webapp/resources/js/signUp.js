const checkObj = { // k:v, k:v ...
    "memberId": false,
    "memberPw": false,
    "memberPwConfirm": false,
    "memberName": false,
    "memberGender": false,
    "memberDOB": false,
    "memberEmail": false,
    "memberTel": false
};

function empty(el, message) {
    el.innerText = message + "를 입력해주세요.";
    el.classList.remove("error", "confirm");
}

function error(el, message) {
    el.innerText = message + " 형식이 올바르지 않습니다. 다시 입력해주세요";
    el.classList.remove("confirm");
    el.classList.add("error");
}

function confirm(el, message) {
    el.innerText = "유효한 " + message + " 형식입니다";
    el.classList.remove("error");
    el.classList.add("confirm");
}

/* 아이디 유효성 검사 */
const memberId = document.getElementById("memberId");
const idMessage = document.getElementById("idMessage");
const idDupChkBtn = document.getElementById("idDupChkBtn");
memberId.addEventListener("input", () => {
    if (memberId.value.trim().length == 0) {
        empty(idMessage, "아이디");
        checkObj.memberId = false;
        return;
    }

    const regExp = /^[a-z\d]{4,20}$/;
    if (regExp.test(memberId.value)) {
        idMessage.innerText = "아이디 중복검사를 해주세요.";
        idMessage.classList.remove("confirm");
        idMessage.classList.add("error");
        checkObj.memberId = false;
    } else {
        error(idMessage, "아이디");
        checkObj.memberId = false;
    }
})


idDupChkBtn.addEventListener("click", e => {

    const regExp = /^[a-z\d]{4,20}$/;
    if (regExp.test(memberId.value)) {
        $.ajax({
            url: "idDupCheck",
            data: { "memberId": memberId.value },
            type: "POST", // 데이터 전달 방식
            success: function (result) {
                console.log(result);

                if (result == 1) { // 중복 O
                    idMessage.innerText = "이미 사용중인 아이디입니다."
                    idMessage.classList.remove("confirm");
                    idMessage.classList.add("error");
                    checkObj.memberId = false;

                } else {
                    idMessage.innerText = "사용 가능한 아이디입니다."
                    idMessage.classList.remove("error");
                    idMessage.classList.add("confirm");
                    checkObj.memberId = true;
                }
            },
            error: function () {
                // 비동기 통신(ajax) 중 오류가 발생한 경우
                console.log("에러 발생");
            }
        });
    } else {
        e.preventDefault();
        memberId.focus();
    }
})

/* 비밀번호 유효성 검사 */
const memberPw = document.getElementById("memberPw");
const memberPwConfirm = document.getElementById("memberPwConfirm");
const pwMessage = document.getElementById("pwMessage");


/* 이름 유효성 검사 */
const memberName = document.getElementById("memberName");
const nameMessage = document.getElementById("nameMessage");
memberName.addEventListener("input", () => {
    if (memberName.value.trim().length == 0) {
        empty(nameMessage, "이름");
        checkObj.memberName = false;
        return;
    }

    const regExp = /^[가-힣]{2,6}$/;
    if (regExp.test(memberName.value)) {
        confirm(nameMessage, "이름");
        checkObj.memberName = true;
        return;
    } else {
        error(nameMessage, "이름");
        checkObj.memberName = false;
    }
})

/* 성별 유효성 검사 */
const memberGender = document.getElementsByName("memberGender");
const genderMessage = document.getElementById("genderMessage");
for (let i = 0; i < memberGender.length; i++) {
    memberGender[i].addEventListener("change", () => {
        if (memberGender[i].checked) {
            confirm(genderMessage, "성별");
            checkObj.memberGender = true;
            return;
        }
    })
}

/* 생년월일 유효성 검사 */
const memberDOB = document.getElementById("memberDOB");
const dobMessage = document.getElementById("dobMessage");
memberDOB.addEventListener("input", () => {
    if (memberDOB.value.trim().length == 0) {
        empty(dobMessage, "생년월일");
        checkObj.memberDOB = false;
        return;
    }

    const regExp = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
    if (regExp.test(memberDOB.value)) {
        confirm(dobMessage, "생년월일");
        checkObj.memberDOB = true;
    } else {
        error(dobMessage, "생년월일");
        checkObj.memberDOB = false;
    }
})

/* 이메일 유효성 검사 */
const memberEmail = document.getElementById("memberEmail");
const emailMessage = document.getElementById("emailMessage");
memberEmail.addEventListener("input", () => {
    if (memberEmail.value.trim().length == 0) {
        empty(emailMessage, "이메일");
        checkObj.memberEmail = false;
        return;
    }

    const regExp = /^[\w\-\_]{4,}@[a-z]+(\.\w+){1,3}$/;
    if (regExp.test(memberEmail.value)) {
        confirm(emailMessage, "이메일");
        checkObj.memberEmail = true;
    } else {
        error(emailMessage, "이메일");
        checkObj.memberEmail = false;
    }
})

/* 휴대폰번호 유효성 검사 */
const memberTel = document.getElementById("memberTel");
const telMessage = document.getElementById("telMessage");
memberTel.addEventListener("input", () => {
    if (memberTel.value.trim().length == 0) {
        empty(telMessage, "휴대폰번호");
        checkObj.memberTel = false;
        return;
    }

    const regExp = /^0(10|2|[3-6][1-5]|70)\d{3,4}\d{4}$/;
    if (regExp.test(memberTel.value)) {
        confirm(telMessage, "휴대폰번호");
        checkObj.memberTel = true;
    } else {
        error(telMessage, "휴대폰번호");
        checkObj.memberTel = false;
    }
})

