

let modifyBtn = document.querySelector('.modify-btn'); // 확인버튼

let pwdCheck = document.querySelector('.pwd-check'), // 비밀번호 유효성검사 영역
    pwdCheck2 = document.querySelector('.pwd-check2'), // 비밀번호 일치확인 메시지 영역
    nameCheck = document.querySelector('.name-check'), // 이름 유효성검사 영역
    ageCheck = document.querySelector('.age-check'), // 나이 유효성검사 영역
    phoneCheck = document.querySelector('.phone-check'), // 폰넘버 유효성검사 영역
    emailCheck = document.querySelector('.email-check'), // 이메일 유효성검사 영역
    addressCheck = document.querySelector('.address-check'); // 주소 유효성검사 영역

let idVal = document.getElementById('id'), // id
    pwdVal = document.getElementById('pwd'), // pwd 입력값
    rePwdVal = document.getElementById('pwd2'), // pwd 확인 입력값
    nameVal = document.getElementById('name'), // name 입력값
    ageVal = document.getElementById('age'), // age 입력값
    phoneVal = document.getElementById('phone'), // phoneNumber 입력값
    emailVal = document.getElementById('email'), // email 입력값(최종 => moon88@google.com)
    addressVal = document.getElementById('address'); // address 입력값

let userDelete = document.getElementById('userDelete');



