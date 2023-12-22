let typeVal = document.querySelector('.type-select'), // 문의유형
    titleVal = document.querySelector('#title'), // 문의제목
    contentVal = document.querySelector('#content'), // 문의내용

    typeCheck = document.querySelector('.type-check'), // 문의유형 미입력시 알림영역
    titleCheck = document.querySelector('.title-check'), // 문의제목 미입력시 알림영역
    contentCheck = document.querySelector('.content-check'), // 문의내용 미입력시 알림영역

    loginBack = document.querySelector('.modal-background'), // 전체 백그라운드 배경색 설정용
    loginModal = document.querySelector('.help-register-modal'), // 모달창 div
    loginConfirm = document.querySelectorAll('#confirm-btn'), // 확인, x 버튼
    modalText = document.querySelector('.modal-text'); // 모달창 안의 text 영역

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
// x버튼, 확인버튼 클릭시 모달창 닫기
loginConfirm.forEach(e =>{
    e.addEventListener('click', ()=>{
        loginModal.style.display = 'none';
        loginBack.style.display = 'none';
    })
})

function validation(){
    if(typeVal.value == ''){
        modalOpen('문의유형을 선택해 주세요');
        return false;
    } else if(titleVal.value == ''){
        modalOpen('제목을 입력해 주세요.');
        return false;
    } else if(contentVal.value == ''){
        modalOpen('내용을 입력해 주세요.');
        return false;
    } else {
        return true;
    }
}

let typeSelect = document.querySelector('.type-select'), // 실제 select tag(숨겨짐)
    selectSpan = document.querySelector('.select-span'), // option선택시 text영역
    select = document.querySelector('.select-dl'), // 커스텀 select dl
    selectOption = document.querySelectorAll('.select-dl dd'), // 커스텀 select dd
    selectBox = document.querySelector('.select-box'), // select  전체 div
    arrow = document.getElementById('arrow'); // 화살표
selectOption.forEach(e =>{
    e.addEventListener('click', (e)=>{
        let val = e.target.dataset.select;
        if(val == '선택'){
            typeSelect.innerHTML = `<option value="">${val}`;
        }else{
            typeSelect.innerHTML = `<option value="${val}">${val}`;
        }
        selectSpan.innerText = val;
        console.log(typeSelect.value);
    })
})

document.addEventListener('click', e=>{
    console.log(e.target);
    if(e.target == selectBox || e.target == selectSpan ||e.target == arrow){
        if(select.classList.contains('visible')){
            select.classList.remove('visible');
	        selectBox.classList.remove('checked-box');
            arrow.style.transform = 'rotate(0deg)';
        }else{
            select.classList.add('visible');
            selectBox.classList.add('checked-box');
            arrow.style.transform = 'rotate(-180deg)';
        }
    } else{
        selectBox.classList.remove('checked-box');
        select.classList.remove('visible');
        arrow.style.transform = 'rotate(0deg)';
    }
})