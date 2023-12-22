
// 메인 슬라이더
// <!-- ex) html 구조 -->
// <div class="slider-wraper">
    
//     <div id="slider" class="slider">
//         <div class="items slider-item1"></div>
//         <div class="items slider-item2"></div>
//         <div class="items slider-item3"></div>
//     </div>
    
//     <div class="left-arrow">
//         Prev
//         <i class="fa-solid fa-chevron-left"></i>
//     </div>
//     <div class="right-arrow">
//         Next
//         <i class="fa-solid fa-chevron-right"></i>
//     </div>
// </div>

function slider(wrapperName){ // 슬라이드 모듈화 함수
    // 변수 설정
    let slide = document.querySelector('.' + wrapperName); // slider wraper
    let items = document.querySelectorAll('.items'); // 슬라이드 아이템 리스트
    let index = 0; // 슬라이드 인덱스
    let slideQty = items.length; // 슬라이드 개수
    let itemWidth = slide.clientWidth// 슬라이드 아이템 width
    let margin = 0; // 마진 필요시 입력
    let startPosition = (itemWidth + margin) * slideQty; // 초기 위치 설정값 변수
    let prevBtn = document.querySelector('.left-arrow'); // prev버튼
    let nextBtn = document.querySelector('.right-arrow'); // next버튼
    
    makeClone(); // 클론 생성 함수 호출


    // 클론 슬라이드 앞,뒤 생성 함수
    function makeClone(){
        for(let i = 0; i < items.length; i++){
            let cloneSlide = items[i].cloneNode(true)
            cloneSlide.classList.add('clone');
            slide.append(cloneSlide); // 뒤에 추가(복사본)
        }
        for(let i = items.length-1; i >= 0; i--){
            let cloneSlide = items[i].cloneNode(true)
            cloneSlide.classList.add('clone');
            slide.prepend(cloneSlide); // 앞에 추가(복사본)
        }
        // 복사본 생성후 wrapper width 설정
        updateWidth();
        // 초기위치 설정
        initTransform();
    }
    
    // slide wrapper widh 설정 함수
    function updateWidth(){
        let slideTotalQty = document.querySelectorAll('.items').length; // 총 슬라이드 개수(복사본포함)
        console.log('아이템 개수 >>'+slideTotalQty);
        console.log('아이템 width >>'+itemWidth);
        // slider.style.width = `${itemsQty * 설정할값}설정단위`;
        slide.style.width = `${slideTotalQty * (itemWidth + margin)}px`; // 전체 슬라이더 width
    }
    
    // 초기 슬라이드위치 설정 함수
    function initTransform(){
        // 복사본(초기 슬라이드 개수) * 슬라이드width 만큼 이동
        slide.style.transform = `translateX(-${startPosition}px)`;
    }

    // 트렌지션 효과 함수
    function addTransition(elem, time){
        elem.style.transition = `${time}s`;
    }

    // prev, next 이벤트 설치
    prevBtn.addEventListener('click', ()=>{
        moveSlide(index-1);
        initTextTransform();
        setTimeout(() => {
            textTransform();
        }, 300);
    });
    nextBtn.addEventListener('click', ()=>{
        moveSlide(index+1);
        initTextTransform();
        setTimeout(() => {
            textTransform();
        }, 200);
    });
    // 슬라이드 이동함수
    function moveSlide(num){
        slide.style.transform = `translateX(-${startPosition + ((itemWidth+margin) * num)}px)`;
        addTransition(slide, 0.5);
        // 이동후 인덱스 변경
        index = num;
        console.log('현재위치>>'+index+", 아이템개수>>"+slideQty);
        // 만약 복사본 첫페이지 또는 마지막페이지로 이동시 인덱스 0으로 복귀
        if(index == slideQty || index == -slideQty){
            setTimeout(()=>{
                addTransition(slide, 0); // transtion 효과 없애기
                initTransform(); // 초기위치로 바꿔줌
                index = 0;
            }, 500);
        }
    }
    
    // 슬라이드 이동시 안의 text 등장함수
    function textTransform(){
        let text1 = document.querySelectorAll('.festival-item-txt1');
        let text2 = document.querySelectorAll('.festival-item-txt2');
        let text3 = document.querySelectorAll('.festival-item-txt3');
        setTimeout(() => {
            text1.forEach(e =>{
                addTransition(e, 0.3);
                e.style.transform = 'translateX(0)';
            })
            setTimeout(() => {
                text2.forEach(e =>{
                    addTransition(e, 0.3);
                    e.style.transform = 'translateX(0)';
                })
                setTimeout(() => {
                    text3.forEach(e =>{
                        addTransition(e, 0.3);
                        e.style.opacity = '1';
                    })
                }, 200);
            }, 200);
        }, 200);
        initTextTransform();
    }
    // 슬라이드 이동시 안의 text 위치초기화 함수
    function initTextTransform(){
        let text1 = document.querySelectorAll('.festival-item-txt1');
        let text2 = document.querySelectorAll('.festival-item-txt2');
        let text3 = document.querySelectorAll('.festival-item-txt3');
        text1.forEach(e =>{
            e.style.transition = '0s';
            e.style.transform = 'translateX(-100%)';
        })
        text2.forEach(e =>{
            e.style.transition = '0s';
            e.style.transform = 'translateX(-100%)';
        })
        text3.forEach(e =>{
            e.style.transition = '0s';
            e.style.opacity = '0';
        })
    }


    // 기본 자동 슬라이드
    // let loopInterval = setInterval(() => {
	//	moveSlide(index + 1);
    // }, 1000);
     
	// 슬라이드에 마우스가 올라간 경우 루프 멈추기
	// slide.addEventListener("mouseover", () => {
	//	clearInterval(loopInterval);
	// });
	
	// 슬라이드에서 마우스가 나온 경우 루프 재시작하기
	// slide.addEventListener("mouseout", () => {
	//	loopInterval = setInterval(() => {
	//		moveSlide(index + 1);
	//	}, 1000);
	// });
    

}
