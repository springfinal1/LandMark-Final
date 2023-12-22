let themeType = document.querySelector('.themeType');
let themeName = document.querySelector('.themeName');
//타입에따라 이미지먹일거
let theme_1 = document.querySelector('.theme-1');
let theme_2 = document.querySelector('.theme-2');
let theme_3 = document.querySelector('.theme-3');
let theme_4 = document.querySelector('.theme-4');
let theme_5 = document.querySelector('.theme-5');
let theme_6 = document.querySelector('.theme-6');
//타입에따라 설명
let theme_info_1 = document.querySelector('.theme-info-1');
let theme_info_2 = document.querySelector('.theme-info-2');
let theme_info_3 = document.querySelector('.theme-info-3');
let theme_info_4 = document.querySelector('.theme-info-4');
let theme_info_5 = document.querySelector('.theme-info-5');
let theme_info_6 = document.querySelector('.theme-info-6');
//타입에따라 나라 이름변경
let theme_country_1 = document.querySelector(".theme-country-1");
let theme_country_2 = document.querySelector(".theme-country-2");
let theme_country_3 = document.querySelector(".theme-country-3");
let theme_country_4 = document.querySelector(".theme-country-4");
let theme_country_5 = document.querySelector(".theme-country-5");
let theme_country_6 = document.querySelector(".theme-country-6");

console.log(themeTag+"type");