// 빈 문자열 검사(공통)
function isEmpty(value) {
    return value === "" ? true : false; // 빈문자열 이면 true 아니면 false
}
// 공백 포함 검사(공통)
function isSpace(value) {
    let regExp = /[\s]/; // 공백 체크 정규표현식
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
let pwdOk = true,
    pwd2Ok = true,
    nameOk = true,
    ageOk = true,
    phoneOk = true,
    emailOk = true;


let pwdModifyBtn = document.querySelector('#pwdModifyBtn'), // 비밀번호 변경 시 변경input 활성화버튼
    nameModifyBtn = document.querySelector('#nameModifyBtn'), // 이름 변경 시 변경input 활성화버튼
    ageModifyBtn = document.querySelector('#ageModifyBtn'), // 나이 변경 시 변경input 활성화버튼
    phoneModifyBtn = document.querySelector('#phoneModifyBtn'), // 연락처 변경 시 변경input 활성화버튼
    emailModifyBtn = document.querySelector('#emailModifyBtn'), // 이메일 변경 시 변경input 활성화버튼
    addressModifyBtn = document.querySelector('#addressModifyBtn'), // 주소 변경 시 변경input 활성화버튼
    pwdBox = document.querySelectorAll('.pwd-box'), // pwd input의 div
    nameBox = document.querySelector('.name-box'), // name input의 div
    ageBox = document.querySelector('.age-box'), // age input의 div
    phoneBox = document.querySelector('.phone-box'), // phone input의 div
    emailBox = document.querySelector('.email-box'), // email input의 div
    addressBox = document.querySelector('.address-box'); // address input의 div
// 비밀번호 변경 버튼으로 input 활성화 / 비활성화 이벤트
pwdModifyBtn.addEventListener('click', ()=>{
    pwdBox.forEach(elem => {
        if(elem.id == 'hidden'){
            // 비밀번호변경 활성화되면 검증변수 false 변경
            elem.id = 'block'; 
            pwdModifyBtn.classList.add('checked');
            pwdOk = false;
            pwd2Ok = false;
        } else {
            // 비밀번호변경 버튼을 꺼서 비활성화되면 pwd 값을 null로 바꾸고
            // 검증 변수를 true 바꿔서 submit 허용
            // 서버에서는 null 로 값이 들어오면 비밀번호 변경x
            elem.id = 'hidden';
            pwdVal.value = null; 
            pwdModifyBtn.classList.remove('checked');
            pwdOk = true;
            pwd2Ok = true;
        }
    });
})
// 이름 변경 버튼으로 input 활성화 / 비활성화 이벤트
nameModifyBtn.addEventListener('click', ()=>{
    if(nameBox.id == 'hidden'){
        nameBox.id = 'block';
        nameModifyBtn.classList.add('checked');
        nameOk = false;
    } else {
        nameBox.id = 'hidden';
        nameModifyBtn.classList.remove('checked');
        nameVal = null;
        nameOk = true;
    }
})
// 나이 변경 버튼으로 input 활성화 / 비활성화 이벤트
ageModifyBtn.addEventListener('click', ()=>{
    if(ageBox.id == 'hidden'){
        ageBox.id = 'block';
        ageModifyBtn.classList.add('checked');
        ageOk = false;
    } else {
        ageBox.id = 'hidden';
        ageModifyBtn.classList.remove('checked');
        ageVal = null;
        ageOk = true;
    }
})
// 연락처 변경 버튼으로 input 활성화 / 비활성화 이벤트
phoneModifyBtn.addEventListener('click', ()=>{
    if(phoneBox.id == 'hidden'){
        phoneBox.id = 'block';
        phoneModifyBtn.classList.add('checked');
        phoneOk = false;
    } else {
        phoneBox.id = 'hidden';
        phoneModifyBtn.classList.remove('checked');
        phoneVal = null;
        phoneOk = true;
    }
})
// 이메일 변경 버튼으로 input 활성화 / 비활성화 이벤트
emailModifyBtn.addEventListener('click', ()=>{
    if(emailBox.id == 'hidden'){
        emailBox.id = 'block';
        emailModifyBtn.classList.add('checked');
        emailOk = false;
    } else {
        emailBox.id = 'hidden';
        emailModifyBtn.classList.remove('checked');
        emailVal = null;
        emailOk = true;
    }
})
// 주소 변경 버튼으로 input 활성화 / 비활성화 이벤트
addressModifyBtn.addEventListener('click', ()=>{
    if(addressBox.id == 'hidden'){
        addressBox.id = 'block';
        addressModifyBtn.classList.add('checked');
    } else {
        addressBox.id = 'hidden';
        addressModifyBtn.classList.remove('checked');
        addressVal = null;
    }
})


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
let selectEmail = document.getElementById('emailSelect'), // 셀렉트 선택 주소
    firstEmail = document.getElementById('firstEmail'), // 이메일 앞부분
    lastEmail = document.getElementById('lastEmail'); // 이메일 뒷부분

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
   if(!pwdOk || !pwd2Ok){
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


let userDeletelBack = document.querySelector('.userDelete-background'), // 전체 백그라운드 배경색 설정용
    deleteModal = document.querySelector('.userDelete-modal'), // 모달창 div
    closeModal = document.querySelectorAll('.close-btn'), // 확인, x 버튼
    modalText = document.querySelector('.modal-text'), // 모달창 안의 text 영역
    deleteConfirm = document.getElementById('confirmBtn'), // 확인버튼
    deleteLink = document.getElementById('userDelete'); // 탈퇴 link
    

// 모달창 오픈 함수
function modalOpen(text){
    modalText.innerText = text;
    userDeletelBack.style.display = 'block';
    setTimeout(function(){
        deleteModal.style.display = 'flex';
        deleteModal.style.transform = 'translate(-50%, -35%)';
        setTimeout(function(){
            // loginModal.style.top = '35%';
            deleteModal.style.transform = 'translate(-50%, -38%)';
            deleteModal.style.transition = '0.3s';
            setTimeout(function(){
                // loginModal.style.top = '35%';
                deleteModal.style.transform = 'translate(-50%, -35%)';
                deleteModal.style.transition = '0.3s';
            },150);
        },100);
    }, 150);
}

// 회원탈퇴 링크 클릭시
userDelete.addEventListener('click', ()=>{
    modalOpen("LAND MARK를 탈퇴하시겠습니까?");
})

// 확인 버튼 클릭시
deleteConfirm.addEventListener('click', ()=>{
    console.log("id >> " + idVal)
    deleteLink.href = '/user/delete/'+idVal.value;
    deleteLink.click();
})

// x버튼, 확인버튼 클릭시 모달창 닫기
closeModal.forEach(e =>{
    e.addEventListener('click', ()=>{
        deleteModal.style.display = 'none';
        userDeletelBack.style.display = 'none';
    });
})

