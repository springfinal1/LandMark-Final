<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>
	<link href="https://fonts.googleapis.com/css2?family=Oxanium:wght@800&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<!-- 메인 역역 -->
	<div class="main-container">
		
		<!-- 메인 슬라이더 -->
		<div class="slider-wrapper">
			<div id="slider" class="slider">
				<div class="items slider-item1">
				<a href="/product/detail?pkNo=2"></a>
					<div class="festival-item">
						<div class="festival-item-txt1">이탈리아 베네치아</div>
						<div class="festival-item-txt2">베니스 가면 축제</div>
						<div class="festival-item-txt3">그리고 아름다운 경치까지!</div>
					</div>
				</div>
				<div class="items slider-item2">
				<a href="/product/detail?pkNo=1"></a>
					<div class="festival-item">
						<div class="festival-item-txt1">스페인 발렌시아</div>
						<div class="festival-item-txt2">라 토마티나 축제</div>
						<div class="festival-item-txt3">신나게 토마토 투척!</div>
					</div>
				</div>
				<div class="items slider-item3">
				<a href="/product/detail?pkNo=6"></a>
					<div class="festival-item">
						<div class="festival-item-txt1">뉴멕시코 앨버커키</div>
						<div class="festival-item-txt2">국제 열기구 축제</div>
						<div class="festival-item-txt3">하늘을 수놓는 열기구는 장관!</div>
					</div>
				</div>
				<div class="items slider-item4">
				<a href="/product/detail?pkNo=4"></a>
					<div class="festival-item">
						<div class="festival-item-txt1">독일 뮌헨</div>
						<div class="festival-item-txt2">옥토버페스트 맥주 축제</div>
						<div class="festival-item-txt3">이날만큼은 실컷 취해도 좋아!</div>
					</div>
				</div>
				<div class="items slider-item5">
				<a href="/product/detail?pkNo=5"></a>
					<div class="festival-item">
						<div class="festival-item-txt1">일본 훗카이도</div>
						<div class="festival-item-txt2">삿포로 눈 축제</div>
						<div class="festival-item-txt3">아름다운 대형 눈조각들을 감상하세요!</div>
					</div>
				</div>
				<div class="items slider-item6">
				<a href="/product/detail?pkNo=7"></a>
					<div class="festival-item">
						<div class="festival-item-txt1">인도 델리</div>
						<div class="festival-item-txt2">홀리 축제</div>
						<div class="festival-item-txt3">봄을 알리는 색체의 향연!</div>
					</div>
				</div>
				<div class="items slider-item7">
				<a href="/product/detail?pkNo=3"></a>
					<div class="festival-item">
						<div class="festival-item-txt1">브라질 리우데자네이루</div>
						<div class="festival-item-txt2">리우 카니발 축제</div>
						<div class="festival-item-txt3">거대한 퍼레이드와 삼바의 매력!</div>
					</div>
				</div>
			</div>
			
			<div class="arrow left-arrow">
				Prev
				<i class="fa-solid fa-chevron-left"></i>
			</div>
			<div class="arrow right-arrow">
				Next
				<i class="fa-solid fa-chevron-right"></i>
			</div>
		</div>
		
		<div class="recommendation-tour-container">
		
			<div class="recommendation-tour-title">
				LANDMARK 추천 여행지!
			</div>
			<div class="recommendation-tour-box" id="select-image">
			
				<div class="recommendation-items">
					<div>
						<div class="recommendation-txt">
							여행작가의 추천
						</div>
						<div class="recommendation-txt2">
							지금 가장 사랑받는 여행지,<br>
							이렇게 즐겨보세요.
						</div>
					</div>
				</div>
				
				<div class="recommendation-items item-list">
					<a href="/static/list?num=1"></a>
					<div class="text-box">
						<div class="recommendation-txt">
							#VOL.1
						</div>
						<div class="recommendation-txt2">
							독일의 겨울이 가장 아름다운 도시, 드레스덴
						</div>
					</div>
				</div>
				
				<div class="recommendation-items item-list">
					<a href="/static/list?num=2"></a>
					<div class="text-box">
						<div class="recommendation-txt">
							#VOL.2
						</div>
						<div class="recommendation-txt2">
							불가사의한 아름다움, 이집트의 유적들
						</div>
					</div>
				</div>
				
				<div class="recommendation-items item-list">
					<a href="/static/list?num=3"></a>
					<div class="text-box">
						<div class="recommendation-txt">
							#VOL.3
						</div>
						<div class="recommendation-txt2">
							황금의 나라, 라오스의 사원들
						</div>
					</div>
				</div>
				
			</div>
		</div>
		
		<div class="sub-slider-wrapper-container">
			<div class="sub-slider-title">
				가장 사랑받는 월간 Best 여행지
			</div>
			<div class="sub-slider-wrapper">
				<div id="subSlider" class="sub-slider">
					<div class="sub-items sub-slider-item1">
						<div class="item-label">1 위</div>
						<div class="item-title">
							<span class="item-city">오사카</span>
							<span class="item-contents">#고베야경#교토일주</span>
						</div>
						<div class="item-country">Japan</div>
					</div>
					<div class="sub-items sub-slider-item2">
						<div class="item-label">2 위</div>
						<div class="item-title">
							<span class="item-city">방콕</span>
							<span class="item-contents">#카오산로드#주말시장#왓프라깨우사원</span>
						</div>
						<div class="item-country">Thailand</div>
					</div>
					<div class="sub-items sub-slider-item3">
						<div class="item-label">3 위</div>
						<div class="item-title">
							<span class="item-city">후쿠오카</span>
							<span class="item-contents">#포장마차#먹방#야키토리</span>
						</div>
						<div class="item-country">Japan</div>
					</div>
					<div class="sub-items sub-slider-item4">
						<div class="item-label">4 위</div>
						<div class="item-title">
							<span class="item-city">칸쿤</span>
							<span class="item-contents">#마켓28#골프코스#토르투가비치</span>
						</div>
						<div class="item-country">Mexico</div>
					</div>
					<div class="sub-items sub-slider-item5">
						<div class="item-label">5 위</div>
						<div class="item-title">
							<span class="item-city">베니스</span>
							<span class="item-contents">#그랜드캐널#산마크코대성당#산마크코광장</span>
						</div>
						<div class="item-country">Italy</div>
					</div>
					<div class="sub-items sub-slider-item6">
						<div class="item-label">6 위</div>
						<div class="item-title">
							<span class="item-city">상해</span>
							<span class="item-contents">#와이탄#동방명주타워#난징거리</span>
						</div>
						<div class="item-country">China</div>
					</div>
					<div class="sub-items sub-slider-item7">
						<div class="item-label">7 위</div>
						<div class="item-title">
							<span class="item-city">프라하</span>
							<span class="item-contents">#프라하성#천문시계#카를교#바츨라프광장</span>
						</div>
						<div class="item-country">Czech Republic</div>
					</div>
				</div>
				<div class="arrow sub-left-arrow">
					<i class="fa-solid fa-arrow-left"></i>
				</div>
				<div class="arrow sub-right-arrow">
					<i class="fa-solid fa-arrow-right"></i>
				</div>
				
			</div>
		</div>
		
	</div>
	
	<!-- 회원가입 완료시 모달창 오픈 -->
	<div class="join-background">
		<div class="join-modal">
			<span class="material-symbols-outlined" id="confirm-btn">close</span>
			<span class="modal-text"></span>
			<span><button type="button" id="confirm-btn">확인</button></span>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
		
</body>
<script type="text/javascript" src="/resources/js/slider.js"></script>
<script type="text/javascript" src="/resources/js/subSlider.js"></script>
<script type="text/javascript" src="/resources/js/recommendation.js"></script>
<script type="text/javascript">
	let msg = `<c:out value="${message}" />`;
	let joinID = `<c:out value="${joinID}" />`;
	let success = `<c:out value="${success}" />`;
	if(success == '1'){
		alert("문의사항 등록");
	}
	let item = document.querySelector('.items');
	console.log(item.scrollWidth);
	slider('slider');
	subSlider('sub-slider');
</script>
<script type="text/javascript" src="/resources/js/user/join.js"></script>
</html>