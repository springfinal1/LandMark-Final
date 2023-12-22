console.log("detail in");

document.addEventListener('click',(e)=>{
    let productDiv =  document.getElementById('product-eventTap');
    
    if(e.target.id == 'evtBtn1'){
    productDiv.innerHTML = "";
    let div = "";
    div += `<div class="product-point">`;
    div += `<strong>상품 핵심포인트</strong>`;
    div += `</div>`;
    div += `<div class="item-div">`;
    div += `<div class="icon-div">`;
    div += `<span class="material-symbols-outlined">more_horiz</span>`;
    div += `<span class="icon-text">기타</span>`;
    div += `</div>`;
    div += `<div class="item-info">`;
    div += `<p>공항픽업서비스 : 전용차량 픽업 서비스</p>`;
    div += `<p>전문가이드투어 : 한국인 전문 가이드투어</p>`;
    div += `<p>참고사항 : 실시간 항공, 호텔 예약상품으로 상품에 포함된 기본 운임 마감시, 상품가 변동될 수 있습니다.</p>`;
    div += `</div>`;
    div += `</div>`;
    div += `<div class="item-div">`;
    div += `<div class="icon-div">`;
    div += `<span class="material-symbols-outlined">verified_user</span>`;
    div += `<span class="icon-text">여행자보험</span>`;
    div += `</div>`;
    div += `<div class="item-info">`;
    div += `<p>해외 여행자보험(최대1억원/DB손해보험)</p>`;
    div += `<a href="#">보장내용 및 금액 상세보기</a>`;
    div += `</div>`;
    div += `</div>`;
    productDiv.innerHTML = div;

    }else if(e.target.id == 'evtBtn2'){

        productDiv.innerHTML = "";

        let div = "";
        div += `<div class="product-point">`;
        div += `<strong>수하물안내</strong>`;
        div += `</div>`;
        div += `<div class="baggage-table">`;
        div += `<table class="baggage-table-in">`;
        div += `<tr>`;
        div += `<th class="baggage-table-th">위탁 수하물 허용량</th>`;
        div += `<td class="baggage-table-td">23kg * 2 (지역별 상이)</td>`;
        div += `</tr>`;
        div += `<tr>`;
        div += `<th class="baggage-table-th">추가 시 요금(무게기준)</th>`;
        div += `<td class="baggage-table-td">1kg 당 11 ~ 70 USD</td>`;
        div += `</tr>`;
        div += `<tr>`;
        div += `<th class="baggage-table-th">기내 반입 허용 사이즈</th>`;
        div += `<td class="baggage-table-td">50 * 37 * 25, 7 kg</td>`;
        div += `</tr></table></div>`;
        div += `<div class="infoText">`;
        div += `<p>
        - 초과요금 : 대부분의 항공사에서 지역별, 미주구간, 미주 외 지역 등으로 나누어 각각 다른 규정을 두고 있어 개별 확인 필수 <br>
        - 위탁 수하물 : 특정 구간, 미주구간, 미주 외 구간 등 으로 나누어 무게별 적용, 갯수별 적용으로 가격이 상이하므로 개별 확인 필수 <br>
        - 단체수속의 경우 수하물 허용량은 상이할 수 있으므로 상품담당자 또는 개별 확인 필수
         </p></div>`;
        div += `<div class="warning-div">`;
        div += `<span class="material-symbols-outlined">warning</span>`;
        div += `<p>여행일정은 계약체결시 예상하지 못한 부득이한 사정 등이 발생하는 경우 <br> 여행사의 사전 동의를 거쳐 변경될 수 있음을 양지하시기바랍니다.</p>
		</div>`;
        productDiv.innerHTML = div;

    }else if(e.target.id == 'evtBtn3'){
        productDiv.innerHTML = "";
        let div = "";
        div += `<div class="product-point">
        <strong>예약 안내사항</strong>
    </div>
    <div class="notification-container">
        <table class="notification-table">
            <tr>
                <th class="notification-th">여행전 <br> 안내사항</th>
                <td class="notification-td">
                    · 본 상품은 일정 변경이 가능하며, 일정추가 및 변경가능하며 별도문의 부탁드립니다. <br>
                    · 본 상품은 실시간 최저 항공료를 바탕으로 안내드리고 있으며, <br>
                    예약접수 후 실시간 요금 반영하여 최종금액 안내드리고 있습니다. <br>
                    · 신청일 기준 항공사 스케줄이 변경될 수 있으며, 이 경우 추천 항공으로 안내드립니다. <br>
                    · 본 상품은 항공 및 현지 사정(박람회,축제,환율변동 등)에 의해 요금이 변동 될 수 있습니다. <br>
                    · 본 상품은 천재지변, 파업등의 현지사정으로 인해 부득이 사전공지 없이 변경 또는 취소될 수 <br>
                    있습니다. 이는 당사의 귀책사유가 아닌 점 참고 부탁드립니다. <br>
                    · 출발 후 현지에서 취소 및 변경은 불가하며 환불 되지 않습니다.
                </td>
            </tr>
            <tr>
                <th class="notification-th">입금계좌안내</th>
                <td class="notification-td">예약 확정 후 고객별 가상계좌 안내드립니다.</td>
            </tr>
            <tr>
                <th class="notification-th">비상연락처</th>
                <td class="notification-td">담당 팀장 : 유호재(010-5662-1747)</td>
            </tr>
            <tr>
                <th class="notification-th">기타사항</th>
                <td class="notification-td">	
                    ■ 예약절차안내 ■ <br>
                    · 예약 진행을 원하실경우 일행모두의 여권상 정확한 영문 스펠링 확인 부탁드립니다. <br>
                    1차 예약금: 1인 30만원 예약당일 17시까지 결제 <br>
                    2차 중도금: 항공 발권시 필요한 최소금액 (예약 후 3일이내 항공 발권시한에 맞춰 진행) <br>
                    3차 잔여금: 출발일 기준 한 달전 결제 (주말/공휴일 제외, 담당자 별도안내) <br>
                    ** 잔금 결제 후 여행자료(바우처/티켓 등)은 이메일로 발송됩니다. <br>
                    ** 현금결제시 현금영수증처리 가능합니다. <br>
                    <br>
                    ■ 특별약관 적용 ■ <br>
                    · 예약 후 취소시 여행사 수수료 1인 20만원 발생됩니다. <br>
                    · 항공권 발권 후 취소 또는 변경시 항공사 자체 규정에 따라 취소/변경 수수료가 발생됩니다. <br>
                    · 해당상품은 예약시 모든 예약이 바로 진행되며, 취소/변경 시점에따라 호텔, 투어, 열차, <br>
                    저가항공 등의 규정에 따라 수수료가 발생될 수 있습니다.
                </td>
            </tr>
        </table>
    </div>`;
        productDiv.innerHTML = div;

    }else if(e.target.id == 'evtBtn4'){
        productDiv.innerHTML = "";
        let div = ""
        div += `<div class="product-point">
                    <strong>약관정보</strong>
                </div>
                <div class="article-container">
                    <table class="article-table">
                        <tr>
                            <th class="article-table-th">특별약관</th>
                            <td class="article-table-td">
                                ■ 여행사 <br>
                                · 예약 후 취소시 여행사 수수료 1인 20만원이 발생됩니다. <br>
                                <br>
                                ■ 항공권<br>
                                · 출발 후 취소는 불가합니다.<br>
                                · 항공권 발권 후 취소시 항공사별 규정에 따라 수수료 발생되며, 담당자에게 별도 확인부탁드립니다.<br>
                                · 항공권 발권 후 예약 변경이나 재발행(영문변경)으로 인하여 발생되는 비용은 항공사 규정에 따릅니다.<br>
                                · 전세기 및 일부 특가 항공권은 예약 확정 또는 항공권 발권 후 취소 시 100% 비용이 부과됩니다.<br>
                                · 항공 사전좌석 배정은 항공편의 취소, 지연, 기종의 변경 등으로 인해 부득이한 사유로 인하여 예고없이 변경 될 수 있습니다.<br>
                                · 항공 사전좌석배정은 출발전 해당항공사 홈페이지에서 직접 지정가능하며,<br>
                                온라인상으로 배정한 좌석도 100% 개런티되지 않으니 보딩 시 공항에서 재확인하시기 바랍니다.<br>
                                <br>
                                ■ 호텔<br>
                                · 각 호텔별 규정 및 객실에따라 수수료 발생시점이 상이합니다. 예약 변경/취소 시점에 맞춰 담당자에게 별도 확인 부탁드립니다.<br>
                                <br>
                                ■ 열차/구간항공/각종 교통권<br>
                                · 대부분의 열차/구간항공/교통권 등은 발권 후 변경/취소가 불가하며 환불이 불가합니다.<br>
                                교통권 발권전 담당자가 고객님께 별도 추가안내 드리고있습니다.<br>
                                <br>
                                ※ 임신으로인한 변경/취소시에도 위 특약은 적용됩니다.<br>
                                <br>
                                <br>
                                ■ 취소위약금 증빙 제공 및 계약해제<br>
                                고객은 계약취소와 관련하여 취소수수료(여행사 인건비 포함) 부과내역에 대한 구체적인 증빙과 설명을 여행사에 요구할 수 있으며,<br>
                                여행사는 관련 설명과 증빙을 제시하고 취소수수료 규정과 차액이 있는 경우 환급합니다.<br>
                                <br>
                                ※ 행사 진행 중 천재지변 및 불가피한 상황 발생으로 소요되는 비용은 고객님께서 부담하셔야 합니다.<br>
                                ※ 취소기준일은 취소를 통지한 날로 여행사와 항공사의 업무특성 상 영업일(월~금-09:00~18:00, 공휴일 제외) 기준입니다.
                                
                            </td>
                        </tr>
                    </table>
                </div>`;

        productDiv.innerHTML = div;
    }else if(e.target.id == 'evtBtn5'){
        productDiv.innerHTML = "";
        let div = "";
        div += `<div class="product-point">
                 <strong>해외안전정보</strong>
                    </div>
                    <div class="safety-container">
                        <div class="safety-link">
                            <div class="safety-img">
                            <span class="material-symbols-outlined" id="airplane-image"> travel</span>
                            </div>
                            <div class="safety-text">
                                외교부는 해외에서 우리 국민에 대한 사건·사고 피해를 예방하고 우리 국민의 안전한 해외 거주·체류 및 방문을 도모하기 위해 <br>	
                                2004년부터 ‘여행경보제도’<a href="https://www.0404.go.kr" target="blank">(https://www.0404.go.kr)</a>를 운영해 오고 있습니다. <br>
                                <br>
                                여행경보는 발령대상 국가(지역)의 위협수준에 따라 1~4단계로 구분되며, <br>
                                상황에 따라서 상시적으로 변경이 되고 있기 때문에 출국 전 반드시 여행목적지(국가 또는 지역)의 여행경보를 확인 하시기 바랍니다.	
                            </div>
                        </div>
                    </div>
                    <div class="product-point">
                        <strong>여행지 안전정보</strong>
                    </div>
                    <div class="safety-country">
                     <strong>${country }</strong>
                    </div>
                    <div class="safety-info-div">
                        <table class="safety-table">
                            <tr>
                                <th class="safety-table-th">여행경보 단계</th>
                                <th class="safety-table-th">여행지(국가 또는 지역)</th>
                            </tr>
                            <tr>
                                <td class="safety-table-td"><span class="alertBlue">남색경보</span> 여행유의</td>
                                <td class="safety-table-td">전지역 전 지역</td>
                            </tr>
                            <tr>
                                <td class="safety-table-td"><span class="alertYellow">황색경보</span> 여행자제</td>
                                <td class="safety-table-td">-</td>
                            </tr>
                            <tr>
                                <td class="safety-table-td"><span class="alertRed">적색경보</span> 철수권고</td>
                                <td class="safety-table-td">-</td>
                            </tr>
                        </table>
                    </div>
                    <div class="safety-div">
                        <ul class="safety-div-ul">
                            <li class="safety-div-li">여행경보단계는 여행유의/여행자체/철수권고/여행금지 등 4단계로 구분되며, 외교부 '해외안전여행' 사이트 (www.0404.go.kr)에서 <br>
                                상세정보를 확인 할 수 있습니다.</li>
                            <li class="safety-div-li">해외여행 안전수칙정보는 한국여행협회 (www.kata.or.kr)에서 확인할 수 있습니다.</li>
                        </ul>
                    </div>`;

        productDiv.innerHTML = div;
    }

})

document.addEventListener('click',(e)=>{
    if(e.target.id == "managerInfoA"){


        let div = document.getElementById('managerInfoDiv');
        div.style.display = "block";
    }
})

document.addEventListener('click',(e)=>{
    let peple = document.getElementById('pepleCnt');
    let pepleval = parseInt(peple.value);
    let minus = document.getElementById('pepleCnt').value;
    let plus = document.getElementById('pepleCnt').value;

    let finalPrice = document.getElementById('finalPrice');
    
   

    let finalPriceVal = parseInt(finalPrice.innerHTML);

    let hiddenPrice = document.getElementById("hiddenPrice").value;
    

    if(e.target.id == "minus"){
        if(peple.value == 0){
            minus.disabled = 'disabled';
        }else{
            peple.value = (pepleval - 1);
            pepleval = pepleval-1;

            document.getElementById('price').value =  (hiddenPrice * pepleval);
            finalPrice.innerHTML = (hiddenPrice * pepleval).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','); 

        }
    }else if(e.target.id == "plus"){
        peple.value = (pepleval + 1);
        pepleval = pepleval+1;
        document.getElementById('price').value =  (hiddenPrice * pepleval);
        finalPrice.innerHTML = (hiddenPrice * pepleval).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','); 
       
    }
})



