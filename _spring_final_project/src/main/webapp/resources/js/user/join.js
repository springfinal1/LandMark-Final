let joinBack = document.querySelector('.join-background'), // 전체 백그라운드 배경색 설정용
    joinModal = document.querySelector('.join-modal'), // 모달창 div
    loginConfirm = document.querySelectorAll('#confirm-btn'), // 확인, x 버튼
    modalText = document.querySelector('.modal-text'); // 모달창 안의 text 영역


if(msg == "1"){
	let text = `<div>${joinID} 님 환영합니다.</div>
				<div>회원가입포인트(1000POINT)가 지급되었습니다.</div>`;
	modalOpen(text);
}

// 모달창 오픈 함수
function modalOpen(text){
    modalText.innerHTML = text;
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