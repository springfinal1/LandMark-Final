let loginBack = document.querySelector('.loginFail-background'), // 전체 백그라운드 배경색 설정용
    loginModal = document.querySelector('.loginFail-modal'), // 모달창 div
    loginConfirm = document.querySelectorAll('#confirm-btn'), // 확인, x 버튼
    modalText = document.querySelector('.modal-text'), // 모달창 안의 text 영역
    searchModal = document.querySelector('.search-modal'), // 아이디, 비밀번호 찾기 모달
    searchIdOrPwd = document.querySelector('.search-id-pwd'); // 아이디, 비밀번호 찾기

// 모달창 오픈 함수
function modalOpen(text){
    modalText.innerText = text;
    loginBack.style.display = 'block';
    setTimeout(function(){
        loginModal.style.display = 'flex';
        loginModal.style.transform = 'translate(-50%, -35%)';
        setTimeout(function(){
            // loginModal.style.top = '35%';
            loginModal.style.transform = 'translate(-50%, -38%)';
            loginModal.style.transition = '0.3s';
            setTimeout(function(){
                // loginModal.style.top = '35%';
                loginModal.style.transform = 'translate(-50%, -35%)';
                loginModal.style.transition = '0.3s';
            },150);
        },100);
    }, 150);
}

// 회원 로그인 실패시 서버에서 전달받은 에러 결과값 loginFail = 2
if(loginFail == 2){
    modalOpen("회원정보가 존재하지 않습니다.");
}

// x버튼, 확인버튼 클릭시 모달창 닫기
loginConfirm.forEach(e =>{
    e.addEventListener('click', ()=>{
        loginModal.style.display = 'none';
        loginBack.style.display = 'none';
        searchModal.style.display = 'none';
    })
})

let idVal = document.getElementById('id');
let pwdVal = document.getElementById('pwd');
function validation(){
    if(idVal.value == '' || idVal.value == null){
        modalOpen('아이디를 입력해 주세요.');
        return false;
    }else if(pwdVal.value == '' || pwdVal.value == null){
        modalOpen('비밀번호를 입력해 주세요.');
        return false;
    }else{
        return true;
    }
}


// 아이디, 비밀번호 찾기
function searchAccountModalOpen(e){
	console.log(e.target);
    if(e.target.classList.contains('search-id')){
    	loginBack.style.display = 'block';
        searchModal.style.display = 'flex';
        searchModal.innerHTML =  `<div><h2>아이디찾기</h2></div>`;
        searchModal.innerHTML += `<div><span>이름</span></div><div><input type="text" id="nameVal" name="name" autocomplete="off"></div>`;
        searchModal.innerHTML += `<div><span>이메일</span></div><div><input type="text" id="emailVal" name="email" autocomplete="off"></div>`;
        searchModal.innerHTML += `<div><button type="button" id="searchIdBtn">확인</button></div>`;
        searchModal.innerHTML += `<span class="material-symbols-outlined close-btn">close</span>`;
    }else if(e.target.classList.contains('search-pwd')){
    	loginBack.style.display = 'block';
        searchModal.style.display = 'flex';
        searchModal.innerHTML =  `<div><h2>비밀번호찾기</h2></div>`;
        searchModal.innerHTML += `<div><span>이름</span></div><div><input type="text" id="nameVal" name="name" autocomplete="off"></div>`;
        searchModal.innerHTML += `<div><span>이메일</span></div><div><input type="text" id="emailVal" name="email" autocomplete="off"></div>`;
        searchModal.innerHTML += `<div><button type="button" id="searchPwdBtn">확인</button></div>`;
        searchModal.innerHTML += `<span class="material-symbols-outlined close-btn">close</span>`;
    }
}
// 아이디, 비밀번호 찾기 모달창 이벤트
searchIdOrPwd.addEventListener('click', searchAccountModalOpen);


// 서버로 아이디, 비밀번호 정보 전달
async function searchAccountToServer(value, data){
    try {
        console.log("value >> "+ value + ", data >> " + JSON.stringify(data));
        const url = '/user/searchAccount/'+value;
        const config = {
            method : 'post',
            headers : {
                'content-type' : 'application/json; charset=utf-8'
            },
            body : JSON.stringify(data)
        };
        const resp = await fetch(url, config);
        const result = await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}

function searchAccountHandler(value){
    let nameVal = document.querySelector('#nameVal');
    let emailVal = document.querySelector('#emailVal');
    let data = {
        name : nameVal.value,
        email : emailVal.value
    }
    searchAccountToServer(value, data).then(result =>{
        if(result == 'sendId'){
            modalOpen('메일에서 아이디를 확인하세요.');
        }else if(result == 'sendPwd'){
            modalOpen('메일로 임시비밀번호가 발급되었습니다.');
        }else if(result == 'notFound'){
            modalOpen('회원정보가 존재하지 않습니다.');
        }
    })
}

document.addEventListener('click', (e)=>{
    if(e.target.id == 'searchIdBtn'){
        searchAccountHandler('searchId');
    }else if(e.target.id == 'searchPwdBtn'){
        searchAccountHandler('searchPwd');
    }
});