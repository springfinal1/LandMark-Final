const arcodians = document.querySelectorAll('.arcodian');

arcodians.forEach(function(arcodian) {
  arcodian.addEventListener('click', function() {
   
    if(arcodian.parentNode.classList.contains('on'))
      arcodian.parentNode.classList.remove('on');
    else
      arcodian.parentNode.classList.add('on');
  });
});

// $.ajax({
//   url : "로딩할 페이지 URL, ex)/common/list.jsp",
//   dataType : "html",
//   type : "post",  // post 또는 get
//   data : { a:"값1", b:"값2"},   // 호출할 url 에 있는 페이지로 넘길 파라메터
//   success : function(result){
//       $("#div 아이디").html(result);
//   }
// });


let eventregister=document.getElementById('callEventRegister');

eventregister.addEventListener('click',()=>{
  $.ajax({
    url : "/event/eventRegister",
    dataType : "html",
    type : "get",  // post 또는 get
    success : function(result){
        $(".main-pannel").html(result);
    }
});
})