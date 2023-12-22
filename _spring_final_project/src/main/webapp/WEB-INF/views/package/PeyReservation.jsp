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
<title>Home</title>
</head>

<body>

	<div class="main-container">

		<div class="left-content">
			<div class="top-content">
				<div class="main-top-top">
					<h2>스케줄</h2>
					<p>
						<span>비행상세</span>
					</p>
				</div>
				<div class="main-top-mid">
					<div class="main-top-mid-content2">
						<p class="plan">인천 ICN</p>
						<span class="mid-content-icon"> </span>
						<p class="plan">도쿄 NRT</p>
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
							<th scope="col">좌석등급</th>
							<th scope="col">무료수하물</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<div class="td-top">
									<img
										src="https://air.kyowontour.com/air/wfw/imgs/mbl/logo/air/KE.png"
										alt="KE" class="k1-air-logo">
									<div class="tit-box">
										<p>대한항공 705편</p>
									</div>
								</div>
							</td>
							<td>
								<div class="txt_area">
									<div class="k1-kwk-itinerary_box">
										<div class="tit-box">
											<p>인천 ICN</p>
											<p>시간~</p>
										</div>
										<span class="k1-kwk-ico-arr"><img
											src="https://air.kyowontour.com/air/imgs_ibe/b2c/24_Oneway_arr_ico@2x.png"></span>
										<div class="tit-box">
											<p>인천 ICN</p>
											<p>시간~</p>
										</div>
									</div>
								</div>
							</td>
							<td>
								<div class="txt-area">일반석</div>
							</td>
							<td>
								<div class="txt-area">1개</div>
							</td>
						</tr>
					</tbody>
				</table>


				<div class="mid-detail">
					<div class="mid-txt-area">
						<span>총 소요시간</span>

					</div>
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
							<th scope="col">좌석등급</th>
							<th scope="col">무료수하물</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<div class="td-top">
									<img
										src="https://air.kyowontour.com/air/wfw/imgs/mbl/logo/air/KE.png"
										alt="KE" class="k1-air-logo">
									<div class="tit-box">
										<p>대한항공 705편</p>
									</div>
								</div>
							</td>
							<td>
								<div class="txt_area">
									<div class="k1-kwk-itinerary_box">
										<div class="tit-box">
											<p>인천 ICN</p>
											<p>시간~</p>
										</div>
										<span class="k1-kwk-ico-arr"><img
											src="https://air.kyowontour.com/air/imgs_ibe/b2c/24_Oneway_arr_ico@2x.png"></span>
										<div class="tit-box">
											<p>인천 ICN</p>
											<p>시간~</p>
										</div>
									</div>
								</div>
							</td>
							<td>
								<div class="txt-area">일반석</div>
							</td>
							<td>
								<div class="txt-area">1개</div>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="mid-detail">
					<div class="mid-txt-area">
						<span>총 소요시간</span>

					</div>
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
							<td><span>${freeTitcketOrderVO.arruvalDay }</span></td>
							<td><span>${freeTitcketOrderVO.seatType }</span></td>
							<td><span>${freeTitcketOrderVO.flightType }</span></td>
							<td><span>${freeTitcketOrderVO.ftPeple }</span></td>
							<td><span>${freeTitcketOrderVO.ftPrice }</span></td>
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
							<td><span>이성훈</span></td>
							<td><span>010-7441-5488</span></td>
							<td><span>fecd119@naver.com</span></td>
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



			<div class="bottom-content">
				<div class="reservation-agree">
					<div class="reservation-agree-strong">
						<strong>약관동의</strong>
					</div>

					<div class="reservation-agree-span">
						<i class="fa-solid fa-check all-check" id="icon-check"></i><span
							class="all-agree-span">약관 전체 동의</span> <span
							class="all-agree-span2">약관 전문을 모두 동의 하셔야 예약이 완료됩니다.</span>
					</div>

					<div class="reservation-agree-div">
						<div class="reservation-agree-checklist">
							<div>
								<i class="fa-solid fa-check all-check select-check"
									id="check-btn1"></i> <span class="reservation-agree-check">특별약관
									설명 및 확인 (필수)</span>
							</div>
							<span> <a href="#" class="reservation-agree-content">내용보기</a>
							</span>
						</div>

						<div class="reservation-agree-checklist">
							<div>
								<i class="fa-solid fa-check all-check select-check"
									id="check-btn2"></i> <span class="reservation-agree-check">약관동의
									(필수)</span>
							</div>
							<span> <a href="#" class="reservation-agree-content">내용보기</a>
							</span>
						</div>

						<div class="reservation-agree-checklist">
							<div>
								<i class="fa-solid fa-check all-check select-check"
									id="check-btn3"></i> <span class="reservation-agree-check">개인정보
									수집 및 이용동의 (필수)</span>
							</div>
							<span> <a href="#" class="reservation-agree-content">내용보기</a>
							</span>
						</div>

						<div class="reservation-agree-checklist">
							<div>
								<i class="fa-solid fa-check all-check select-check"
									id="check-btn4"></i> <span class="reservation-agree-check">개인정보
									3자 제공 (필수)</span>
							</div>
							<span> <a href="#" class="reservation-agree-content">내용보기</a>
							</span>
						</div>

						<div class="reservation-agree-checklist">
							<div>
								<i class="fa-solid fa-check all-check select-check"
									id="check-btn5"></i> <span class="reservation-agree-check">고유식별정보
									수집안내 (필수)</span>
							</div>
							<span> <a href="#" class="reservation-agree-content">내용보기</a>
							</span>
						</div>

					</div>
					<div class="agree-span">
						<span class="material-symbols-outlined">error</span> <span>개인정보의
							수집, 제공 및 활용에 동의하지 않을 권리가 있으며, 미동의 시 여행서비스의 제공이 제한됩니다.</span>
					</div>
				</div>
			</div>

			<div class="bottom-peyment">
				<div class="box">
					<div class="selectBox">
						<button class="label">결제수단 선택</button>
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

		</div>




	</div>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

<script type="text/javascript">
	let fTOVO = `<c:out value="${freeTitcketOrderVO}" />`;
</script>

<script type="text/javascript"
	src="/resources/js/peyment/PeyReservation.js">
	
</script>
</html>