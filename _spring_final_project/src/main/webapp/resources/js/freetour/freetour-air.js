

function randomImage(){
    let backImage = document.querySelector(".air-reservation-div");
    let placeInfo = document.querySelector(".trip-place-information");
    let cityInfo = document.querySelector('.placeInfo');
    let randomNumber = Math.floor(Math.random()*25)+1;
    if(randomNumber==1){
        backImage.style.backgroundImage = "url(/resources/image/place-image/네팔-히말라야.jpg)";
        placeInfo.innerHTML= `Nepal<div class="placeInfo">네팔</div>`;
    }else if(randomNumber==2){
        backImage.style.backgroundImage = "url(/resources/image/place-image/대만-타이베이.jpg)";
        placeInfo.innerHTML= `Taiwan<div class="placeInfo">타이베이</div>`;
    }else if(randomNumber==3){
        backImage.style.backgroundImage = "url(/resources/image/place-image/러시아-모스크바.jpg)";
        placeInfo.innerHTML= `Russia<div class="placeInfo">모스크바</div>`;
    }else if(randomNumber==4){
        backImage.style.backgroundImage = "url(/resources/image/place-image/멕시코-칸쿤.jpg)";
        placeInfo.innerHTML= `Mexico<div class="placeInfo">칸쿤</div>`;
    }else if(randomNumber==5){
        backImage.style.backgroundImage = "url(/resources/image/place-image/브라질-리우데자네이루.jpg)";
        placeInfo.innerHTML= `Brazil<div class="placeInfo">리우데자네이루</div>`;
    }else if(randomNumber==6){
        backImage.style.backgroundImage = "url(/resources/image/place-image/스웨덴-스톡홀름.jpg)";
        placeInfo.innerHTML= `Sweden<div class="placeInfo">스톡홀름</div>`;
    }else if(randomNumber==7){
        backImage.style.backgroundImage = "url(/resources/image/place-image/스위스-마터호른.jpg)";
        placeInfo.innerHTML= `Switzerland<div class="placeInfo">마터호른</div>`;
    }else if(randomNumber==8){
        backImage.style.backgroundImage = "url(/resources/image/place-image/스페인-바르셀로나.jpg)";
        placeInfo.innerHTML= `Spain<div class="placeInfo">바르셀로나</div>`;
    }else if(randomNumber==9){
        backImage.style.backgroundImage = "url(/resources/image/place-image/싱가포르-마리나베이.jpg)";
        placeInfo.innerHTML= `Singapore<div class="placeInfo">마리나베이</div>`;
    }else if(randomNumber==10){
        backImage.style.backgroundImage = "url(/resources/image/place-image/아랍에미리트-두바이.jpg)";
        placeInfo.innerHTML= `United Arab Emirates<div class="placeInfo">두바이</div>`;
    }else if(randomNumber==11){
        backImage.style.backgroundImage = "url(/resources/image/place-image/아르헨티나-부에노스아이레스.jpg)";
        placeInfo.innerHTML= `Argentina<div class="placeInfo">부에노스아이레스</div>`;
    }else if(randomNumber==12){
        backImage.style.backgroundImage = "url(/resources/image/place-image/영국-런던.jpg)";
        placeInfo.innerHTML= `Great Britain<div class="placeInfo">런던</div>`;
    }else if(randomNumber==13){
        backImage.style.backgroundImage = "url(/resources/image/place-image/오스트리아-비엔나.jpg)";
        placeInfo.innerHTML= `Austria<div class="placeInfo">비엔나</div>`;
    }else if(randomNumber==14){
        backImage.style.backgroundImage = "url(/resources/image/place-image/인도-타지마할.jpg)";
        placeInfo.innerHTML= `India<div class="placeInfo">타지마할</div>`;
    }else if(randomNumber==15){
        backImage.style.backgroundImage = "url(/resources/image/place-image/잠비아-빅토리아폭포.jpg)";
        placeInfo.innerHTML= `Zambia<div class="placeInfo">빅토리아폭포</div>`;
    }else if(randomNumber==16){
        backImage.style.backgroundImage = "url(/resources/image/place-image/중국-베이징.jpg)";
        placeInfo.innerHTML= `China<div class="placeInfo">베이징</div>`;
    }else if(randomNumber==17){
        backImage.style.backgroundImage = "url(/resources/image/place-image/캐나다-나이아가라.jpg)";
        placeInfo.innerHTML= `Canada<div class="placeInfo">나이아가라</div>`;
    }else if(randomNumber==18){
        backImage.style.backgroundImage = "url(/resources/image/place-image/쿠바-카리브해.jpg)";
        placeInfo.innerHTML= `Cuba<div class="placeInfo">카리브해</div>`;
    }else if(randomNumber==19){
        backImage.style.backgroundImage = "url(/resources/image/place-image/태국-푸켓.jpg)";
        placeInfo.innerHTML= `Thailand<div class="placeInfo">푸켓</div>`;
    }else if(randomNumber==20){
        backImage.style.backgroundImage = "url(/resources/image/place-image/터키-이스탄불.jpg)";
        placeInfo.innerHTML= `Turkey<div class="placeInfo">이스탄불</div>`;
    }else if(randomNumber==21){
        backImage.style.backgroundImage = "url(/resources/image/place-image/프랑스-베르사유궁전.jpg)";
        placeInfo.innerHTML= `France<div class="placeInfo">베르사유궁전</div>`;
    }else if(randomNumber==22){
        backImage.style.backgroundImage = "url(/resources/image/place-image/필리핀-세부.jpg)";
        placeInfo.innerHTML= `Philippines<div class="placeInfo">세부</div>`;
    }else if(randomNumber==23){
        backImage.style.backgroundImage = "url(/resources/image/place-image/하와이-와이키키.jpg)";
        placeInfo.innerHTML= `Hawaii<div class="placeInfo">와이키키</div>`;
    }else if(randomNumber==24){
        backImage.style.backgroundImage = "url(/resources/image/place-image/헝가리-부다페스트.jpg)";
        placeInfo.innerHTML= `Hungary<div class="placeInfo">부다페스트</div>`;
    }else if(randomNumber==25){
        backImage.style.backgroundImage = "url(/resources/image/place-image/호주-시드니.jpg)";
        placeInfo.innerHTML= `Australia<div class="placeInfo">시드니</div>`;
    }
}


