
let header = document.querySelector('header'), // 헤더
    mainMenu = document.querySelectorAll('.drop-menu > dd'), // 메인 메뉴
    subMenu = document.querySelectorAll('.sub-menu'), // 서브 메뉴
    headerHeight = header.offsetHeight, // 기본(초기) 헤더 높이값 변수
    subMenuHeight = 0; // 서브메뉴 높이값 변수

    console.log("headerHeight >> "+ headerHeight);
    console.log(mainMenu);
    console.log(subMenu);
    
    // 서브 메뉴 중 가장 높은 값의 height 값 구하기
    // for(let i = 0; i < subMenu.length; i++){
    //     if(subMenuHeight < subMenu[i].offsetHeight){
    //         subMenuHeight = subMenu[i].offsetHeight;
    //     }
    // }


// 메인 메뉴 중 마우스 오버시 이벤트 발생
for(let i = 0; i < mainMenu.length; i++){
    mainMenu[i].addEventListener('mouseenter', function(){
        let dl = this.querySelector('dl'); // 마우스오버한 메뉴 하위 dl
        let dd = dl.querySelectorAll('dd'); // dl의 하위 dd
        dl.style.display = 'block'; // 해당 dl 디스플레이 block
        subMenuHeight = dl.offsetHeight; // 해당 dl의 height값 설정
        header.style.height = headerHeight + subMenuHeight + 20 + 'px'; // 기본 헤더의height + dl의height
        // setTimeout(() => {
            dd.forEach((e, i) =>{ // 스타일 부여 지연작업(e = 객체, i = 인덱스)
                setTimeout(() => {
                    e.style.opacity = '1';
                }, (i + 1) * 20);
            });

        // }, 300);
        
        // header.style.height = headerHeight + subMenuHeight + 20 +'px';
    })

    mainMenu[i].addEventListener('mouseleave', function(){
        let dl = this.querySelector('dl'); // 마우스오버한 메뉴 하위 dl
        let dd = dl.querySelectorAll('dd'); // dl의 하위 dd
        dl.style.display = 'none'; // 해당 dl 디스플레이 none
        setTimeout(() => {
	        dd.forEach(e =>{
	            e.style.opacity = '0';
	        })
        }, 50);
        header.style.height = headerHeight + "px";
    })

}

