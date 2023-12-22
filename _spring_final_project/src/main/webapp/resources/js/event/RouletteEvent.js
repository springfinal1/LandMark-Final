
 
const $c = document.querySelector("canvas");
const ctx = $c.getContext(`2d`);

let product;
const colors = ["#ffe9bb", "#ffffff"];


  $.ajax({
    type: "POST",            // HTTP method type(GET, POST) 형식이다.
    url: "/event/getPrize",      // 컨트롤러에서 대기중인 URL 주소이다.
    data: {evNo:evNo},     
    success: function (res) { // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
      if(res!=null){
        console.log(res);
        product=res.split(",");
        console.log(product);
        newMake();
      }
      else{
        product = [
          "떡볶이", '돈가스', "초밥", "피자", "냉면", "치킨", '족발', "피자", "삼겹살",
        ];
      }
    },
    error: function (XMLHttpRequest, textStatus, errorThrown) { // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
      alert("통신 실패.");
    }
  });


const newMake = () => { //룰렛 만들기

  
  const [cw, ch] = [$c.width / 2, $c.height / 2];
  const arc = Math.PI / (product.length / 2);

  for (let i = 0; i < product.length; i++) {
    ctx.beginPath();
    ctx.fillStyle = colors[i % (colors.length)];
    ctx.moveTo(cw, ch);
    ctx.arc(cw, ch, cw, arc * (i - 1), arc * i);
    ctx.fill();
    ctx.closePath();
  }

  ctx.fillStyle = "#fff";
  ctx.font = "18px Pretendard";
  ctx.textAlign = "center";

  for (let i = 0; i < product.length; i++) {
    const angle = (arc * i) + (arc / 2);

    ctx.save();

    ctx.translate(
      cw + Math.cos(angle) * (cw - 50),
      ch + Math.sin(angle) * (ch - 50),
    );

    ctx.rotate(angle + Math.PI / 2);

    product[i].split(" ").forEach((text, j) => {
      ctx.fillText(text, 0, 30 * j);
    });

    ctx.restore();
  }
}

const rotate = () => {  //룰렛 돌리기
  $c.style.transform = `initial`;
  $c.style.transition = `initial`;

  setTimeout(() => {

    const ran = Math.floor(Math.random() * product.length);

    const arc = 360 / product.length;
    const rotate = (ran * arc) + 3600 + (arc * 2);

    $c.style.transform = `rotate(-${rotate}deg)`;
    $c.style.transition = `2s`;

    setTimeout(() => alert(`축하드립니다! ${product[ran]} 당첨!`), 2000);
    var prizeVO = {
      id: uid,
      prize: `${product[ran]}`
    }

    // ajax 통신
    $.ajax({
      type: "POST",            // HTTP method type(GET, POST) 형식이다.
      url: "/event/postPrize",      // 컨트롤러에서 대기중인 URL 주소이다.
      contentType : "application/json;charset=UTF-8",
      data: JSON.stringify(prizeVO),            // Json 형식의 데이터이다.
      error: function (XMLHttpRequest, textStatus, errorThrown) { // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
        alert("통신 실패.")
      }
    });
}, 1);

};\