let tripInfo = document.querySelectorAll(".trip-operation"); // 왕복
let roundTrip = document.getElementById('roundTrip'); // 편도
let oneWay = document.getElementById('oneWay');
let hiddenVerification = document.querySelector('.hiddenVerification');

let freeChecked = document.querySelector('.freeChecked');
let calInputBtn = document.querySelector('.cal-input');



roundTrip.addEventListener('click',()=>{
    roundTrip.classList.add('freeChecked');
    
    if(oneWay.classList.contains('freeChecked')){
        oneWay.classList.remove('freeChecked');
    }
    hiddenVerification.value = roundTrip.innerHTML;
    calInputBtn.value = "날짜를 입력해주세요";
    console.log(hiddenVerification.value);
})

oneWay.addEventListener('click',()=>{
    oneWay.classList.add('freeChecked');

    if(roundTrip.classList.contains("freeChecked")){
        roundTrip.classList.remove("freeChecked");
    }
    hiddenVerification.value = oneWay.innerHTML;
    calInputBtn.value = "날짜를 입력해주세요";
    console.log(hiddenVerification.value);
})


let pepleCnt = document.querySelector('.peple-count'); // 인원수
let pepleModal = document.querySelector('.peple-modal-container'); // 모달 컨테이너
let xbtn = document.querySelector('.material-symbols-outlined'); //x버튼

pepleCnt.addEventListener('click',()=>{
    pepleModal.style.display = 'block';
})

xbtn.addEventListener('click',()=>{
    pepleModal.style.display = 'none';
})

//let transformation = document.querySelector('.transformation'); // 누르면 출발 도착 바뀌게
let departure = document.querySelector('.departure'); // 출발지
let arrival = document.querySelector('.arrival'); // 도착지

