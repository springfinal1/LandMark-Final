<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/freetour/freetour-air.css">
<link rel="stylesheet" href="/resources/css/freetour/calendar.css">

<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<!-- 필요한거 출발일 / 도착일 / 왕복,편도 / 좌석(일반 비즈니스 일등석 프리미엄) -->
	

	
	<div class="air-all-container">
		<div class="air-reservation-div"> <!--  배경   -->
		
			<div class="trip-place-information"><!-- 배경에 맞는 설명 -->		
			</div>

			
			<div class="air-reservation-info"> <!-- 위치 가운데로잡는 div -->
			
				<form action="/freetour/city" method="post">
					<div class="air-info">	
						<div class="air-tranport">
							<div class="air-operation-info">
								<a href="#" role="button" id="roundTrip" class="trip-operation freeChecked">왕복</a>
								<a href="#" role="button" id="oneWay" class="trip-operation">편도</a>
								<input type="hidden" name="verification" value="왕복" class="hiddenVerification"> 
							</div>

						</div>
						
						<div>
							<ul class="travel-info">
								<li>
									<input type="text" value="인천" class="departure" name="departure"> <!-- 출발지 -->
								</li>
								<li>
									<!-- <i class="fa-solid fa-repeat" id="transformation"></i> -->
									<span class="material-symbols-outlined">chevron_right</span>
								</li>
								<li>
									<input type="text" value="도착지" class="arrival" name="arrival"> <!-- 도착지 -->
								</li>
								<li>
									<!-- 출발일자 / 도착일자 -->
									<a href="#" class="cal-Btn" id="cal" >	
										<i class="fa-regular fa-calendar"></i>
										<input type="text" name="date" value="날짜를 입력해주세요" class="cal-input">					
	        						</a>
								</li>
							</ul>
							<div class="travel-peple-count">
							
								<div>
									<span class="trip-peple-count">여행인원</span>
									<div>
										<input type="text" class="pepleCount-input peple-count" name="pepleCount" value="성인1 ,일반석" readonly="readonly"> <!-- 성인 -->
										<input type="hidden" name="peple" value="1" id="hiddenPeple">
										<input type="hidden" name="seat" value="일반석" id="hiddenSeat">
									</div>
								</div>
								
								
									<span class="search-btn">검색</span>
									<button type="submit" class="sub-but"></button>
								
							</div>
						</div>
						
						<div>
							<div class="image-div">
								
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		
		<div class="themeTravel"> <!-- 테마 여행지 -->
			<h3>나만의 맞춤 테마 여행지를 <br> 확인해보세요</h3>
			<ul> 
				<li>
					<a href="/freetour/theme?type=1">
						<img class="themeImg" src="/resources/image/list-image/신혼여행.jpg">
						<span>#신혼여행#커플여행#허니문</span>
					</a>
				</li>
				<li>
					<a href="/freetour/theme?type=2">
						<img class="themeImg" src="/resources/image/list-image/영화.jpg">
						<span>#드라마명소#영화촬영지</span>
					</a>
				</li>
				<li>
					<a href="/freetour/theme?type=3">
						<img class="themeImg" src="/resources/image/list-image/온천.jpg">
						<span>#겨울왕국#스키#보드</span>
					</a>
				</li>
				<li>
					<a href="/freetour/theme?type=4">
						<img class="themeImg" src="/resources/image/list-image/서핑.jpg">
						<span>#서핑명소#다이빙#물놀이</span>
					</a>
				</li>
				<li>
					<a href="/freetour/theme?type=5">
						<img class="themeImg" src="/resources/image/list-image/야경.jpg">
						<span>#아경맛집#감성뿜뿜</span>
					</a>
				</li>
				<li>
					<a href="/freetour/theme?type=6">
						<img class="themeImg" src="/resources/image/list-image/오로라.jpg">
						<span>#오로라#밤하늘댄서</span>
					</a>
				</li>
				<li>
					<a href="/freetour/theme?type=7">
						<img class="themeImg" src="/resources/image/list-image/등산.jpg">
						<span>#등산#히말라야#버킷리스트</span>
					</a>
				</li>
				<li>
					<a href="/freetour/theme?type=8">
						<img class="themeImg" src="/resources/image/list-image/동화.jpg">
						<span>#동화속나라#아이와함께</span>
					</a>
				</li>
			</ul>
		</div>
	</div>
	
	
	
	<!-- 여행지 오픈 모달 -->
	<div>
		
	</div>
	
	
	
	<!-- 인원수 체크 모달-->
	<div class="peple-modal-container">
		<div class="modal-close">
			<span class="material-symbols-outlined closebtn">close</span>	
		</div>
		<div class="peple-modal-sub-container">
			<div class="peple-info">
				<div class="peple-count-input">
					<p>탑승객 <input class="pepleAllCount" value="1" readonly="readonly"> 명</p><!-- 숫자 늘어나게 -->
					<ul>
						<li class="fisrt-li">
							<p>성인</p>
							<p class="age">만 12세 이상</p>
							<div class="peple-countroller">
								<button class="adult-minus-btn">
									<span class="material-symbols-outlined" id="adult-remove">remove</span>
								</button>
								
								<input type="text" class="peple-input-text" value="1" id="adult-count"> 
								
								<button class="adult-plus-btn">
									<span class="material-symbols-outlined" id="adult-add">add</span>
								</button>
							</div>
						</li>
						<li	class="second-li">
							<p>소아</p>
							<p class="age">만 12세 미만</p>
							<div>
								<button class="child-minus-btn">
									<span class="material-symbols-outlined" id="child-remove">remove</span>
								</button>
								
								<input type="text" class="peple-input-text" value="0" id="child-count"> 
								
								<button class="child-plus-btn">
									<span class="material-symbols-outlined" id="child-add">add</span>
								</button>
							</div>
						</li>
						<li class="third-li">
							<p>유아</p>
							<p class="age">24개월 미만</p>
							<div>
								<button class="infant-minus-btn">
									<span class="material-symbols-outlined" id="infant-remove">remove</span>
								</button>
								
								<input type="text" class="peple-input-text" value="0" id="infant-count"> 
								
								<button class="infant-plus-btn">
									<span class="material-symbols-outlined" id="infant-add">add</span>
								</button>
							</div>
						</li>
					</ul>
				</div>
				<div class="peple-seat-btn">
					<p>좌석선택</p>
					<ul class="seat-choice">
						<li class="regular-seat seat">일반석</li>
						<li class="premium-seat seat">프리미엄 일반석</li>
						<li class="business-seat seat">비즈니스석</li>
						<li class="firstclass-seat seat">일등석</li>
					</ul>
				</div>
			</div>
			<hr>
			<div class="peple-footer">
				<p>탑승객은 총 9명까지 선택할 수 있고 , 만 2세미만 유아의 경우 좌석이 없으며 성인은 반드시 포함 되어야 합니다</p>
				<button class="peple-footer-button">확인</button>
			</div>
		</div>
	</div>
	
	<!-- 여행지 모달 -->
	<div class="trip-place-container">
	
		<div class="trip-place-header">
			<span class="arrDepcheck">출발지</span>
			<span class="material-symbols-outlined place-close">close</span>
		</div>
		
		<div class="trip-place-body">
			<div class="trip-place-search">
				<div class="trip-place-input">
					<input type="text" placeholder="도시명을 입력하세요" class="search-place-input">
					<a href="#" class="trip-place-xbtn"> <span class="material-symbols-outlined place-close" id="tripCloseBtn">close</span> </a>
				</div>
				<div class="trip-place-button">
					<button>
						<span class="search-place-button">검색</span>					
					</button>
				</div>
			</div>
		</div>
			
		<div class="trip-place-city">
			<div class="search-result"> <!-- 최근검색 -->
				<strong>최근검색</strong>
			</div>
			<div class="search-content"> 
				<ul class="trip-place-ul">
					<li class="place-margin">
						<strong class="continent">국내</strong>
						<ul>
							<li class="city">인천</li>
							<li class="city">서울</li>
							<li class="city">김포</li>
							<li class="city">제주</li>
							<li class="city">부산</li>
							<li class="city">대구</li>
							<li class="city">청주</li>
						</ul>
					</li>
					<li class="place-margin">
						<strong class="continent">아시아</strong>
						<ul>
							<li class="city">코타키나발루</li>
							<li class="city">싱가포르</li>
							<li class="city">방콕</li>
							<li class="city">다낭</li>
							<li class="city">홍콩</li>
							<li class="city">씨엠립</li>
							<li class="city">타이페이</li>
						</ul>
					</li>
					<li class="place-margin">
						<strong class="continent">일본</strong>
						<ul>
							<li class="city">도쿄/하네다</li>
							<li class="city">도쿄/나리타</li>
							<li class="city">오사카/간사이</li>
							<li class="city">후쿠오카</li>
							<li class="city">오키나와</li>
							<li class="city">삿포로</li>
							<li class="city">나고야</li>
						</ul>
					</li>
					<li class="place-margin">
						<strong class="continent">중국</strong>
						<ul>
							<li class="city">베이징/다싱</li>
							<li class="city">상하이/푸동</li>
							<li class="city">대련</li>
							<li class="city">연길</li>
							<li class="city">하얼빈</li>
							<li class="city">심양</li>
						</ul>
					</li>
					<li class="place-margin">
						<strong class="continent">유럽</strong>
						<ul>
							<li class="city">부다페스트</li>
							<li class="city">런던</li>
							<li class="city">파리</li>
							<li class="city">로마</li>
							<li class="city">푸랑크푸르트</li>
							<li class="city">바르셀로나</li>
							<li class="city">프라하</li>
						</ul>
					</li>
					<li class="place-margin">
						<strong class="continent">미주/중남미</strong>
						<ul>
							<li class="city">로스앤젤레스</li>
							<li class="city">뉴욕</li>
							<li class="city">샌프란시스코</li>
							<li class="city">하와이/호놀롤루</li>
							<li class="city">칸쿤</li>
							<li class="city">리마</li>
						</ul>
					</li>
					<li class="place-margin">
						<strong class="continent">대양주/기타</strong>
						<ul>
							<li class="city">시드니</li>
							<li class="city">멜버른</li>
							<li class="city">오클랜드</li>
							<li class="city">괌</li>
							<li class="city">사이판</li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
		<div class="result-search"> <!-- 검색내용 -->
			
		</div>	
	</div>


	<div class="cal-container">
		<div class="cal-sub-container">
			<div class="subdiv-one">
				<span>일정</span>
				<span class="material-symbols-outlined place-close" id="calCloseBtn">close</span>
			</div>
			
			<div class="div-prev-next">
				<div class="div-prev">
					<span class="material-symbols-outlined prevBtn" id="prevBtn" onClick="prevCalendar();">chevron_left</span> <!-- 이전달 -->
				</div>

				<div class="div-next">
					<span class="material-symbols-outlined nextBtn" id="nextBtn" onClick="nextCalendar();">navigate_next</span> <!-- 다음달 -->
				</div>
			</div>
			
			 <div class="calendar-div">
			 
			 	<div>
				 	<div class="yearMonth">
			            <span id="calYear"></span>년
			            <span id="calMonth"></span>월
			        </div>   
			            
			        <table class="Calendar">
			        
			            <thead>
			                <tr>
			                    <td class="sunday">일</td>
			                    <td>월</td>
			                    <td>화</td>
			                    <td>수</td>
			                    <td>목</td>
			                    <td>금</td>
			                    <td class="saturday">토</td>
			                </tr>
			            </thead>
			
			            <tbody>
			            </tbody>
			        </table>
		        </div>
		        
		        <div>
			        <div class="yearMonth">
			            <span id="calYear2"></span>년
			            <span id="calMonth2"></span>월
			        </div>
			                        
			        <table class="Calendar2">
			            <thead>
			                <tr>
			                    <td class="sunday">일</td>
			                    <td>월</td>
			                    <td>화</td>
			                    <td>수</td>
			                    <td>목</td>
			                    <td>금</td>
			                    <td class="saturday">토</td>
			                </tr>
			            </thead>
			
			            <tbody>
			            </tbody>
			        </table>
		        </div>
		        
    		</div>
    		<div class="cal-init-btn">
    			<button class="cal-init" id="cal-init">적용</button>
    		</div>
		</div>
	</div>

	<div></div>










	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	

<script type="text/javascript" src="/resources/js/freetour/freetour-air.js"></script>
<script type="text/javascript">
randomImage();
</script>
<script  type="text/javascript" src="/resources/js/freetour/calendar.js"></script>

</body>
</html>