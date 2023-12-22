
    const userS = userA.match(/id=([a-zA-Z0-9]+),\s*pwd=([^,]+),\s*name=([^,]+),\s*age=(\d+),\s*address=([^,]+),\s*email=([^,]+),\s*phoneNumber=([^,]+),\s*authList=([^,]+)+/);

    const packageA = pldto.match(/pkNo=(\d+), pkName=([^,]+), pkPrice=(\d+), pkContinent=([^,]+), pkContent=([^)]+)/);

    const regex = pppp.match(/point=(\d+), grade=([^}]+)/);

    const point = parseInt(regex[1]);
    const grade = regex[2];




    const pkNo = parseInt(packageA[1]);
    const pkName = packageA[2];
    //가져온 가격

    const pkPrice = parseInt(packageA[3]);
    const pkContinent = packageA[4];
    const pkContent = packageA[5];

        // matches 배열에서 필요한 정보 추출
        const id = userS[1];
        const pwd = userS[2];
        const Username = userS[3];
        const age = parseInt(userS[4]);
        const address = userS[5];
        const email = userS[6];
        const phoneNumber = userS[7];




    //멤버쉽


    let memberDiscountPrice = 0;

    memberDiscountPrice = document.getElementById('memberDiscountPrice').innerText;
    console.log("memberDiscountPrice" +memberDiscountPrice);

    //포인트 ..."endPoint"
    let totalPoint = 0;
    //포인트 담을 그릇
    let PointPrice = 0;


    let PointValue = document.getElementById('PointValue').innerText;
    console.log("PointValue : "+ PointValue);

    //변동 포인트
    const pointSpan = document.getElementById('PointValue');



    //최종금액
    let endPrice = 0;


    endPrice = document.getElementById('endPrice').innerText;

    const priceSpan = document.getElementById('endPrice');

    let endPoint = 0;


    endPoint = document.getElementById('endPoint').innerText;

    const endPointSpan = document.getElementById('endPoint');

    //최종가격
    //totalPrice
    let pkPriceValue;

    //포인트 쓰는 값s
    let enteredPoints = 0;// 초기값을 0으로 할당

    let priceP = totalPrice;



    function applyPoint() {
        // 입력된 포인트 가져오기
        enteredPoints = parseInt(document.getElementById('point-input').value);
    
        // 최종 가격 가져오기 endPrice
        PointPrice = parseInt(totalPrice); 
        
        // 포인트 할인 로직 적용
        if (enteredPoints > 0 && PointValue > 0 && PointValue >= enteredPoints) {

            PointValue = parseInt(PointValue) - parseInt(enteredPoints);
            if(parseInt(PointValue)<0) {
                PointValue = 0;
            }
            // 최종 가격에서 포인트 할인 적용
            discountedPrice = parseInt(PointPrice) - enteredPoints;
            
            //맴버쉽 빼기
            discountedPrice = discountedPrice - memberDiscountPrice;

            totalPoint += enteredPoints;
            totalPrice = pkPrice - enteredPoints;


            // pkPriceValue 초기화pkPriceValue
            totalPrice = PointPrice - enteredPoints;


            pkPriceValue = discountedPrice
            //endpoint
            pointSpan.innerText = PointValue;

            endPointSpan.innerText = totalPoint;
            
            //최종금액
            if(discountedPrice > 0) {
                priceSpan.innerText = discountedPrice;
            }else {
                alert("사용포인트가 최종 금액보다 많이 못씁니다.");
            }
            


            
        } else {
            alert("올바른 포인트를 입력하세요.");
        }
    }




    function requestPay() {
        // IMP.request_pay(param, callback) 결제창 호출
        var uid = '';
        IMP.init("imp76450478");

        if (enteredPoints == 0 || isNaN(enteredPoints)) {
            // 결제 취소 시, 이전 totalPrice로 초기화
            totalPrice = parseInt(priceP);
            totalPrice = totalPrice - parseInt(memberDiscountPrice);


            console.log("1111" + totalPrice);
        } else {
            totalPrice = discountedPrice;
            console.log("2222" + totalPrice);
        }
        
    
        

        console.log("totalPrice----" + totalPrice);

        IMP.request_pay({ // param
            pg: selectedValue,
            pay_method: "089",
            merchant_uid: paymentUuid(), //가맹점 주문번호 (아임포트를 사용하는 가맹점에서 중복되지 않은 임의의 문자열을 입력)
            name: pkName,
            amount: totalPrice,
                buyer_email : email,
                buyer_name : Username,
                buyer_tel : phoneNumber,
                buyer_postcode : '상세주소'
        }, function (rsp) { // callback
            if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
                uid = rsp.imp_uid;
                // 결제검증
                $.ajax({
                    url: '/peyment/peverifyIamport/' + rsp.imp_uid,
                    type: 'post',
                    dataType: 'json',
                    contentType: 'application/json'
                }).done(function(data) {
                    // 결제를 요청했던 금액과 실제 결제된 금액이 같으면 해당 주문건의 결제가 정상적으로 완료된 것으로 간주한다.
                    console.log(data);
                    if (totalPrice == data.response.amount) {
                        // jQuery로 HTTP 요청
                        // 주문정보 생성 및 테이블에 저장 
                        // @@ 주문정보는 상품 개수만큼 생성되어야 해서 상품 개수만큼 반복문을 돌린다
                        // 이때 order code는 모두 같아야 한다.          
                        
                            // 데이터를 json으로 보내기 위해 바꿔준다.
                            data = JSON.stringify({
                                "orderNum" : rsp.merchant_uid,
                                "pkNo" : pkNo, //상품번호
                                "id" : id, // 회원번호
                                "productName" : rsp.name,
                                "orderDate" : new Date().getTime(),
                                "totalPrice" : rsp.paid_amount,
                                "impUid" : rsp.imp_uid,
                                "userCount" : userC,
                                "sayongPointeu" : enteredPoints
                            });
                            console.log(data);
                        
                            $.ajax({
                                url: "/peyment/complete",
                                type: "POST",
                                dataType: 'json',
                                contentType: 'application/json',
                                data : data
                            })
                            .done(function(res) {
                                if (res > 0) {
                                    console.log(res);
                                    alert('주문정보 저장 성공')
                                    createPayInfo(uid);
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

    function createPayInfo(uid) {
        // 결제정보 생성 및 테이블 저장 후 결제완료 페이지로 이동 
        console.log("시작");
        console.log(uid);
        $.ajax({
            type: 'get',
            url: '/peyment/pay_info',
            dataType: 'json',
            contentType: 'application/json',
            data: {
                'imp_uid': uid,
                'pkNo':pkNo,
                'enteredPoints' : enteredPoints
                
            },

            success: function(data) {
                
                var message = '결제 성공!\n결제완료 페이지로 이동합니다.';

            // 사용자에게 간단한 경고창 표시
                alert(message);


            window.location.replace('/peyment/complete?payNum=' + data);
                
            },
            error: function() {
                alert('결제정보 저장 통신 실패');
            }
        });
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






