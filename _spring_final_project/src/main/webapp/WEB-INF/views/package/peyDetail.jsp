<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<title>랜드마크</title>

<link rel="stylesheet" href="/resources/css/peyment/peymentDetail.css">

<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<style>
body, h1, h2, h3, h4, h5, h6, p, span {
	font-family: 'Noto Sans KR', sans-serif !important;
}
</style>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<title>Home</title>
</head>
<!-- <link rel="stylesheet" href="/resources/css/peyment/user-number.css"> -->
<body>


	<c:set value="${pldto.packvo }" var="packvo" />
	<c:set value="${pldto.pfList }" var="pfList" />
	<c:set value="${pldto.avo }" var="avo" />
	<c:set value="${pldto.hvo }" var="hvo" />
	<c:set value="${pldto.fvo }" var="fvo" />
	<c:set value="${pldto.plvo }" var="plvo" />





	<div class="main-container">

		<div class="main-top">
			<div class="main-top-head">
				<h2>결제하기</h2>
			</div>
			<div class="main-reserve">
				<h2>상품 정보</h2>
			</div>
			<div class="main-mid">
				<div class="table-type-top">
					<table id="tourInfoTable">
						<tbody>
							<tr>
								<th>아이디</th>
								<td><span>${uvo.id}</span></td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td><span>${uvo.phoneNumber}</span></td>
							</tr>
							<tr>
								<th>주소</th>
								<td><span>${uvo.address}</span></td>
							</tr>
							<tr>
								<th>이메일</th>
								<td><span>${uvo.email}</span></td>
							</tr>
							<tr>
								<th>맴버쉽</th>
								<td><span>${memShp.grade}</span></td>
							</tr>
						</tbody>
					</table>
					<div class="item-img-div">
						<c:forEach items="${pldto.pfList }" var="pfList">
							<img class="item-img"
								src="/product_upload/${fn:replace(pfList.pfSaveDir,'-','/')}/${pfList.pfUuid}_${pfList.pfName}">
						</c:forEach>
					</div>
				</div>


				<div class="main-mid"></div>
				<div class="event-box">
					<div class="user-event-box">
						<h3 class="user-nmuber-top">할인 수단 선택</h3>
					</div>
					<div class="product-amout">
						<span> 사용 가능 포인트 </span> 
						<div>
							<span id="PointValue">
								${memShp.point}</span><span>P</span>
						</div>
					</div>
					<div class="use-point-input">
						<input type="text" id="point-input" placeholder="사용하실 포인트를 적어주세요">
						<button type="button" class="cupon-button" onclick="applyPoint()">포인트
							할인</button>
					</div>

					<div class="product-amout">
						<span> 맴버쉽 할인</span> 
						<div>
							<span id="memberDiscountPrice">
								${memberDiscountPrice}</span><span>원</span>
						</div>
					</div>
					<div class="product-amout">
						<span> 포인트 할인</span>
						<div>
							<span id="endPoint"> - </span>
							<span>P</span>
						</div>
					</div>
					<div class="product-amout">
						<span> 최종금액</span>
						<div>
							<span id="endPrice">${lastTotalCount}</span><span>원</span>
						</div>
					</div>
				</div>

			</div>

			<div class="box-left">
				<div class="box">
					<div class="select-Box">
						<button class="label">결제수단 선택 <i class="fa-solid fa-caret-down" id="pay-button-arrow"></i></button>
						<ul class="optionList" id="paymentMethod">
							<li class="optionItem" value="kakaopay" data-v-16d1a795>카카오페이</li>
							<li class="optionItem" value="tosspay">토스</li>
							<li class="optionItem" value="html5_inicis">KG이니시스</li>
							<li class="optionItem" value="payco">페이코</li>
							<li class="optionItem" value="settle">핵토파이낸셜</li>
							<li class="optionItem" value="daou">키움페이</li>
						</ul>

					</div>

				</div>
				<button class="btn-gradient cyan" type="button"
					onclick="requestPay()">
					<span>결제하기</span>
				</button>
			</div>

			<div class="main-bottom">



				<div class="panel-item">
					<div class="tit">
						<h2 class="main-item">항공권 예약 내역</h2>
					</div>
					<div class="banner-box">
						<div class="text-head">
							항공권을 예약하신 고객께서는 <img class="aa"
								src="https://www.kyowontour.com/images/emoji/emoji-airplane-departure02.svg"
								alt="" style="width: 70px;"> 마이페이지에서 확인이 가능합니다.
						</div>
						<div>
							<a href="/user/detail"><button type="button" class="btn-gradient-bottom">
									<span>마이페이지</span>
								</button></a>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
<script type="text/javascript">
	let pldto = `<c:out value="${packvo}" />`;
	let userA = `<c:out value="${uvo}" />`;
	let userC = `<c:out value="${userCount}" />`;
	let pppp = `<c:out value="${memShp}"/>}`
	let totalPrice = `<c:out value="${memberPrice}"/>}`
</script>

<script type="text/javascript"
	src="/resources/js/peyment/userPayment.js">
	
</script>
</html>