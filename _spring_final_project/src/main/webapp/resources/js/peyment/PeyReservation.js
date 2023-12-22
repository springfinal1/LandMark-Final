const input = fTOVO;
console.log(fTOVO);
// 정규식 패턴



const inputString =fTOVO;

const pattern = /orderNum=(\d+),\s*id=([\w\d]+),\s*airplane=([^,]+),\s*arrival=([^,]+),\s*cityCode=([^,]+),\s*departureDay=([^,]+),\s*arrivalDay=([^,]+),\s*impUid=([^,]+),\s*seatType=([^,]+),\s*flightType=([^,]+),\s*ftPrice=(\d+),\s*ftPeple=(\d+),\s*gate=(\d+)/;

const matches = inputString.match(pattern);

    let orderNum = parseInt(matches[1]);
    let id = matches[2];
    let airplane = matches[3];
    let arrival = matches[4];
    let cityCode = matches[5]; // 추가된 부분
    let departureDay = matches[6];
    let arrivalDay = matches[7];
    let impUid = matches[8];
    let seatType = matches[9];
    let flightType = matches[10];
    let ftPrice = parseInt(matches[11]);
    let ftPeple = parseInt(matches[12]);
    let gate = parseInt(matches[13]);


    // 추출된 정보 활용
  console.log("orderNum:", orderNum);
    console.log("id:", id);
    console.log("airplane:", airplane);
    console.log("arrival:", arrival);
    console.log("cityCode:", cityCode);
    console.log("departureDay:", departureDay);
    console.log("arrivalDay:", arrivalDay);
    console.log("impUid:", impUid);
    console.log("seatType:", seatType);
    console.log("flightType:", flightType);
    console.log("ftPrice:", ftPrice);
    console.log("ftPeple:", ftPeple);
    console.log("gate:", gate);


function requestPay() {
    // IMP.request_pay(param, callback) 결제창 호출
    var uid = '';
    IMP.init("imp76450478");

  
    IMP.request_pay({ // param
        pg: selectedValue,
        pay_method: "089",
        merchant_uid: paymentUuid(), //가맹점 주문번호 (아임포트를 사용하는 가맹점에서 중복되지 않은 임의의 문자열을 입력)
        name: "이성훈",
        amount: ftPrice,
        buyer_email : "",
        buyer_name : "bb",
        buyer_tel : "cc",
        buyer_postcode : '상세주소',
        ftPeple : ftPeple
    }, function (rsp) { // callback
        if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
            uid = rsp.imp_uid;
            // 결제검증
            $.ajax({
                url: '/freeTourPeyment/peverifyIamport/' + rsp.imp_uid,
                type: 'post',
                dataType: 'json',
                contentType: 'application/json'
            }).done(function(data) {
                // 결제를 요청했던 금액과 실제 결제된 금액이 같으면 해당 주문건의 결제가 정상적으로 완료된 것으로 간주한다.
                console.log(data);
                if (ftPrice == data.response.amount) {
                    // jQuery로 HTTP 요청
                    // 주문정보 생성 및 테이블에 저장 
                    // @@ 주문정보는 상품 개수만큼 생성되어야 해서 상품 개수만큼 반복문을 돌린다
                    // 이때 order code는 모두 같아야 한다.          
                    
                        // 데이터를 json으로 보내기 위해 바꿔준다.
                        data = JSON.stringify({
                            "orderNum" : rsp.merchant_uid,
                            "id" : id,
                            "departureDay" : departureDay,
                            "arrivalDay" : arrivalDay,
                            "seatType" : seatType,
                            "flightType" : flightType,
                            "ftPrice" : ftPrice,
                            "ftPeple" : ftPeple,
                            "impUid" : rsp.imp_uid,
  							  "gate": gate,
    "airplane": airplane,
    "arrival": arrival,
    "cityCode": cityCode
                            
                        });
                        console.log(data);
                    
                        $.ajax({
                            url: "/freeTourPeyment/complete",
                            type: "POST",
                            dataType: 'json',
                            contentType: 'application/json',
                            data : data
                        })
                        .done(function(res) {
                            if (res > 0) {
                                console.log(res);
                                alert('결제완료')
                                createPayInfo();
                            }
                            else {
                                console.log(data);
                                alert('주문정보 저장 실패');
                            }
                        })
                }
                else {
                    alert('결제 실패');
                }
            })
            } else {
                alert("결제에 실패하였습니다.","에러 내용: " +  rsp.error_msg,"error");
            }
        });
}



// uuid만들기
function paymentUuid(){
    const date = new Date();
    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, "0");
    const day = String(date.getDate()).padStart(2, "0");
    
    let orderNum = year + month + day;
    for(let i=0;i<10;i++) {
        orderNum += Math.floor(Math.random() * 8);	
    }
    return orderNum;
}

function createPayInfo() {
    window.location.href = '/';
}



//셀렉트
const label = document.querySelector('.label');
const options = document.querySelectorAll('.optionItem');
const handleSelect = function(item) {
label.innerHTML = item.textContent;
label.parentNode.classList.remove('active');
}
options.forEach(function(option){
option.addEventListener('click', function(){handleSelect(option)})
})

label.addEventListener('click', function(){
if(label.parentNode.classList.contains('active')) {
    label.parentNode.classList.remove('active');
} else {
    label.parentNode.classList.add('active');
}
});


// matches 배열에서 필요한 정보 추출
var selectedValue;
document.addEventListener("DOMContentLoaded", function() {
    var optionList = document.getElementById("paymentMethod");
    
    optionList.addEventListener("click", function(event) {
    selectedValue = event.target.getAttribute("value");
    console.log("Selected Value:", selectedValue);

    });
});