let tripModal = document.querySelector('.trip-place-container');
let city = document.querySelectorAll('.city');




let placeClose = document.querySelector('.place-close');

placeClose.addEventListener('click',()=>{
    tripModal.style.display = 'none';
})

departure.addEventListener('click',()=>{
    tripModal.style.display = 'block';

    city.forEach(e=>{
        e.addEventListener('click',()=>{
            departure.innerHTML = e.classList
        })
    }) 
})

arrival.addEventListener('click',()=>{
    tripModal.style.display = 'block';
})

// 달력
let calBtn = document.querySelector('.cal-Btn');
let calcontainer = document.querySelector('.cal-container');

calBtn.addEventListener('click', () => {
    calcontainer.style.display = "block";
    calcontainer.style.position = "fixed";
    calcontainer.style.zIndex = "1000";
});

let calCloseBtn = document.getElementById('calCloseBtn');
let calInit = document.querySelector('.cal-init');

calCloseBtn.addEventListener('click',()=>{ //x버튼 누르면 달력 닫기

    calcontainer.style.display = "none";
})


calInit.addEventListener('click',()=>{ // 적용버튼 누르면 달력닫기
    calcontainer.style.display = "none";
})


let searchPlaceInput = document.querySelector('.search-place-input'); // 검색 input
let searchPlaceButton = document.querySelector('.search-place-button'); // 검색 button

 


async function searchPlaceFromToServer(place){
    try {
        const resp = await fetch("/freetour/search/"+place);
        const result = await resp.json();
        return result;
    } catch (error) {
        console.log(error);
    }
}

let resultSearch = document.querySelector('.result-search'); // 검색내용화면
let tripPlaceCity = document.querySelector('.trip-place-city'); // 검색 li
let tripXBtn = document.querySelector('.trip-place-input');  // x버튼 누를 input


searchPlaceButton.addEventListener('click',()=>{
    let searchResult = searchPlaceInput.value;
    
    searchPlaceFromToServer(searchResult).then(result=>{
        tripPlaceCity.style.display = "none";
        resultSearch.style.display = "block";

        let str = `<ul>`;
        for(let i=0; i<result.length; i++){
            str += `<li><a href="#" class="searchPlaceInfo"> <p class="search-city-kor">${result[i].cityKor}</p> <p class="search-city-info">#${result[i].cityJpn},#${result[i].cityEng},#${result[i].cityCode}</p> </a></li>`;
        }
        str += `</ul>`;
        resultSearch.innerHTML += str;       
        let searchPlaceInfo = document.querySelector('.searchPlaceInfo');
        let searchCityKor = document.querySelector('.search-city-kor');
        searchPlaceInfo.addEventListener('click',()=>{
            arrival.value = searchCityKor.innerHTML;
            tripModal.style.display = "none";
        })
        
    })
});
let tripCloseBtn = document.getElementById('tripCloseBtn');

tripCloseBtn.addEventListener('click',()=>{
    tripPlaceCity.style.display = "flex";
    resultSearch.style.display = "none";
    resultSearch.innerHTML = "";

})

city.forEach(e=>{
    e.addEventListener('click',()=>{
        console.log(e.innerText);
        console.log(e.innerHTML);
        arrival.value = e.innerHTML;
        tripModal.style.display = "none";
    })
})
// let transformation = document.getElementById('transformation');
// let temporaryValue; // 임시값

// transformation.addEventListener('click',()=>{
//     temporaryValue = arrival.value;
//     arrival.value = departure.value;
//     departure.value = temporaryValue;

// })

let adultRemove = document.querySelector(".adult-minus-btn"); // 성인 제거
let adultCount = document.getElementById("adult-count"); // 성인 인원
let adultAdd = document.querySelector(".adult-plus-btn"); // 성인추가

let childRemove = document.querySelector(".child-minus-btn"); // 소아 제거
let childCount = document.getElementById("child-count"); // 소아 인원
let childAdd = document.querySelector(".child-plus-btn"); // 소아 추가

