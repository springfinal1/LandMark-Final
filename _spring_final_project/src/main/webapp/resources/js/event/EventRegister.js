

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


    if (event_id == 'rouletteEv') {
      document.querySelector('.roulette-setting-div').style.display = 'block';
      document.querySelector('.attendance-setting-div').style.display = 'none';
      document.querySelector('.prize-add').style.display = 'block'
      document.querySelector('.prize-del').style.display = 'block'
    }
    else if (event_id == 'AttendanceEv') {
      document.querySelector('.attendance-setting-div').style.display = 'block';
      document.querySelector('.roulette-setting-div').style.display = 'none';
      document.querySelector('.prize-add').style.display = 'none'
      document.querySelector('.prize-del').style.display = 'none'
    }

    let div = document.querySelector('.' + event_id);
    let i = document.querySelector('.' + event_id + ' i');
    console.log(div);
    div.style.borderColor = '#9c27b0';
    i.style.color = '#9c27b0';


  })

})


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


let prizeAdd = document.querySelector('.prize-add');

prizeAdd.addEventListener('click', () => {
  // let prizesUl=document.querySelector('.prizes-ul');
  // let eleCount = prizesUl.childElementCount+1;
  // prizesUl.innerHTML+=`<li><span>${eleCount}.</span><input type="text" name="prizes[]"><span>Point</span></li>`;

  let prizesTable = document.querySelector('.prizes-table tbody');
  let childCount = prizesTable.childElementCount + 1;
  prizesTable.innerHTML += `<tr>
  <td>${childCount}</td><td><input type="text" name="prizes[]"><span class="td-span">Point</span></td></tr>`;
})


let prizedel = document.querySelector('.prize-del');

prizedel.addEventListener('click', () => {
  let prizesTable = document.querySelector('.prizes-table tbody');
  let rowCount = prizesTable.rows.length;

  if (rowCount > 1) {
    prizesTable.deleteRow(rowCount - 1);
  } else {
    alert("더 이상 삭제할 행이 없습니다.");
  }

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

function modifyEvent(evtype, evNo) {
  if (evtype == "rouletteEv") {
    document.querySelector('.roulette-setting-div').style.display = 'block';
    let settingTbody = document.querySelector('.prizes-table-tbody');
    $.ajax({
      url: "/event/getPrize",
      data: { evNo: evNo },
      type: "POST",  // post 또는 get
      success: function (result) {
        const prizearr = result.split(",");
        settingTbody.innerHTML='';
        for (let i = 0; i < prizearr.length; i++) {
          let str=`<tr> <td>${i+1}</td>`;
          str+=`<td><input type="text" name="prizes[]" value="${prizearr[i]}"><span class="td-span">Point</span></td></tr>`;
          settingTbody.innerHTML+=str;
        }
      }
    });
  }
  else if (evtype == "AttendanceEv") {
    document.querySelector('.attendance-setting-div').style.display = 'block';
    $.ajax({
      url: "/event/getAttendance",
      data: { evNo: evNo },
      dataType : "json",  //응답 데이터 타입
      type: "Get",  // post 또는 get
      success: function (result) {
        document.getElementById("atvo.maxAttendanceCount").value=result.maxAttendanceCount;
        document.getElementById("atvo.point").value=result.point;
        document.getElementById("atvo.specialPointCount").value=result.specialPointCount;
        document.getElementById("atvo.specialPoint").value=result.specialPoint;
        document.getElementById("atvo.fullAttendancePrize").value=result.fullAttendancePrize;
      }
    });

  }
}