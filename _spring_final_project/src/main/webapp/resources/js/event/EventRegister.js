

let tabs = document.querySelectorAll('ul.tabs li');

tabs.forEach(function (tab) { //모든 탭 li에 이벤트 추가
  tab.addEventListener('click', function () {
    let tab_id = tab.getAttribute('data-tab'); //현재 탭 아이디

    tabs.forEach(function (e) {           //모든 li의 클래스에서 current 삭제
      e.classList.remove('current');
    });

    let tabContents = document.querySelectorAll('.tab-content');    //모든 탭div의 클래스에서 current 삭제
    tabContents.forEach(function (content) {
      content.classList.remove('current');
    });

    let subContents = document.querySelectorAll('.tab-content .sub');    //모든 탭div의 서브div 클래스에서 current 삭제
    subContents.forEach(function (content) {
      content.classList.remove('current');
    });



    tab.classList.add('current');     //누른 탭 li에 current 추가
    document.getElementById(tab_id).classList.add('current'); //누른 탭 li의 div에 current 추가

    let a = '#' + tab_id + ' .sub';                       //누른 탭 li의 div의 서브div에 current 추가
    let CurrentsubContents = document.querySelectorAll(a);
    CurrentsubContents.forEach(function (content) {
      content.classList.add('current');
    });


  });
});


let events = document.querySelectorAll('#tab-1 .sub div'); //이벤트 선택 div
let is = document.querySelectorAll('#tab-1 .sub div i');

events.forEach(function (event) {
  event.addEventListener('click', function () {
    let event_id = event.getAttribute('data-event'); //이벤트 data-set 가져오기

    let evSelec = document.getElementById('evSelec'); //select에 값 넣어주기
    evSelec.value = event_id;

    events.forEach(function (event) {
      event.style.borderColor = '#999999';
    })

    is.forEach(function (i) {
      i.style.color = '#999999';
    })

    console.log(evSelec.value);

    if(event_id=='rouletteEv'){

      
      document.querySelector('.roulette-setting-div').style.display='block';
      
      console.log(document.querySelector('.roulette-setting-div'));
      document.querySelector('.attendance-setting-div').style.display='none';
      
    }
    else if(event_id=='AttendanceEv'){
      document.querySelector('.attendance-setting-div').style.display='block';
      document.querySelector('.roulette-setting-div').style.display='none';
      console.log(document.querySelector('.attendance-setting-div'));
    }
    
    let div = document.querySelector('.' + event_id);
    let i = document.querySelector('.' + event_id + ' i');
    console.log(div);
    div.style.borderColor = '#9c27b0';
    i.style.color = '#9c27b0';


  })

})

//eventmodify.jsp에서 사용
function selectEvent(evtype) { //선택한 이벤트타입div에 색깔 입히기
  console.log(evtype);
  let divquery = '.' + evtype;
  let iquery = '.' + evtype + ' i';
  let div = document.querySelector(divquery);
  let i = document.querySelector(iquery);

  div.style.borderColor = '#9c27b0';
  i.style.color = '#9c27b0';
}

let nextbtns = document.querySelectorAll('.nextButton');

nextbtns.forEach(function (nextbtn) {   //모든 next button 에 이벤트 추가
  nextbtn.addEventListener('click', () => {
    let tab2 = document.getElementById('tab-2li');
    let tab3 = document.getElementById('tab-3li');
    if (document.querySelector('#tab-1li').classList.contains('current')) { //tab-1이 현재 li면
      tab2.click();
    }
    else if (document.querySelector('#tab-2li').classList.contains('current')) {
      tab3.click();
    }
  })
})

let prevbtns = document.querySelectorAll('.prevButton');

prevbtns.forEach(function (prevbtn) {   //모든 prev button 에 이벤트 추가
  prevbtn.addEventListener('click', () => {
    let tab1 = document.getElementById('tab-1li');
    let tab2 = document.getElementById('tab-2li');

    if (document.querySelector('#tab-2li').classList.contains('current')) { //tab-1이 현재 li면
      tab1.click();
    }
    else if (document.querySelector('#tab-3li').classList.contains('current')) {
      tab2.click();
    }
  })
  
})


let prizeAdd=document.querySelector('.prize-add');

prizeAdd.addEventListener('click',()=>{
  let prizesUl=document.querySelector('.prizes-ul');
  prizesUl.innerHTML+=`<li><input type="text" name="prizes[]"></li>`;
})