let imgBackground = document.querySelector('.recommendation-tour-box'), // 백그라운드 이미지
    selectItems = document.querySelectorAll('.item-list');

    selectItems.forEach((e, i) =>{
        e.addEventListener('mouseenter', ()=>{
            if(i == 0){
                imgBackground.style.backgroundImage = `url('/resources/image/main-image2/dresden.jpg')`;
            } else if(i == 1){
                imgBackground.style.backgroundImage = `url('/resources/image/main-image2/egypt.jpg')`;
            } else if(i == 2){
                imgBackground.style.backgroundImage = `url('/resources/image/main-image2/laos.jpg')`;
            }
        })
    })

