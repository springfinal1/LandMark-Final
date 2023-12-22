console.log('elistjs연결');


if (msg == "on") {
   let on = document.getElementById('on');
   on.style.color = "red";
   on.style.fontWeight=800;
}
else {
   let last = document.getElementById('last');
   last.style.color = "red";
   last.style.fontWeight=800;

   let img=document.querySelector('.event-img img');
   img.style.filter='brightness(50%)';
}