<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Dhurjati&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/help/help.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<div class="customerCenter-container">
		<h1>고객센터</h1>

		<div class="faq-container">
			<div>
				<h2>자주하는 질문
					<a href="/help/register"><i class="fa-regular fa-comments"></i>1:1문의</a>
				</h2>
				
			</div>
			<div class="faq-list-item">
				<div class="q-area">
					<div class="faq-q">Q</div>
					<div>결제문의</div>
					<div>포인트는 어떻게 사용하나요?</div>
					<div><i class="fa-solid fa-angle-down" id="arrowDown"></i></div>
				</div>
				<div class="a-area">
					<div class="faq-a">A</div>
					<div>
						<div>LANDMARK에서는 포인트를 예약시 사용할 수 있습니다.</div>
						<div>결제시 보유 포인트 중 사용하실 포인트만큼 차감 후 결제하실 수 있습니다.</div>
					</div>
				</div>
			</div>
			<div class="faq-list-item">
				<div class="q-area">
					<div class="faq-q">Q</div>
					<div>결제문의</div>
					<div>예약 취소 후 포인트는 어떻게 되나요?</div>
					<div><i class="fa-solid fa-angle-down" id="arrowDown"></i></div>
				</div>
				<div class="a-area">
					<div class="faq-a">A</div>
					<div>
						<div>예약 취소시 포인트는 결제 시 사용하신 만큼 보유 포인트로 합산 됩니다. </div>
					</div>
				</div>
			</div>
			<div class="faq-list-item">
				<div class="q-area">
					<div class="faq-q">Q</div>
					<div>기타문의</div>
					<div>관심상품은 어떻게 등록하나요?</div>
					<div><i class="fa-solid fa-angle-down" id="arrowDown"></i></div>
				</div>
				<div class="a-area">
					<div class="faq-a">A</div>
					<div>
						<div>관심상품 등록은 회원가입 후 이용할 수 있습니다.</div>
						<div>상품 상세 페이지 또는</div>
						<div>상품 목록 페이지에서 등록할 수 있습니다.</div>
					</div>
				</div>
			</div>
			<div class="faq-list-item">
				<div class="q-area">
					<div class="faq-q">Q</div>
					<div>상품문의</div>
					<div>패키지여행에 포함되어 있는 서비스는 무었인가요?</div>
					<div><i class="fa-solid fa-angle-down" id="arrowDown"></i></div>
				</div>
				<div class="a-area">
					<div class="faq-a">A</div>
					<div>
						<div>패키지여행에는 다음과 같은 내용이 포함되어 있습니다.</div>
						<br>
						<div>1. 왕복 항공권</div>
						<div>2. 호텔 및 조식 이용권</div>
						<div>3. 패키지의 포함된 축제 참여 안내 및 지원</div>
						<div>4. 저녁 식사 제공</div>
					</div>
				</div>
			</div>
			<div class="faq-list-item">
				<div class="q-area">
					<div class="faq-q">Q</div>
					<div>상품문의</div>
					<div>패키지여행 일정에 '자유 일정'이 있는데 그때는 무엇을 하나요?</div>
					<div><i class="fa-solid fa-angle-down" id="arrowDown"></i></div>
				</div>
				<div class="a-area">
					<div class="faq-a">A</div>
					<div>
						<div>자유 일정 동안에는 인솔자나 가이드가 동반하지 않으며 고객님께서 원하시는 관광지를 개별적으로 자유롭게 관광하시면 됩니다.</div>
						<div>대부분의 자유일정에는 원하시는 고객님을 대상으로 선택 관광 프로그램이 구비되어 있으니,</div>
						<div>선택 관광을 이용하시면 가이드를 통한 관광이 가능합니다.</div>
					</div>
				</div>
			</div>
			<div class="checklist">
				<h3>확인사항</h3>
				<ul>
					<li>다른 궁금하신 사항은 <strong>1:1문의</strong>를 이용해 주세요.</li>
					<li>문의 내역은 <strong>마이페이지</strong>에서 확인 가능합니다.</li>
				</ul>
			</div>
		</div>

	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
<script type="text/javascript" src="/resources/js/help/customerCenter.js"></script>
</html>