window.onload = function () { buildCalendar(); }    // 웹 페이지가 로드되면 buildCalendar 실행

        let nowMonth = new Date();  // 현재 달을 페이지를 로드한 날의 달로 초기화
        let today = new Date();     // 페이지를 로드한 날짜를 저장
        today.setHours(0, 0, 0, 0);    // 비교 편의를 위해 today의 시간을 초기화
        let today2 = new Date();     // 페이지를 로드한 날짜를 저장
        today2.setHours(0, 0, 0, 0);    // 비교 편의를 위해 today의 시간을 초기화
        // 달력 생성 : 해당 달에 맞춰 테이블을 만들고, 날짜를 채워 넣는다.
        function buildCalendar() {

            let firstDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth(), 1);     // 이번달 1일
            let lastDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, 0);  // 이번달 마지막날

            let firstDate2 = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, 1);     // 다음달 1일
            let lastDate2 = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 2, 0);  // 다음달 마지막날

            let tbody_Calendar = document.querySelector(".Calendar > tbody"); // 이번달 달력
            //tbody_Calendar.dataset.dataThisCal = new Date(nowMonth.getFullYear(),nowMonth.getMonth()); // 이번달 달력 data-set
            tbody_Calendar.dataset.dataThisYear = firstDate.getFullYear();
            tbody_Calendar.dataset.dataThisMonth = firstDate.getMonth()+1;
            let tbody_Calendar2 = document.querySelector(".Calendar2 > tbody"); // 다음달 달력         
            //tbody_Calendar2.dataset.dataNextCal = new Date(nowMonth.getFullYear(),nowMonth.getMonth()+1); // 다음달 달력 data-set
            tbody_Calendar2.dataset.dataNextYear =  firstDate2.getFullYear();
            tbody_Calendar2.dataset.dataNextMonth = firstDate2.getMonth()+1;

            document.getElementById("calYear").innerText = nowMonth.getFullYear();             // 이번달 연도 숫자 갱신
            document.getElementById("calMonth").innerText = leftPad(nowMonth.getMonth() + 1);  // 이번달 월 숫자 갱신

            document.getElementById("calYear2").innerText = firstDate2.getFullYear();             // 다음달 연도 숫자 갱신
            document.getElementById("calMonth2").innerText = leftPad(firstDate2.getMonth()+1);  // 다음달 월 숫자 갱신

            document.getElementById("calYear").innerText = nowMonth.getFullYear();             // 다음달 연도 데이터셋
            document.getElementById("calMonth").innerText = leftPad(nowMonth.getMonth() + 1);  // 다음달 월 데이터셋


            while (tbody_Calendar.rows.length > 0) {                        // 이전 출력결과가 남아있는 경우 초기화
                tbody_Calendar.deleteRow(tbody_Calendar.rows.length - 1);
            }
            while (tbody_Calendar2.rows.length > 0) {                        
                tbody_Calendar2.deleteRow(tbody_Calendar2.rows.length - 1);
            }

            let nowRow = tbody_Calendar.insertRow();        // 첫번째 행 추가
            let nowRow2 = tbody_Calendar2.insertRow();        // 첫번째 행 추가

            for (let j = 0; j < firstDate.getDay(); j++) {  // 이번달 1일의 요일만큼
                let nowColumn = nowRow.insertCell();        // 열 추가
            }
            for (let j = 0; j < firstDate2.getDay(); j++) {  // 이번달 1일의 요일만큼
                let nowColumn2 = nowRow2.insertCell();        // 열 추가
            }

            for (let nowDay = firstDate; nowDay <= lastDate; nowDay.setDate(nowDay.getDate() + 1)) {   // day는 날짜를 저장하는 변수, 이번달 마지막날까지 증가시키며 반복  

                let nowColumn = nowRow.insertCell();        // 새 열을 추가하고
                let newDIV = document.createElement("p");
                newDIV.innerHTML = leftPad(nowDay.getDate());        // 추가한 열에 날짜 입력              
                nowColumn.appendChild(newDIV);


                if (nowDay.getDay() == 6) {                 // 토요일인 경우
                    newDIV.classList.add('saturday');
                    nowRow = tbody_Calendar.insertRow();    // 새로운 행 추가
                }

                if (nowDay < today) {                       // 지난날인 경우
                    newDIV.className = "pastDay";
                }
                else if (nowDay.getFullYear() == today.getFullYear() && nowDay.getMonth() == today.getMonth() && nowDay.getDate() == today.getDate()) { // 오늘인 경우           
                    newDIV.className = "today";
                    newDIV.onclick = function () { choiceDate(this); }
                    
                }
                else {                                      // 미래인 경우
                    newDIV.className = "futureDay";
                    newDIV.onclick = function () { choiceDate(this); }
                }
            }

            for (let nowDay2 = firstDate2; nowDay2 <= lastDate2; nowDay2.setDate(nowDay2.getDate() + 1)) { 

                let nowColumn2 = nowRow2.insertCell();        // 새 열을 추가하고
                let newDIV2 = document.createElement("p");
                newDIV2.innerHTML = leftPad(nowDay2.getDate());        // 추가한 열에 날짜 입력
                nowColumn2.appendChild(newDIV2);

                if (nowDay2.getDay() == 6) {                 // 토요일인 경우
                    nowRow2 = tbody_Calendar2.insertRow();    // 새로운 행 추가
                }

                if (nowDay2 < today2) {                       // 지난날인 경우
                    newDIV2.className = "pastDay";
                }
                else if (nowDay2.getFullYear() == today2.getFullYear() && nowDay2.getMonth() == today2.getMonth() && nowDay2.getDate() == today2.getDate()) { // 오늘인 경우           
                    newDIV2.className = "today";
                    newDIV2.onclick = function () { choiceDate(this); }
                }
                else {                                      // 미래인 경우
                    newDIV2.className = "futureDay";
                    newDIV2.onclick = function () { choiceDate(this); }
                    
                }
            }
        }

        // 출발 날짜 선택
        function choiceDate(newDIV) {
            let free = document.querySelector('.freeChecked').innerHTML;
            if(free == "왕복"){
                if (document.getElementsByClassName("choiceDay")[1]) {                              // 기존에 선택한 날짜가 있으면
                    document.getElementsByClassName("choiceDay")[1].classList.remove("choiceDay");  // 해당 날짜의 "choiceDay" class 제거
                }
            }else if(free == "편도"){
                if (document.getElementsByClassName("choiceDay")[0]) {                              // 기존에 선택한 날짜가 있으면
                    document.getElementsByClassName("choiceDay")[0].classList.remove("choiceDay");  // 해당 날짜의 "choiceDay" class 제거
                }
            }
            
            newDIV.classList.add("choiceDay");           // 선택된 날짜에 "choiceDay" class 추가
        }

        // 이전달 버튼 클릭
        function prevCalendar() {
            nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() - 1, nowMonth.getDate());   // 현재 달을 1 감소
            buildCalendar();    // 달력 다시 생성
        }
        // 다음달 버튼 클릭
        function nextCalendar() {
            nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, nowMonth.getDate());   // 현재 달을 1 증가
            buildCalendar();    // 달력 다시 생성
        }

        // input값이 한자리 숫자인 경우 앞에 '0' 붙혀주는 함수
        function leftPad(value) {
            if (value < 10) {
                value = value;
                return value;
            }
            return value;
        }

        
        
        calInit.addEventListener('click',()=>{
            let freeCheck = document.querySelector('.freeChecked');

            console.log(freeCheck.innerHTML+"< 달력닫을때 편도/왕복인지 체크");

            if(freeCheck.innerHTML == "왕복"){

                let cal_date_year = document.querySelector(".Calendar > tbody").dataset.dataThisYear;
                let cal_date_month = document.querySelector(".Calendar > tbody").dataset.dataThisMonth;
    
                let cal_date2_year = document.querySelector(".Calendar2 > tbody").dataset.dataNextYear;
                let cal_date2_month = document.querySelector(".Calendar2 > tbody").dataset.dataNextMonth;
                
    
                let choiceDayCount = document.querySelectorAll('.choiceDay');
    
                let startChoiceDay = (choiceDayCount[0].innerHTML); // 출발일
                let endChoiceday = (choiceDayCount[1].innerHTML); // 도착일
                
    
                //  table > tbody > tr > td > p 
                // 달력 확인
                let parentNodeTbody = choiceDayCount[0].parentNode.parentNode.parentNode.parentNode; 
                let parentNodeTbody2 = choiceDayCount[1].parentNode.parentNode.parentNode.parentNode;
                
                let calInput = document.querySelector('.cal-input');
    
                if(parentNodeTbody.classList == "Calendar"){ // 출발지가 1번달력이라면 1번달력에있는 data-set 사용
                    console.log("출발일 첫번째달력");
                    calInput.value = cal_date_year +"-"+cal_date_month+"-"+ startChoiceDay;
                }else{
                    console.log("출발일 두번째달력");
                    calInput.value = cal_date2_year +"-"+cal_date2_month+"-"+ startChoiceDay;
                }
                
                if(parentNodeTbody2.classList == "Calendar"){
                    console.log("도착일 첫번째달력");
                    calInput.value += "~"+cal_date_year +"-"+cal_date_month+"-"+ endChoiceday;
                }else{
                    console.log("도착일 두번째달력");
                    calInput.value += "~"+cal_date2_year +"-"+cal_date2_month+"-"+ endChoiceday;
                }

            }else if(freeCheck.innerHTML == "편도"){

                let cal_date_year = document.querySelector(".Calendar > tbody").dataset.dataThisYear;
                let cal_date_month = document.querySelector(".Calendar > tbody").dataset.dataThisMonth;
    
                let cal_date2_year = document.querySelector(".Calendar2 > tbody").dataset.dataNextYear;
                let cal_date2_month = document.querySelector(".Calendar2 > tbody").dataset.dataNextMonth;
                
    
                let choiceDayCount = document.querySelectorAll('.choiceDay');
    
                let startChoiceDay = (choiceDayCount[0].innerHTML); // 출발일
               // let endChoiceday = (choiceDayCount[1].innerHTML); // 도착일
                
    
                //  table > tbody > tr > td > p 
                // 달력 확인

                let parentNodeTbody = choiceDayCount[0].parentNode.parentNode.parentNode.parentNode;
                
                let calInput = document.querySelector('.cal-input');
    
                if(parentNodeTbody.classList == "Calendar"){ // 출발지가 1번달력이라면 1번달력에있는 data-set 사용
                    console.log("출발일 첫번째달력");
                    calInput.value = cal_date_year +"-"+cal_date_month+"-"+ startChoiceDay;
                }else{
                    console.log("출발일 두번째달력");
                    calInput.value = cal_date2_year +"-"+cal_date2_month+"-"+ startChoiceDay;
                }
                
               

                
                
            }
            
        })

        
       