let infantRemove = document.querySelector('.infant-minus-btn'); // 유아 제거
let infantCount = document.getElementById("infant-count"); // 유아 인원
let infantAdd = document.querySelector('.infant-plus-btn'); // 유아 추가


let pepleAllCount = document.querySelector('.pepleAllCount'); // 전체 인원 최대 9 명

adultRemove.addEventListener('click',()=>{
    if(adultCount.value > 0){
        adultCount.value = parseInt(adultCount.value) - 1 ;
        if(pepleAllCount.value > 0){
            pepleAllCount.value = parseInt(pepleAllCount.value) - 1;
        }
    }
})
adultAdd.addEventListener('click',()=>{
    if(pepleAllCount.value < 9){
        adultCount.value = parseInt(adultCount.value) + 1;
        pepleAllCount.value = parseInt(pepleAllCount.value) + 1;
    }
})
childRemove.addEventListener('click',()=>{
    if(childCount.value > 0){
        childCount.value = parseInt(childCount.value) -1 ;
        if(pepleAllCount.value > 0){
            pepleAllCount.value = parseInt(pepleAllCount.value) - 1;
        }
    }
})
childAdd.addEventListener('click',()=>{
    if(pepleAllCount.value < 9){
        childCount.value = parseInt(childCount.value) + 1;
        pepleAllCount.value = parseInt(pepleAllCount.value) + 1;
    }
})
infantRemove.addEventListener('click',()=>{
    if(infantCount.value > 0){
        infantCount.value = parseInt(infantCount.value) -1;
        if(pepleAllCount.value > 0){
            pepleAllCount.value = parseInt(pepleAllCount.value) - 1;
        }
    }
})
infantAdd.addEventListener('click',()=>{
    if(pepleAllCount.value < 9){
        infantCount.value = parseInt(infantCount.value) +1;
        pepleAllCount.value = parseInt(pepleAllCount.value) + 1;
    }
})

let seatChoice = document.querySelector(".seat-choice"); 
let seat;
let seatClass = "";
seatChoice.addEventListener('click',(e)=>{
    
    if(seat){
        seat.classList.remove('choice-li');
    }
    if(e.target.tagName == 'LI'){
        e.target.classList.add('choice-li');
        seatClass = document.querySelector('.choice-li').innerHTML;
        seat = e.target;
    }
    
})

let pepleFooterButton = document.querySelector('.peple-footer-button'); // 선택버튼

let choiceLi = document.querySelector('.choice-li');// 좌석선택한거

let hiddenPeple = document.getElementById('hiddenPeple');
let hiddenSeat = document.getElementById('hiddenSeat');

pepleFooterButton.addEventListener('click',()=>{
    pepleModal.style.display = "none";
    // 성인 소아 유아 있는경우 / 성인,소아 / 성인 유아 / 소아, 유아만 있으면 x
    if(adultCount.value > 0 && childCount.value > 0 && infantCount.value > 0){   
        pepleCnt.value = `성인${adultCount.value},소아${childCount.value},유아${infantCount.value}, ${seatClass}`;
        hiddenPeple.value = parseInt(adultCount.value)+ parseInt(childCount.value)+ parseInt(infantCount.value);
        hiddenSeat.value = seatClass;
    }else if(adultCount.value > 0 && childCount.value > 0 && infantCount.value == 0){
        pepleCnt.value = `성인${adultCount.value},소아${childCount.value}, ${seatClass}`;
        hiddenPeple.value = parseInt(adultCount.value) + parseInt(childCount.value);
        hiddenSeat.value = seatClass;
    }else if(adultCount.value > 0 && childCount.value == 0 && infantCount.value > 0){   
        pepleCnt.value = `성인${adultCount.value},유아${infantCount.value}, ${seatClass}`;
        hiddenPeple.value = parseInt(adultCount.value) + parseInt(infantCount.value);
        hiddenSeat.value = seatClass;
    }else if(adultCount.value == 0 && childCount.value > 0 && infantCount.value > 0){
        alert("성인이 포함되어야 합니다");
    }
})

let searchBtn = document.querySelector('.search-btn');
searchBtn.addEventListener('click',()=>{
    document.querySelector('.sub-but').click();
})