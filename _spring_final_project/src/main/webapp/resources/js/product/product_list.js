
let placeDiv  = document.querySelector('.placeDiv'); // 전체디브
let placeH2 = document.querySelectorAll('.place-h2'); //지역보기

let placeDrop = document.querySelectorAll('.place-drop-menu span');
let placeAll = document.getElementById('placeAll');



placeAll.addEventListener('click',()=>{



    if(!placeAll.classList.contains("exit")){
        placeAll.classList.add('exit');
    
        placeDiv.style.height = '100vh';
        placeDiv.style.transition = '0.7s';
        placeDiv.style.borderTop = "1px solid black";
        setTimeout(time, 200);
    }else if(placeAll.classList.contains("exit")){
        placeAll.classList.remove('exit');

        placeDiv.style.height = '0';
        placeDiv.style.transition = '0.7s';
        placeDiv.style.borderTop = "none";

        placeDrop.forEach(elem =>{
        elem.style.fontSize = "0";
        })
    }
})

function time(){
    placeDrop.forEach(elem =>{

        elem.style.fontSize = "18px";
    })
}
let heartBtn = document.querySelectorAll('.heart-btn');
let pkNo = "";

//console.log(e.dataset.heart);
// 아이디가 null x

function openFunction(){
    if(heartBtn.length > 0){
        heartBtn.forEach(e=>{
            console.log(e.dataset.heart);
            checkRed().then(result=>{
                if(result != null){
                    for(let i=0; i<result.length; i++){
                        if(result[i].pkNo == e.dataset.heart){
                            e.classList.add('check-heart');
                        }
                    }
                }
            })
        })
    }
}

heartBtn.forEach(e=>{
    e.addEventListener('click',()=>{
    pkNo = e.dataset.heart;
    if(idVal != ""){
        if(e.classList.contains('check-heart')){
            e.classList.remove('check-heart');
            favoriteRemoveFormServer(pkNo,idVal).then(result=>{               
                alert("관심상품 삭제 완료");              
            })
        }else{
            e.classList.add('check-heart');
            favoriteFromServer(idVal,pkNo).then(result=>{
                alert("관심상품 등록 성공");
                
            })
        }    
    }else{
        alert("로그인 후 관심상품 등록 가능합니다");
    }
    })
})


async function favoriteFromServer(idVal,pkNo){
    try {
        //const url = "/freetour/favorite"+idVal;
        const resp = await fetch("/product/favorite/"+idVal+"/"+pkNo);
        const result = await resp.text();
        return result;
    } catch (error) {
        console.log(error);
    }
}

async function checkRed(){
    try {
        const resp = await fetch("/product/checkRed");
        const result = await resp.json();
        return result;
    } catch (error) {
        console.log(error);
    }
}

async function favoriteRemoveFormServer(pkNo,idVal){
    try{
        const url = "/product/favoriteRemove/"+pkNo+"/"+idVal;
        const config={
            method: "delete"
        };

        const resp = await fetch(url,config);
        const result = await resp.text();
        return result;
    }catch(error){
        console.log(error);
    }
}


let dropSpan = document.querySelector('.place-drop-menu');



    // if(placeAll.innerHTML == "지역보기"){
    //     console.log("탄다")
    //     dropSpan.innerHTML = `<span><a href="/product/list?pkContinent=동북아">동북아</a></span>`;
    //     dropSpan.innerHTML += `<span><a href="/product/list?pkContinent=동남아">동남아</a></span>`;
    //     dropSpan.innerHTML += `<span><a href="/product/list?pkContinent=유럽">유럽</a></span>`;
    //     dropSpan.innerHTML += `<span><a href="/product/list?pkContinent=아메리카">남미/중미/북미</a></span>`;
    // }else if(placeAll.innerHTML == "테마보기"){
    //     console.log("탄다")
    //     dropSpan.innerHTML = `<span><a href="/product/list?pkContinent=이색휴양지">이색 휴양지</a></span>`;
    //     dropSpan.innerHTML += `<span><a href="/product/list?pkContinent=아름다운도시">아름다운 도시</a></span>`;
    //     dropSpan.innerHTML += `<span><a href="/product/list?pkContinent=커플여행">커플 여행</a></span>`;
    //     dropSpan.innerHTML += `<span><a href="/product/list?pkContinent=럭셔리호캉스">럭셔리 호캉스</a></span>`;
    //     dropSpan.innerHTML += `<span><a href="/product/list?pkContinent=일본료칸(온천)">일본 료칸(온천)</a></span>`;
    // }


