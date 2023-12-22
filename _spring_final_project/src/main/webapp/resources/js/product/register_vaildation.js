/**
 * 
 */
 // <form action="/user/join" method="post" onsubmit="return validation()">
// 서버로 바로 submit 하지 않고 최종 검증 후 통과해야 submit
// onsubmit 최종검증


// let idCheck = document.querySelector('.id-check'); // 아이디 유효성검사 영역
// let pwdCheck = document.querySelector('.pwd-check'); // 비밀번호 유효성검사 영역
// let pwdCheck2 = document.querySelector('.pwd-check2'); // 비밀번호 일치확인 메시지 영역
// let nameCheck = document.querySelector('.name-check'); // 이름 유효성검사 영역
// let ageCheck = document.querySelector('.age-check'); // 나이 유효성검사 영역
// let phoneCheck = document.querySelector('.phone-check'); // 폰넘버 유효성검사 영역
// let emailCheck = document.querySelector('.email-check'); // 이메일 유효성검사 영역
// let addressCheck = document.querySelector('.address-check'); // 주소 유효성검사 영역

let pkname = document.querySelector(".product-input"); //상품명
let pkcontent = document.querySelector(".product-text"); // 상품내용
let apArrival = document.getElementById("apArrival"); // 출발일
let apDeparture = document.getElementById("apDeparture"); // 도착일
let plCountry = document.getElementById("country");
let plPlace = document.getElementById("place");
let festivalName = document.getElementById("festival");
let festivalPrice = document.getElementById("festival-price");
let plContinent = document.querySelector(".product-continent");
let hotelName = document.getElementById("hotelName");
let hotelPrice = document.getElementById("hotel-price");

let regBtn = document.querySelector(".regBtn");
// // 필수항목 입력확인 변수
// let idOk = false;
// let pwdOk = false;
// let pwd2Ok = false;
// let nameOk = false;
// let ageOk = false;
// let phoneOk = false;
// let emailOk = false;


let pknameOk = false;
let pkcontentOk = false;
let apArrivalOk = false;
let apDepartureOK = false;
let plPlaceOK = false;
let festivalNameOk = false;
let festivalPriceOk = false;
let plContinentOk = false;
let hotelNameOk = false;
let hotelPriceOk = false;

regBtn.addEventListener('click',()=>{
    if(pkname.value != null){

    }
})





function validation(){
    if(!idOk){
        alert("아이디를 확인해 주세요.")
        return false;
    } else if(!pwdOk || !pwd2Ok){
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