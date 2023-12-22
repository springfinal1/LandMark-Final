let ticketModalBack = document.querySelector('.flight-ticket-modal-back'), // 모달 백그라운드
    ticketModal = document.querySelector('.flight-ticket-modal'), // 티켓모달
    cityCodeText = document.querySelectorAll('.city-code'), // 공항코드
    departurDayText = document.querySelectorAll('.departure-day'), // 출발일
    seatTypeText = document.querySelectorAll('.seat-type'), // 좌석타입
    geteText = document.querySelectorAll('.gate') // gate
    ticketList = document.querySelectorAll('.ticket-list'), // 티켓예매 내역 리스트
    closeBtn = document.querySelector('#closeTicketModal'); // 닫기버튼

    ticketList.forEach(e =>{
        e.addEventListener('click', ()=>{
            let gateVal = e.dataset.gate;
            let cityCodeVal = e.dataset.city;
            let departureDayVal = e.dataset.departure;
            let seatTypeVal = e.dataset.seat;
            console.log(cityCodeVal + "," + departureDayVal + "," + seatTypeVal + 
            "," + gateVal);
            ticketModalBack.style.display = 'block';
            cityCodeText.forEach(e=>{
                e.innerHTML = cityCodeVal;
            })
            departurDayText.forEach(e=>{
                e.innerHTML = departureDayVal;
            })
            seatTypeText.forEach(e=>{
                e.innerHTML = seatTypeVal;
            })
            geteText.forEach(e=>{
                e.innerHTML = gateVal;
            })
        })
    })

    closeBtn.addEventListener('click', ()=>{
        ticketModalBack.style.display = 'none';
    })