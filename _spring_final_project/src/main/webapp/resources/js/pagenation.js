

let prevLink = document.querySelector('.prev-a'); // 이전 a링크
let nextLink = document.querySelector('.next-a'); // 다음 a링크

if(prev == 'false'){
	prevLink.removeAttribute('href'); // 페이징핸들러의 prev변수가 false면 href 제거
}
if(next == 'false'){
	nextLink.removeAttribute('href'); // 페이징핸들러의 next변수가 false면 href 제거
}