if(themeTag == 1){
    // 신혼여행
    themeName.innerText = "#신혼여행#커플여행#허니문";
    theme_1.style.backgroundImage = "url(/resources/image/free-image/몰디브.jpg)";
    theme_info_1.innerHTML = "모히또에서 몰디브 한잔";
    theme_country_1.innerHTML ="몰디브/말레";

    theme_2.style.backgroundImage = "url(/resources/image/free-image/하와이-쇼핑.jpg)";
    theme_info_2.innerHTML = "쇼핑의 천국";
    theme_country_2.innerHTML ="하와이/호놀롤루";

    theme_3.style.backgroundImage = "url(/resources/image/free-image/카리브해.jpg)";
    theme_info_3.innerHTML = "카리브해의 에메랄드 빛 바다";
    theme_country_3.innerHTML ="칸쿤";

    theme_4.style.backgroundImage = "url(/resources/image/free-image/발리.jpg)";
    theme_info_4.innerHTML = "관광 레저 휴양 맛집 모든것이 가능한 이곳";
    theme_country_4.innerHTML ="발리";

    theme_5.style.backgroundImage = "url(/resources/image/free-image/푸켓.jpg)";
    theme_info_5.innerHTML = "아시아의 진주";
    theme_country_5.innerHTML ="푸켓";

    theme_6.style.backgroundImage = "url(/resources/image/free-image/자그레브.jpg)";
    theme_info_6.innerHTML = "유럽의 낭만 허니문 크로아티아";
    theme_country_6.innerHTML ="자그레브";

    
}else if(themeTag == 2){
    // 드라마명소
    themeName.innerText = "#드라마명소#영화촬영지";
    theme_1.style.backgroundImage = "url(/resources/image/free-image/오키나와.jpg)";
    theme_info_1.innerHTML = '"눈물이 주륵주륵" 감성여행';
    theme_country_1.innerHTML ="오키나와";

    theme_2.style.backgroundImage = "url(/resources/image/free-image/하와이-쇼핑.jpg)";
    theme_info_2.innerHTML = "쇼핑의 천국";
    theme_country_2.innerHTML ="하와이/호놀롤루";

    theme_3.style.backgroundImage = "url(/resources/image/free-image/마카오.jpg)";
    theme_info_3.innerHTML = '"도둑들" 펠리시다데 거리';
    theme_country_3.innerHTML ="마카오";

    theme_4.style.backgroundImage = "url(/resources/image/free-image/베니스.jpg)";
    theme_info_4.innerHTML = '"베니스 영화제" 함께 할래?';
    theme_country_4.innerHTML ="베니스";

    theme_5.style.backgroundImage = "url(/resources/image/free-image/프랑스-파리.jpg)";
    theme_info_5.innerHTML = "악마는 프라다를 입는다";
    theme_country_5.innerHTML ="파리";

    theme_6.style.backgroundImage = "url(/resources/image/free-image/미국-로스앤젤레스.jpg)";
    theme_info_6.innerHTML = '"라라랜드" "세계 최초의 디즈니랜드" "유니버셜 스튜디오 할리우드"';
    theme_country_6.innerHTML ="로스앤젤레스";
   
}else if(themeTag == 3){
    // 겨울 스키
    themeName.innerText = "#겨울왕국#스키#보드";
    theme_1.style.backgroundImage = "url(/resources/image/free-image/삿포로.jpg)";
    theme_info_1.innerHTML = '"눈의 도시 훗카이도" 오겡끼데스까~';
    theme_country_1.innerHTML ="삿포로";

    theme_2.style.backgroundImage = "url(/resources/image/free-image/알래스카.jpg)";
    theme_info_2.innerHTML = '"알래스카 크루즈투어" 추천!';
    theme_country_2.innerHTML ="앵커리지";

    theme_3.style.backgroundImage = "url(/resources/image/free-image/취리히.jpg)";
    theme_info_3.innerHTML = '"스위스 최고의 휴양도시" 에서 겨울스포츠 ㄱㄱ';
    theme_country_3.innerHTML ="취리히";

    theme_4.style.backgroundImage = "url(/resources/image/free-image/시베리아.jpg)";
    theme_info_4.innerHTML = '아름다운 겨울바다 "바이칼 호수" 투어';
    theme_country_4.innerHTML ="시베리아";

    theme_5.style.backgroundImage = "url(/resources/image/free-image/이스탄불.jpg)";
    theme_info_5.innerHTML = "역사와 문화의 도시";
    theme_country_5.innerHTML ="이스탄불";

    theme_6.style.backgroundImage = "url(/resources/image/free-image/아이슬란드.jpg)";
    theme_info_6.innerHTML = "아이슬란드가 내게로 왔다";
    theme_country_6.innerHTML ="레이캬빅";
}else if(themeTag == 4){
    // 서핑
    themeName.innerText = "#서핑명소#다이빙#물놀이";
    theme_1.style.backgroundImage = "url(/resources/image/free-image/필리핀-세부.jpg)";
    theme_info_1.innerHTML = '다이빙의 성지';
    theme_country_1.innerHTML ="세부";

    theme_2.style.backgroundImage = "url(/resources/image/free-image/몰디브.jpg)";
    theme_info_2.innerHTML = '몰디브에서 모히또 한잔';
    theme_country_2.innerHTML ="몰디브/말레";

    theme_3.style.backgroundImage = "url(/resources/image/free-image/사이판-바다.jpg)";
    theme_info_3.innerHTML = '"그로또" 해저동굴 안에서 환상적인 수중 풍경';
    theme_country_3.innerHTML ="사이판";

    theme_4.style.backgroundImage = "url(/resources/image/free-image/코로르-바다.jpg)";
    theme_info_4.innerHTML = "신들의 바다 정원";
    theme_country_4.innerHTML ="코로르/팔라우";

    theme_5.style.backgroundImage = "url(/resources/image/free-image/벨리즈.jpg)";
    theme_info_5.innerHTML = '지구의 눈 "그레이트 블루 홀"';
    theme_country_5.innerHTML ="벨리즈";

    theme_6.style.backgroundImage = "url(/resources/image/free-image/케언즈.jpg)";
    theme_info_6.innerHTML = '"니모를 찾아서"의 배경 "그레이트 배리어 리프"';
    theme_country_6.innerHTML ="호주/케언즈";
}else if(themeTag == 5){
    // 야경
    themeName.innerText = "#야경맛집#감성뿜뿜";
    theme_1.style.backgroundImage = "url(/resources/image/free-image/도쿄-야경.jpg)";
    theme_info_1.innerHTML = '"신데렐라의 성" "도쿄 Only 디즈니씨"';
    theme_country_1.innerHTML ="도쿄";

    theme_2.style.backgroundImage = "url(/resources/image/free-image/홍콩-야경.jpg)";
    theme_info_2.innerHTML = '"잠자는 숲속의 공주" "마블덕후" 는 요기';
    theme_country_2.innerHTML ="홍콩";

    theme_3.style.backgroundImage = "url(/resources/image/free-image/프랑스-파리.jpg)";
    theme_info_3.innerHTML = '악마는 프라다를 입는다';
    theme_country_3.innerHTML ="파리";

    theme_4.style.backgroundImage = "url(/resources/image/free-image/부다페스트-야경.jpg)";
    theme_info_4.innerHTML = "세계적인 야경과 온천의 도시";
    theme_country_4.innerHTML ="헝가리/부다페스트";

    theme_5.style.backgroundImage = "url(/resources/image/free-image/프라하-야경.jpg)";
    theme_info_5.innerHTML = '프라하의 밤은 낮보다 충분히 화려하다"';
    theme_country_5.innerHTML ="프라하";

    theme_6.style.backgroundImage = "url(/resources/image/free-image/싱가포르-야경.jpg)";
    theme_info_6.innerHTML = '마리나베이 샌즈를 중심으로 펼쳐지는 야경';
    theme_country_6.innerHTML ="싱가포르";
}else if(themeTag == 6){
    // 오로라
    themeName.innerText = "#오로라#밤하늘댄서";
    theme_1.style.backgroundImage = "url(/resources/image/free-image/노르웨이-오로라.jpg)";
    theme_info_1.innerHTML = '아름다운 오로라뿐 아니라 극야까지 볼 수 있는 곳';
    theme_country_1.innerHTML ="노르웨이/스발바르제도";

    theme_2.style.backgroundImage = "url(/resources/image/free-image/핀란드-오로라.jpg)";
    theme_info_2.innerHTML = '따뜻한 실내에서 바라볼 수 있는 오로라를 원한다면?';
    theme_country_2.innerHTML ="핀란드/칵슬라우타넨";

    theme_3.style.backgroundImage = "url(/resources/image/free-image/스웨덴-오로라.jpg)";
    theme_info_3.innerHTML = '오로라 뿐만 아닌 북극광, 쏟아지는 별까지 감상할 수 있는 곳';
    theme_country_3.innerHTML ="스웨덴/유카스야르비";

    theme_4.style.backgroundImage = "url(/resources/image/free-image/아이슬란드-오로라.jpg)";
    theme_info_4.innerHTML = '꽃 청춘을 사로잡고 영화 "인터스텔라"의 배경';
    theme_country_4.innerHTML ="아이슬란드/레이캬비크";

    theme_5.style.backgroundImage = "url(/resources/image/free-image/스코틀랜드-오로라.jpg)";
    theme_info_5.innerHTML = '탁 트인 넓은 지대 , 오로라 빛을 쉽게 볼 수 있는  곳"';
    theme_country_5.innerHTML ="영국/스코틀랜드";

    theme_6.style.backgroundImage = "url(/resources/image/free-image/퀘백-오로라.jpg)";
    theme_info_6.innerHTML = '환상적인 오로라와 낭만의 도시';
    theme_country_6.innerHTML ="캐나다/퀘백";
}else if(themeTag == 7){
    // 등산
    themeName.innerText = "#등산#히말라야#버킷리스트";
    theme_1.style.backgroundImage = "url(/resources/image/free-image/트레드보-등산.jpg)";
    theme_info_1.innerHTML = '"코시우스코산" 호주에서 가장 높은산(2,228m)';
    theme_country_1.innerHTML ="호주/트레드보";

    theme_2.style.backgroundImage = "url(/resources/image/free-image/후지산-등산.jpg)";
    theme_info_2.innerHTML = '"후지산" 세계에서 가장 인정받은 완벽한 화산';
    theme_country_2.innerHTML ="일본/혼슈";

    theme_3.style.backgroundImage = "url(/resources/image/free-image/모로코-등산.jpg)";
    theme_info_3.innerHTML = '"지벨 투브칼산" 북아프리카에서 가장 높은산(4,167m)';
    theme_country_3.innerHTML ="모로코/임릴";

    theme_4.style.backgroundImage = "url(/resources/image/free-image/하와이-등산.jpg)";
    theme_info_4.innerHTML = '해저면에서 정상까지로 세계에서 가장 높은 산(10,205m)';
    theme_country_4.innerHTML ="미국/하와이";

    theme_5.style.backgroundImage = "url(/resources/image/free-image/킬리만자로-등산.jpg)";
    theme_info_5.innerHTML = '세계에서 홀로 서 있는 가장 높은 독립형 정상(5,895m)';
    theme_country_5.innerHTML ="탄자니아/킬리만자로";

    theme_6.style.backgroundImage = "url(/resources/image/free-image/히말라야-등산.jpg)";
    theme_info_6.innerHTML = '"세계의 지붕"';
    theme_country_6.innerHTML ="네팔/히말라야";
}else if(themeTag == 8){
    // 동화
    themeName.innerText = "#동화속나라#아이와함께";
    theme_1.style.backgroundImage = "url(/resources/image/free-image/도쿄-야경.jpg)";
    theme_info_1.innerHTML = '"신데렐라의 성" "도쿄 Only 디즈니씨"';
    theme_country_1.innerHTML ="도쿄";

    theme_2.style.backgroundImage = "url(/resources/image/free-image/미국-로스앤젤레스.jpg)";
    theme_info_2.innerHTML = '"라라랜드" "세계 최초의 디즈니랜드" "유니버셜 스튜디오 할리우드"';
    theme_country_2.innerHTML ="로스앤젤레스";

    theme_3.style.backgroundImage = "url(/resources/image/free-image/올랜도-동화.jpg)";
    theme_info_3.innerHTML = '"세계에서 가장 큰 디즈니월드" "유니버셜 스튜디오 플로리다"';
    theme_country_3.innerHTML ="올랜도";

    theme_4.style.backgroundImage = "url(/resources/image/free-image/홍콩-야경.jpg)";
    theme_info_4.innerHTML = '"잠자는 숲속의 공주" "마블덕후" 는 요기';
    theme_country_4.innerHTML ="홍콩";

    theme_5.style.backgroundImage = "url(/resources/image/free-image/오사카-동화.jpg)";
    theme_info_5.innerHTML = '"유니버셜 스튜디오 재팬" #해리포터 #미니언즈';
    theme_country_5.innerHTML ="오사카";

    theme_6.style.backgroundImage = "url(/resources/image/free-image/상하이-디즈니.jpg)";
    theme_info_6.innerHTML = '"아시아 최대 규모 디즈니랜드"';
    theme_country_6.innerHTML ="상하이";

}