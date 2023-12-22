/**
 * 
 */





let back = document.querySelector('.modal-background'), // 전체 백그라운드 배경색 설정용
    modal = document.querySelector('.modal-container'), // 모달창 div
    confirm = document.querySelectorAll('#confirm-btn'), // 확인, x 버튼

    manager = document.getElementById('managerInfoA');

    manager.addEventListener('click',()=>{
        modalOpen1();
    });

// 모달창 오픈 함수
function modalOpen1(){
    back.style.display = 'block';
    setTimeout(function(){
        modal.style.display = 'flex';
        modal.style.transform = 'translate(-50%, -35%)';
        setTimeout(function(){
            // joinModal.style.top = '35%';
            modal.style.transform = 'translate(-50%, -38%)';
            modal.style.transition = '0.3s';
            setTimeout(function(){
                // joinModal.style.top = '35%';
                modal.style.transform = 'translate(-50%, -35%)';
                modal.style.transition = '0.3s';
            },150);
        },100);
    }, 150);
}

// x버튼, 확인버튼 클릭시 모달창 닫기

confirm.forEach(e => {
    e.addEventListener('click',()=>{
        modal.style.display = 'none';
        back.style.display = 'none';
    })
});

let remove = document.querySelector('.product-remove');

remove.addEventListener('click',()=>{
    modalOpen();
});


let joinBack = document.querySelector('.join-background'), // 전체 백그라운드 배경색 설정용
    joinModal = document.querySelector('.join-modal'), // 모달창 div
    loginConfirm = document.querySelectorAll('#confirm-btn'), // 확인, x 버튼
    modalText = document.querySelector('.modal-text'); // 모달창 안의 text 영역

// 모달창 오픈 함수
function modalOpen(){
    joinBack.style.display = 'block';
    setTimeout(function(){
        joinModal.style.display = 'flex';
        joinModal.style.transform = 'translate(-50%, -35%)';
        setTimeout(function(){
            // joinModal.style.top = '35%';
            joinModal.style.transform = 'translate(-50%, -38%)';
            joinModal.style.transition = '0.3s';
            setTimeout(function(){
                // joinModal.style.top = '35%';
                joinModal.style.transform = 'translate(-50%, -35%)';
                joinModal.style.transition = '0.3s';
            },150);
        },100);
    }, 150);
}

// x버튼, 확인버튼 클릭시 모달창 닫기
loginConfirm.forEach(e =>{
    e.addEventListener('click', ()=>{
        joinModal.style.display = 'none';
        joinBack.style.display = 'none';
    })
})