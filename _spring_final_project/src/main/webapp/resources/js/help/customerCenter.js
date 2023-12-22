let faqItems = document.querySelectorAll('.faq-list-item'); // 자주묻는질문

// 자식 요소는 querySelector로 찾고 부모 요소는 parentNode 로 찾기

faqItems.forEach(e =>{
    e.addEventListener('click', ()=>{
        let aArea = e.querySelector(' .a-area'),
            faq = e.querySelector(' .faq-q'),
            arrow = e.querySelector('#arrowDown');
        if(e.classList.contains('active')){
            e.classList.remove('active');
            aArea.style.display = 'none';
            faq.classList.remove('fap-active');
            arrow.style.transform = 'rotate(0deg)';
        }else{
            e.classList.add('active');
            aArea.style.display = 'flex';
            faq.classList.add('fap-active');
            arrow.style.transform = 'rotate(-180deg)';
        }
        
    })
})

let typeSelect = document.querySelector('.type-select'), // 실제 select tag(숨겨짐)
    selectSpan = document.querySelector('.select-span'), // option선택시 text영역
    select = document.querySelector('.select-dl'), // 커스텀 select dl
    selectOption = document.querySelectorAll('.select-dl dd'), // 커스텀 select dd
    selectBox = document.querySelector('.select-box'), // select  전체 div
    selectBoxAll = document.querySelectorAll('.select-box '), // select  전체 div
    arrow = document.getElementById('arrowDown'); // 화살표
selectOption.forEach(e =>{
    e.addEventListener('click', (e)=>{
        let val = e.target.dataset.select;
        if(val == '선택'){
            typeSelect.innerHTML = `<option value="">${val}`;
        }else{
            typeSelect.innerHTML = `<option value="${val}">${val}`;
        }
        selectSpan.innerText = val;
        console.log(typeSelect.value);
    })
})

document.addEventListener('click', e=>{
    console.log(e.target);
    if(e.target == selectBox){
        if(select.classList.contains('visible')){
            select.classList.remove('visible');
	        selectBox.classList.remove('checked-box');
            arrow.style.transform = 'rotate(0deg)';
        }else{
            select.classList.add('visible');
            selectBox.classList.add('checked-box');
            arrow.style.transform = 'rotate(-180deg)';
        }
    } else{
        selectBox.classList.remove('checked-box');
        select.classList.remove('visible');
        arrow.style.transform = 'rotate(0deg)';
    }
})