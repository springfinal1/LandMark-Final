

let joinBtn = document.querySelector('.join-btn'); // 확인버튼

let idCheck = document.querySelector('.id-check'); // 아이디 유효성검사 영역
let pwdCheck = document.querySelector('.pwd-check'); // 비밀번호 유효성검사 영역
let pwdCheck2 = document.querySelector('.pwd-check2'); // 비밀번호 일치확인 메시지 영역
let nameCheck = document.querySelector('.name-check'); // 이름 유효성검사 영역
let ageCheck = document.querySelector('.age-check'); // 나이 유효성검사 영역
let phoneCheck = document.querySelector('.phone-check'); // 폰넘버 유효성검사 영역
let emailCheck = document.querySelector('.email-check'); // 이메일 유효성검사 영역
let addressCheck = document.querySelector('.address-check'); // 주소 유효성검사 영역

let idVal = document.getElementById('id'); // id 입력값
let pwdVal = document.getElementById('pwd'); // pwd 입력값
let rePwdVal = document.getElementById('pwd2'); // pwd 확인 입력값
let nameVal = document.getElementById('name'); // name 입력값
let ageVal = document.getElementById('age'); // age 입력값
let phoneVal = document.getElementById('phone'); // phoneNumber 입력값
let emailVal = document.getElementById('email'); // email 입력값(최종 => moon88@google.com)
let addressVal = document.getElementById('address'); // address 입력값

let checkId = document.getElementById('checkId');
// 빈 문자열 검사(공통)
function isEmpty(value) {
    return value === "" ? true : false; // 빈문자열 이면 true 아니면 false
}
// 공백 포함 검사(공통)
function isSpace(value) {
    let regExp = /[\s]/; // 공백 체크 정규표현식
    return regExp.test(value);
}
// 영문+숫자 검사(id)
function onlyEnglishAndNumber(value) {
    let regExp = /^[a-zA-Z]+[0-9]+$/;
    return regExp.test(value);
}
// 특수문자포함+영문+숫자 검사(pwd)
function onlySpecialCharacterAndEnglishAndNumber(value) {
    let regExp = /^[\W]+[a-zA-Z]+[0-9]+$/;
    return regExp.test(value);
}
// 숫자만 입력 검사(age)
function onlyNumber(value){
    let regExp = /^[0-9]+$/;
    console.log(regExp.test(value));
    return regExp.test(value);
}
// email 형식 검사
function emailFormat(value){
    let regExp = /^[a-zA-Z0-9+-_.]+@[a-zA-Z0-9-]+\.[a-zA-Z]+$/;
    console.log(regExp.test(value));
    return regExp.test(value);
}
// 필수항목 입력확인 변수
let idOk = false;
let pwdOk = false;
let pwd2Ok = false;
let nameOk = false;
let ageOk = false;
let phoneOk = false;
let emailOk = false;

// id 유효성 검사
idVal.addEventListener('keyup', () => {
    checkId.disabled = true;
    idOk = false;
    if (isSpace(idVal.value)) {  // 공백 포함 검사
        idCheck.innerHTML = `<span class="fail">공백은 혀용하지 않습니다.</span>`;
    } else if (isEmpty(idVal.value)) { // 빈 문자열 검사
        idCheck.innerHTML = `<span class="fail">아이디를 입력하세요.</span>`;
    } else if (!(/^.{4,8}$/.test(idVal.value))) { // 길이 검사 {4,8}=> 4이상 ~ 8이하
        idCheck.innerHTML = `<span class="fail">4자이상 ~ 8자이하로 입력하세요.</span>`;
    } else if (!onlyEnglishAndNumber(idVal.value)) { // 영문 + 숫자 검사
        idCheck.innerHTML = `<span class="fail">영문 + 숫자 조합으로 입력하세요.</span>`;
    } else {
        idCheck.innerHTML = "";
        checkId.disabled = false;
    }
})

// id 중복확인 이벤트
checkId.addEventListener('click', duplicateIdCheck);

