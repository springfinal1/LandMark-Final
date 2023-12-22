
let playbtn = document.querySelector('.play-event');

playbtn.addEventListener('click', () => {   //이벤트 참여하기 이벤트
  const endDatetime = new Date(endDate);    //이벤트 종료일
  const now = new Date();                   //현재 날짜,시각

  if(endDatetime>now){ 
    if(uid.length > 0){
      document.querySelector('.play-div').style.display = 'block';
    }
    else{
      alert('로그인이 필요한 서비스입니다.');
    }
  }
  else{
    alert('이미 끝난 이벤트입니다.');
  }
})


let closebtn= document.querySelector('.close-playdiv-btn');    //이벤트 창 닫기 이벤트

 closebtn.addEventListener('click', () => {
   document.querySelector('.play-div').style.display = 'none';
 })