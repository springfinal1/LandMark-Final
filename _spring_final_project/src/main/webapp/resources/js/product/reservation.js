/**
 * 
 */
 

console.log("js" + pkNoVal);


let checkbox = document.querySelectorAll(".all-check");
let icon = document.getElementById("icon-check");
let select = document.querySelectorAll(".select-check");

let peplecount = document.getElementById("peple-input"); // 인원수
let reservationPrice = document.getElementById("reservation-price"); // 변동수
let packagePrice = document.getElementById("package-price"); // 패키지 가격

let userCount=0;

console.log("aa" + reservationPrice.value);




icon.addEventListener('click',()=>{
    if(icon.classList.contains('checked-red')){
        for(let i=0; i<checkbox.length; i++){
            checkbox[i].classList.remove('checked-red');
        }
    }else{
        for(let i=0; i<checkbox.length; i++){
            checkbox[i].classList.add('checked-red');
        }
    }
})

for(let i=0; i<select.length; i++){
    select[i].addEventListener('click', ()=>{
        if(select[i].classList.contains('checked-red')){
            select[i].classList.remove('checked-red');
        }else{
            select[i].classList.add('checked-red');
        }
    })
}


document.getElementById('reservation-btn').addEventListener('click', () => {
    let aBtn = document.getElementById('reservation-btn-a');

    let checkBtn1 = document.getElementById('check-btn1');
    let checkBtn2 = document.getElementById('check-btn2');
    let checkBtn3 = document.getElementById('check-btn3');
    let checkBtn4 = document.getElementById('check-btn4');
    let checkBtn5 = document.getElementById('check-btn5');

    aaa = parseInt(pkNoVal);

    if (!checkBtn1.classList.contains('checked-red') || !checkBtn2.classList.contains('checked-red')
        || !checkBtn3.classList.contains('checked-red') || !checkBtn4.classList.contains('checked-red') || !checkBtn5.classList.contains('checked-red')) {
        alert("약관을 동의해주세요");
    } else {
        // 여기에서 이동할 URL을 지정하세요.
        aBtn.href = `/peyment/peyDetail?pkNo=${pkNoVal}&userCount=${userCount}`;

        // 예시로 "/"로 지정되어 있습니다. 실제로 이동할 URL을 지정해주세요.
        aBtn.click();  // 버튼 클릭을 프로그래밍적으로 시뮬레이션
    }
});


document.addEventListener('click', (e) => {
      let pepleValue = parseInt(peplecount.value);
      let packageValue = parseInt(packagePrice.value);

    // 값이 NaN이거나 음수인 경우 기본값 설정
    if (isNaN(pepleValue) || pepleValue < 0) {
        pepleValue = 0;
    }

    if (isNaN(packageValue) || packageValue < 0) {
        packageValue = 0;
    }

    if (e.target.id == "minus-btn") {
        // 음수가 되지 않도록 체크
        if (pepleValue > 0) {
            pepleValue -= 1;
            peplecount.value = pepleValue;
        }
    } else if (e.target.id == "plus-btn") {
        pepleValue += 1;
        peplecount.value = pepleValue;
    }

    // 최종 합계 계산
    let totalPrice = pepleValue * packageValue;

    // 결과를 출력
    reservationPrice.value = totalPrice;
     userCount = pepleValue;
    
    console.log("ssss" + userCount);

    // 콘솔에 로그 찍어보기
    console.log("pepleValue:", userCount);
    console.log("packageValue:", packageValue);
    console.log("totalPrice:", totalPrice);

});


let closeBtn = document.querySelectorAll('.terms-modal-close'), // 모달창 닫기
    modalBack = document.querySelector('.terms-modal-back'),
    modalOpen1 = document.querySelector('#modal-open-1'),
    modalOpen2 = document.querySelector('#modal-open-2'),
    modalOpen3 = document.querySelector('#modal-open-3'),
    modalOpen4 = document.querySelector('#modal-open-4'),
    modalOpen5 = document.querySelector('#modal-open-5'),
    modal1 = document.querySelector('#modal-1'),
    modal2 = document.querySelector('#modal-2'),
    modal3 = document.querySelector('#modal-3'),
    modal4 = document.querySelector('#modal-4'),
    modal5 = document.querySelector('#modal-5');

    modalOpen1.addEventListener('click', function(){
        modal1Open(1);
    });
    modalOpen2.addEventListener('click', function(){
        modal1Open(2);
    });
    modalOpen3.addEventListener('click', function(){
        modal1Open(3);
    });
    modalOpen4.addEventListener('click', function(){
        modal1Open(4);
    });
    modalOpen5.addEventListener('click', function(){
        modal1Open(5);
    });
    closeBtn.forEach( e => {
        e.addEventListener('click', modalClose);
    })
    function modal1Open(num){
        modalBack.style.display = 'block';
        switch (num) {
            case 1:
                modal1.style.display = 'flex';
                setTimeout(() => {
                    modal1.classList.add('terms-modal-translate');
                }, 100);
                break;
            case 2:
                modal2.style.display = 'flex';
                setTimeout(() => {
                    modal2.classList.add('terms-modal-translate');
                }, 100);
                break;
            case 3:
                modal3.style.display = 'flex';
                setTimeout(() => {
                    modal3.classList.add('terms-modal-translate');
                }, 100);
                break;
            case 4:
                modal4.style.display = 'flex';
                setTimeout(() => {
                    modal4.classList.add('terms-modal-translate');
                }, 100);
                break;
            case 5:
                modal5.style.display = 'flex';
                setTimeout(() => {
                    modal5.classList.add('terms-modal-translate');
                }, 100);
                break;
        }
    }
    
    function modalClose(){
        modalBack.style.display = 'none';
        modal1.style.display = 'none';
        modal1.classList.remove('terms-modal-translate');
        modal2.style.display = 'none';
        modal2.classList.remove('terms-modal-translate');
        modal3.style.display = 'none';
        modal3.classList.remove('terms-modal-translate');
        modal4.style.display = 'none';
        modal4.classList.remove('terms-modal-translate');
        modal5.style.display = 'none';
        modal5.classList.remove('terms-modal-translate');
    }