// 서버로 중복 검사 요청 비동기
async function idCheckToServer(id) {
    try {
        let resp = await fetch("/user/checkId/" + id);
        let result = await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}
// 중복 확인 함수
function duplicateIdCheck() {
    idCheckToServer(idVal.value).then(result => {
        console.log("결과 >> " + result);
        if (result == "1") {
            idCheck.innerHTML = `<span class="success">사용 가능한 아이디 입니다.</span>`;
            idOk = true; // 아이디 유효성 통과
        } else if (result == "2") {
            idCheck.innerHTML = `<span class="fail">이미 존재하는 아이디 입니다.</span>`;
        }
        console.log("결과 >> " + idCheck.innerText);
    })
}


// pwd 유효성 검사
pwdVal.addEventListener('keyup', () => {
    pwdOk = false;
    if (isSpace(pwdVal.value)) {  // 공백 포함 검사
        pwdCheck.innerHTML = `<span class="fail">공백은 혀용하지 않습니다.</span>`;
    } else if (isEmpty(pwdVal.value)) { // 빈 문자열 검사
        pwdCheck.innerHTML = `<span class="fail">비밀번호를 입력하세요.</span>`;
    } else if (!(/^.{4,8}$/.test(pwdVal.value))) { // 길이 검사 {4,8}=> 4이상 ~ 8이하
        pwdCheck.innerHTML = `<span class="fail">4자이상 ~ 8자이하로 입력하세요.</span>`;
    } else if (!onlySpecialCharacterAndEnglishAndNumber(pwdVal.value)) { // 특수문자 + 영문 + 숫자 검사
        pwdCheck.innerHTML = `<span class="fail">특수문자 + 영문 + 숫자 조합으로 입력하세요.</span>`;
    } else {
        pwdCheck.innerHTML = "";
        pwdOk = true;
    }
})

// 비밀번호 일치 확인 이벤트
pwdVal.addEventListener('blur', checkPwd);
rePwdVal.addEventListener('input', checkPwd);
function checkPwd(){
    pwd2Ok = false;
    if(isEmpty(pwd.value)){
        pwdCheck2.innerHTML = "";
    } else if(pwd.value == rePwdVal.value){
        pwdCheck2.innerHTML = `<span class="success">비밀번호 일치</span>`;
        pwd2Ok = true;
    } else{
        pwdCheck2.innerHTML = `<span class="fail">비밀번호가 일치하지 않습니다.</span>`;
    }
}

// name 유효성 검사
nameVal.addEventListener('keyup', () => {
    nameOk = false;
    if (isSpace(nameVal.value)) {  // 공백 포함 검사
        nameCheck.innerHTML = `<span class="fail">공백은 혀용하지 않습니다.</span>`;
    } else if (isEmpty(nameVal.value)) { // 빈 문자열 검사
        nameCheck.innerHTML = `<span class="fail">이름을 입력하세요.</span>`;
    } else {
        nameCheck.innerHTML = "";
        nameOk = true;
    }
})

// age 유효성 검사
ageVal.addEventListener('keyup', () => {
    ageOk = false;
    if (isSpace(ageVal.value)) {  // 공백 포함 검사
        ageCheck.innerHTML = `<span class="fail">공백은 혀용하지 않습니다.</span>`;
    } else if (isEmpty(ageVal.value)) { // 빈 문자열 검사
        ageCheck.innerHTML = `<span class="fail">나이를 입력하세요.</span>`;
    } else if(!onlyNumber(ageVal.value)){
        ageCheck.innerHTML = `<span class="fail">숫자만 입력하세요.</span>`;
    } else {
        ageCheck.innerHTML = "";
        ageOk = true;
    }
})

// 연락처 유효성 검사
phoneVal.addEventListener('keyup', () => {
    phoneOk = false;
    if (isSpace(phoneVal.value)) {  // 공백 포함 검사
        phoneCheck.innerHTML = `<span class="fail">공백은 혀용하지 않습니다.</span>`;
    } else if (isEmpty(phoneVal.value)) { // 빈 문자열 검사
        phoneCheck.innerHTML = `<span class="fail">연락처를 입력하세요.</span>`;
    } else if(!onlyNumber(phoneVal.value)){
        phoneCheck.innerHTML = `<span class="fail">숫자만 입력하세요.</span>`;
    } else if(!(/^.{10,12}$/.test(phoneVal.value))){
        phoneCheck.innerHTML = `<span class="fail">10자리 ~ 12자리로 입력하세요.</span>`;
    } else {
        phoneCheck.innerHTML = "";
        phoneOk = true;
    }
})

// 주소 유효성 검사
addressVal.addEventListener('keyup', () => {
    if (isSpace(addressVal.value)) {  // 공백 포함 검사
        addressCheck.innerHTML = `<span class="fail">공백은 혀용하지 않습니다.</span>`;
    } else if (isEmpty(addressVal.value)) { // 빈 문자열 검사
        addressCheck.innerHTML = `<span class="fail">주소를 입력하세요.</span>`;
    }  else {
        addressCheck.innerHTML = "";
    }
})


// email 이벤트
let selectEmail = document.getElementById('emailSelect'); // 셀렉트 선택 주소
let firstEmail = document.getElementById('firstEmail'); // 이메일 앞부분
let lastEmail = document.getElementById('lastEmail'); // 이메일 뒷부분

// select 태그 선택시 이메일 뒷부분에 value값 입력 이벤트
selectEmail.addEventListener('change', ()=>{
    lastEmail.value = selectEmail.value; // 셀렉트 태그 선택값 주입
    inputEmailValue();
})

// 앞 부분, 뒷 부분 이메일 주소 입력시 이벤트
firstEmail.addEventListener('input', inputEmailValue);
lastEmail.addEventListener('input', inputEmailValue);

// hidden input 태그에 moon88@google.com 형식으로 value값 저장 함수
function inputEmailValue(){
    emailVal.value = firstEmail.value + "@" + lastEmail.value;
    console.log(email.value);
    validationEmail(emailVal.value);
}

// email 유효성 검사
function validationEmail(email){
    if (isSpace(emailVal.value)) {  // 공백 포함 검사
        emailCheck.innerHTML = `<span class="fail">공백은 혀용하지 않습니다.</span>`;
    } else if (isEmpty(emailVal.value)) { // 빈 문자열 검사
        emailCheck.innerHTML = `<span class="fail">이메일을 입력하세요.</span>`;
    } else if(!emailFormat(emailVal.value)){
        emailCheck.innerHTML = `<span class="fail">잘못된 이메일형식 입니다.</span>`;
    } else {
        emailCheck.innerHTML = "";
        emailOk = true;
    }
}


// <form action="/user/join" method="post" onsubmit="return validation()">
// 서버로 바로 submit 하지 않고 최종 검증 후 통과해야 submit
// onsubmit 최종검증
function validation(){
    if(!idOk){
        alert("아이디를 확인해 주세요.")
        return false;
    } else if(!pwdOk || !pwd2Ok){
        alert("비밀번호를 확인해 주세요.")
        return false;
    } else if(!nameOk){
        alert("이름을 확인해 주세요.")
        return false;
    } else if(!ageOk){
        alert("나이를 확인해 주세요.")
        return false;
    } else if(!phoneOk){
        alert("연락처를 확인해 주세요.")
        return false;
    } else if(!emailOk){
        alert("이메일을 확인해 주세요.")
        return false;
    } else{
        return true;
    }
}