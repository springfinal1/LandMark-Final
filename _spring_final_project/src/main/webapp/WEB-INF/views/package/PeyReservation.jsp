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

<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
</head>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<link rel="stylesheet" href="/resources/css/peyment/PeyReservation.css"
	type="text/css">
	<link rel="stylesheet" href="/resources/css/product/product_reservation.css"
	type="text/css">
<title>Home</title>
</head>

<body>
	<c:set value="${ftvo }" var="ftvo"/>
	<div class="main-container">
		
		<div class="left-content">
			<div class="top-content">
				<div class="main-top-top">
					<h2>스케줄</h2>
					<p>
						<span>비행상세</span>
					</p>
				</div>

				<table class="main-top-bottom">
					<colgroup>
						<col style="width: 29%">
						<col style="width: *">
						<col style="width: 15.5%">
						<col style="width: 13.8%">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">항공편</th>
							<th scope="col">여정</th>
							<th scope="col">좌석</th>
							<th scope="col">편명</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<div class="td-top">
									
									<i class="fa-solid fa-plane-departure"></i>
									
									
									<div class="tit-box">
										<p>${ftvo.airlineDep }</p>
									</div>
								</div>
							</td>
							<td>
								<div class="txt_area">
									<div class="k1-kwk-itinerary_box">
										<div class="tit-box">
											<p>인천 ICN</p>
										</div>
										<span class="k1-kwk-ico-arr">
											<i class="fa-solid fa-caret-right" id="air-arrow"></i>
										</span>
										<div class="tit-box">
											<p>${ftvo.arrival } ${ftvo.cityCode }</p>
											
										</div>
									</div>
									<div class="ftvo-div">
										<p class="ftvo-div-p depDay">${ftvo.departureDay }</p>
									</div>
								</div>
							</td>
							<td>
								<div class="txt-area seat-type">${ftvo.seatType }</div>
							</td>
							<td>
								<div class="txt-area flight-id">${ftvo.flightIdDep}</div>
							</td>
						</tr>
					</tbody>
				</table>


				<div class="mid-detail">
					<div class="mid-txt-area2">
						<ul>
							<li>대기예약시 모든 좌석이 확인되어야만, 항공권 구매가 가능합니다.</li>
						</ul>
					</div>
				</div>

				<table class="main-top-bottom">
					<colgroup>
						<col style="width: 29%">
						<col style="width: *">
						<col style="width: 15.5%">
						<col style="width: 13.8%">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">항공편</th>
							<th scope="col">여정</th>
							<th scope="col">좌석</th>
							<th scope="col">편명</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<div class="td-top">
									
									<i class="fa-solid fa-plane-departure"></i>
									
									
									<div class="tit-box">
										<p>${ftvo.airlineArr }</p>
									</div>
								</div>
							</td>
							<td>
								<div class="txt_area">
									<div class="k1-kwk-itinerary_box">
										<div class="tit-box">
											<p>${ftvo.arrival } ${ftvo.cityCode }</p>
										</div>
										<span class="k1-kwk-ico-arr">
											<i class="fa-solid fa-caret-right" id="air-arrow"></i>
										</span>
										<div class="tit-box">
											<p>인천 ICN</p>
											
										</div>
									</div>
									<div class="ftvo-div">
										<p class="ftvo-div-p arrDay">${ftvo.arrivalDay }</p>
									</div>
								</div>
							</td>
							<td>
								<div class="txt-area">${ftvo.seatType }</div>
							</td>
							<td>
								<div class="txt-area">${ftvo.flightIdArr}</div>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="mid-detail">
					<div class="mid-txt-area2">
						<ul>
							<li>대기예약시 모든 좌석이 확인되어야만, 항공권 구매가 가능합니다.</li>
						</ul>
					</div>
				</div>
			</div>




			<div class="mid-content">
				<div class="mid-mid">
					<h2 class="mid-mid-top">탑승객 및 상세요금</h2>
				</div>
				<table class="main-mid-mid">
					<colgroup>
						<col style="width: *%">
						<col style="width: 10%">
						<col style="width: 15%">
						<col style="width: 15%">
						<col style="width: 15%">
					</colgroup>
					<thead>
						<tr>
							<th>도시</th>
							<th>시트타입</th>
							<th>왕복 / 편도</th>
							<th>인원</th>
							<th>합계</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><span>${ftvo.arrival }</span></td>
							<td><span>${ftvo.seatType }</span></td>
							<td><span>${ftvo.flightType }</span></td>
							<td><span class="ft-Peple">${ftvo.ftPeple }</span></td>
							<td><span class="ft-Price">${ftvo.ftPrice }</span></td>
						</tr>
					</tbody>
				</table>


				<div class="mid-mid">
					<h2 class="mid-mid-top">예약자 정보</h2>
				</div>
				<table class="main-mid-mid">
					<colgroup>
						<col style="width: 33%">
						<col style="width: 33%">
						<col style="width: *%">
					</colgroup>
					<thead>
						<tr>
							<th>성명</th>
							<th>휴대폰</th>
							<th>이메일</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><span>${uvo.name }</span></td>
							<td><span>${uvo.phoneNumber }</span></td>
							<td><span>${uvo.email }</span></td>
						</tr>
					</tbody>
				</table>
				<div class="pay-box">
					<ul>
						<li>가입된 이메일 주소와 연락처로 예약관련 이메일과 SMS가 발송됩니다.</li>
						<li>부정확한 정보입력으로 인하여 연락이 불가능할 경우 발생되는 불이익에 대해 당사는 책임지지 않으니 이 점
							유의하시기 바랍니다.</li>
					</ul>
				</div>
			</div>



			

			<div class="bottom-peyment">
				<div class="box">
					<div class="selectBox">
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
				
				<div class="payment-btn">
					<button class="btn-gradient cyan" type="button"
						onclick="requestPay()">
						<span>결제하기</span>
					</button>
				</div>
			</div>

		</div>




	</div>
	
	
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
<script type="text/javascript"
		src="/resources/js/product/reservation.js"></script>
<script type="text/javascript">
	let fTOVO = `<c:out value="${freeTitcketOrderVO}" />`;
	let idVal = `<c:out value="${uvo.id}" />`;
	let gate = `<c:out value="${freeTitcketOrderVO.gate}" />`;
	let airplane = `<c:out value="${freeTitcketOrderVO.airplane}" />`;
	let arrival = `<c:out value="${freeTitcketOrderVO.arrival}" />`;
	let cityCode = `<c:out value="${freeTitcketOrderVO.cityCode}" />`;
	let seatType = `<c:out value="${freeTitcketOrderVO.seatType}" />`;
</script>

<script type="text/javascript"
	src="/resources/js/peyment/PeyReservation.js">
	
</script>

</html>