<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="/resources/css/product/product_reservation.css">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>


	<c:set value="${pldto.packvo }" var="packvo" />
	<c:set value="${pldto.pfList }" var="pfList" />
	<c:set value="${pldto.avo }" var="avo" />
	<c:set value="${pldto.hvo }" var="hvo" />
	<c:set value="${pldto.fvo }" var="fvo" />
	<c:set value="${pldto.plvo }" var="plvo" />

	<!-- 최종 합계금액, 국적 , 비행 -->
	<div class="product-container">
		<div class="sub-container">
			<div class="reservation-title">
				<strong>상품 예약하기</strong>
				<p>예약하시면 빠른 시간 내에 담당 직원이 연락 드리겠습니다.</p>
			</div>

			<div class="reservation-info">
				<div class="reservation-info-div">
					<div class="reservation-info-div-img">
						<c:forEach items="${pfList }" var="flist">
							<img class="reservation-img" alt="그림없음"
								src="/product_upload/${fn: replace(flist.pfSaveDir,'\\','/')}/${flist.pfUuid }_${flist.pfName}">
						</c:forEach>
					</div>
					<div class="reservation-info-div-text">
						<div>
							<strong>상품명</strong>
							<div>${packvo.pkName }</div>
						</div>
						<div>
							<strong>가격</strong>
							<div>
								<fmt:formatNumber value="${packvo.pkPrice}" pattern="#,###" />
								원
							</div>
						</div>
						<div>
							<strong>출발/도착일</strong>
							<div>${avo.apArrival }~ ${avo.apDeparture }</div>
						</div>
					</div>
				</div>

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
							<span> <a class="reservation-agree-content" id="modal-open-1">내용보기</a>
							</span>
						</div>

						<div class="reservation-agree-checklist">
							<div>
								<i class="fa-solid fa-check all-check select-check"
									id="check-btn2"></i> <span class="reservation-agree-check">약관동의
									(필수)</span>
							</div>
							<span> <a class="reservation-agree-content" id="modal-open-2">내용보기</a>
							</span>
						</div>

						<div class="reservation-agree-checklist">
							<div>
								<i class="fa-solid fa-check all-check select-check"
									id="check-btn3"></i> <span class="reservation-agree-check">개인정보
									수집 및 이용동의 (필수)</span>
							</div>
							<span> <a class="reservation-agree-content" id="modal-open-3">내용보기</a>
							</span>
						</div>

						<div class="reservation-agree-checklist">
							<div>
								<i class="fa-solid fa-check all-check select-check"
									id="check-btn4"></i> <span class="reservation-agree-check">개인정보
									3자 제공 (필수)</span>
							</div>
							<span> <a class="reservation-agree-content" id="modal-open-4">내용보기</a>
							</span>
						</div>

						<div class="reservation-agree-checklist">
							<div>
								<i class="fa-solid fa-check all-check select-check"
									id="check-btn5"></i> <span class="reservation-agree-check">고유식별정보
									수집안내 (필수)</span>
							</div>
							<span> <a class="reservation-agree-content" id="modal-open-5">내용보기</a>
							</span>
						</div>

					</div>
					<div class="agree-span">
						<span class="material-symbols-outlined">error</span> <span>개인정보의
							수집, 제공 및 활용에 동의하지 않을 권리가 있으며, 미동의 시 여행서비스의 제공이 제한됩니다.</span>
					</div>
				</div>

				<div class="reservation-information">
					<div class="reservation-information-div-strong">
						<strong class="reservation-information-strong">예약 정보</strong>
					</div>
					<div class="reservation-information-div">
						<table class="reservation-information-table">
							<tr>
								<th class="reservation-information-table-th">상품명</th>
								<td class="reservation-information-table-td">${packvo.pkName }</td>
							</tr>
							<tr>
								<th class="reservation-information-table-th">여행기간</th>
								<td class="reservation-information-table-td">출발
									${avo.apArrival } → 도착 ${avo.apDeparture }</td>

							</tr>
							<tr>
								<th class="reservation-information-table-th">금액</th>
								<td class="reservation-information-table-td"><fmt:formatNumber
										value="${packvo.pkPrice}" pattern="#,###" /> 원</td>
							</tr>
							<tr>
								<th class="reservation-information-table-th">마일리지 적립비율</th>
								<td class="reservation-information-table-td">4</td>
							</tr>
						</table>
					</div>
				</div>

				<div class="reservation-peple-div">
					<div class="reservation-peple-strong">
						<strong>예약자 정보</strong>
					</div>
					<div class="reservation-peple-info">
						<table class="reservation-peple-info-table">
							<tr>
								<th class="reservation-peple-info-table-th">예약자명</th>
								<td class="reservation-peple-info-table-td"><strong>${uvo.name}</strong></td>
							</tr>
							<tr>
								<th class="reservation-peple-info-table-th">휴대폰 번호</th>
								<td class="reservation-peple-info-table-td"><strong>${uvo.phoneNumber}</strong></td>
							</tr>
							<tr>
								<th class="reservation-peple-info-table-th">이메일</th>
								<td class="reservation-peple-info-table-td"><strong>${uvo.email}</strong></td>
							</tr>
						</table>
					</div>
				</div>

				<div class="reservation-trip-inpo">
					<div class="reservation-footer-strong">
						<strong>여행자 정보</strong>
					</div>

					<div class="reservation-peple-price">
						<table>
							<tr>
								<th class="reservation-peple-price-th">인원</th>
								<td class="reservation-peple-price-td">
									<div class="reservation-peple-count">
										<button type="button" id="minus-btn">-</button>
										<input type="text" readonly="readonly" class="peple-input"
											id="peple-input" value="${peplecount }">
										<button type="button" id="plus-btn">+</button>
									</div>
								</td>
							</tr>
							<tr>
								<th class="reservation-peple-price-th">최종 합계금액</th>
								<td class="reservation-peple-price-td">
									<div>
										<input type="text" value="${0}"
											readonly="readonly" id="reservation-price"><input
											type="hidden" value="${packvo.pkPrice}" id="package-price">원
									</div>
								</td>
							</tr>
						</table>
					</div>

				</div>
				<div class="reservation-footer">
					<div class="reservation-footer-strong">
						<strong>취소위약금 및 동의사항</strong>
					</div>
					<div class="reservation-footer-div">
						<ul>
							<li>결제완료 후 예약확정 시 취소 시점에 따라 위약금이 발생할 수 있습니다.</li>
							<li>취소료 규정은 각 상품 상세 페이지에서 확인 가능합니다.</li>
							<li>예약이 완료되면 담당자가 전화로 추가 안내 및 확인 절차를 거칩니다.</li>
							<li>여행상품의 특성 상 경우에 따라 예약이 완료된 후에도 처리가 불가능할 수 있습니다.</li>
							<li>본 여행상품의 세부 약관 규정은 재경부 고시 소비자 피해보상 규정을 바탕으로 합니다.</li>
						</ul>
					</div>
				</div>
				<div class="reservation-footer-button">
					<a href="/product/detail?pkNo=${packvo.pkNo }">
						<button type="button" class="x-btn">취소</button>
					</a> <a href="#" class="reservation-btn-a" id="reservation-btn-a">
						<button type="button" class="reservation-btn" id="reservation-btn">예약하기</button>
					</a>
				</div>
			</div>





		</div>
		
	</div>
	<div class="terms-modal-back">
		<div class="terms-modal" id="modal-1">
			<div class="terms-modal-header">
				<h2>특별약관 설명 및 확인</h2>
			</div>
			<div class="terms-modal-body">
				상품취소규정<br>
				<br>
				해당 상품은 해외여행 표준약관보다 우선 적용되는 특약규정입니다.<br>
				<br>
				특약규정<br>
				<br>
				출발일 -1개월 이내 취소시 위약금 규정 안내<br>
				- 예약 후 ~ 여행출발일 30일전까지 : 예약금 환불불가<br>
				- 여행 출발일 30~21일 이전 취소/변경시 여행요금의 30%<br>
				- 여행 출발일 20~10일 이전 취소/변경시여행요금의 50%<br>
				- 여행 출발일 9~당일 취소 / 노쇼시여행요금의 100%<br>
				☞ 항공권 선발권 할 경우- 발권 취소차지 별도 및 , 유럽 기차 및 티켓 구입 사전구입시에 환불 불가 주의 상품별 상이<br>
				☞ 공정거래위원회 소비자분쟁 해결기준과 별도로 진행되는 규정입니다. 예약 취소 시 해외여행 약관 제5조(특약)에 의한<br> 
				자체 특별약관이<br>
				적용됨을 양지하여 주시기 바랍니다<br>
				<br>
				단, 최소 출발인원이 미충족되어 여행출발이 불가한 경우에는 여행출발 07일 전까지 고객님께 통보하여 드립니다.<br>
				- 여행개시 07일전까지 통보시: 계약금 환급<br>
				- 여행개시 06~01일전까지 통보시: 여행요금의 30% 배상<br>
				- 여행 당일 통보시: 여행요금의 50% 배상<br>
				- 여행출발일 이전 상해,질병,입원,사망 등으로 여행을 취소하는 경우 진단서 증빙 근거하여 환불이 가능하며 출발일 7일 이내<br>
				증빙서류를 제출하여 주시기 바랍니다.<br>
				<br>
				휴일 및 평일 여행사의 업무종료(PM 18:00) 후 취소는 출발일 기준에서 제외 됩니다.<br>
				예) 토/일/월요일 출발은 금요일 업무종료전까지 취소하셔야 하며 업무종료후 취소는 당일취소로 적용됩니다.<br>
				이점 고객님께서 유의 하시기 바랍니다.
			</div>
			<div class="terms-modal-footer">
				<button class="terms-modal-close">닫기</button>
				<button class="terms-modal-close">확인</button>
			</div>
		</div>
		<div class="terms-modal" id="modal-4">
			<div class="terms-modal-header">
				<h2>개인정보 3자제공</h2>
			</div>
			<div class="terms-modal-body">
			■ 개인정보 제3자 제공<br>
			주식회사 랜드마크는 법령에 근거가 있거나 정부의 관련 지침, 지시가 있는 등 예외적인 경우를 제외하고 고객의 사전동의 없이
			고객(동반자포함) 개인정보를 아래에서 고지한범위를 초과하여 제3자 또는 외부에 제공하지 않습니다.<br>
			<hr>
			<table>
				<tr>
					<td><strong>제공받는 자</strong></td>
					<td><strong>제공하는 항목</strong></td>
					<td><strong>제공받는 자의 이용목적</strong></td>
					<td><strong>보유 및 이용기간</strong></td>
				</tr>
				<tr>
					<td><strong>토파스여행정보,<br>아시아나세이버</strong></td>
					<td>성명(국문/영문), 생년월일, 성별,<br> 여권정보(영문명, 여권번호,<br>
					여권만료일), 연락처(이메일/<br>
					휴대전화번호), 마일리지 정보,<br>
					 카드정보, 계좌정보(환불시)</td>
					<td>항공권 예약, 발권,<br>
					<br>
					운송 서비스 등 제공
					</td>
					<td rowspan="8"><strong>서비스 종료 시점,<br>
					 개인정보 처리이용<br>
					 후 폐기 시점,<br>
					 관계법령에 따른<br>
					 보관 시점까지</strong></td>
				</tr>
				<tr>
					<td><strong>항공사</strong></td>
					<td>성명(국문/영문), 생년월일, 성별,<br>
						여권정보(영문명, 여권번호, <br>
						여권만료일),연락처(이메일/<br>
						휴대전화번호), 카드정보,<br>
						계좌정보</td>
					<td>항공권 예약, 발권,<br><br>
					 운송 서비스 등 제공</td>
				</tr>
				<tr>
					<td><strong>크루즈 및<br> 해운업체</strong></td>
					<td>성명(국문/영문), 생년월일,<br>
					 성별, 여권정보(영문명, 여권번호,<br>
					  여권만료일)</td>
					<td>예약 및 운송 서비스</td>
				</tr>
				<tr>
					<td><strong>철도업체</strong></td>
					<td>성명(국문/영문), 생년월일,<br>
					 성별, 여권정보(영문명,<br>
					  여권번호, 여권만료일)</td>
					<td>예약 및 운송 서비스</td>
				</tr>
				<tr>
					<td><strong>비자대행업체</strong></td>
					<td>성명(국문/영문), 생년월일,<br>
					 성별, 여권정보(영문명, <br>
					 여권번호, 여권만료일)</td>
					<td>입국 사전승인 <br>
					허가를 받기 위한 <br>목적</td>
				</tr>
				<tr>
					<td><strong>제휴업체</strong></td>
					<td>성명, 연락처(이메일/<br>
					휴대전화번호), 고객ID,<br>
					 항공예약정보, 네이버고유식별자</td>
					<td>패키지, 항공권 예약정보 <br>
					확인 및 이벤트성 포인트 <br>
					적립, 여행상품 관련 이용<br>
					 및 (제휴)	 이벤트 제공</td>
				</tr>
				<tr>
					<td><strong>숙박, 현지업체</strong></td>
					<td>성명(국문/영문), 생년월일, <br>
					성별, 여권정보(영문명, <br>
					여권번호, 여권만료일)</td>
					<td>현지 숙박 및<br> 행사진행</td>
				</tr>
			</table>

			</div>
			<div class="terms-modal-footer">
				<button class="terms-modal-close">닫기</button>
				<button class="terms-modal-close">확인</button>
			</div>
		</div>
		<div class="terms-modal" id="modal-3">
			<div class="terms-modal-header">
				<h2>개인정보 수집 및 이용동의</h2>
			</div>
			<div class="terms-modal-body">
				■ 개인정보수집 및 이용에 대한 동의(필수)<br>
				<br>
				<br>
				주식회사 랜드마크(이하 “당사”)는 여행 서비스와 회원서비스 제공을 위해 아래와 같이 필요 최소한의<br>
				 개인정보만을 수집합니다.<br>
				<br>
				 - 회원 가입 시<br>
				<br>
				<table>
					<tr>
						<td><strong>구분</strong></td>
						<td><strong>수집 항목</strong></td>
						<td><strong>목적</strong></td>
						<td><strong>보유 및 이용기간</strong></td>
					</tr>
					<tr>
						<td><strong>필수</strong></td>
						<td>성명(한글/영문), 생년월일,<br>
						 성별, 아이디(ID), 비밀번호,<br>
						  메일주소, 연락처(전화번호,<br>
						   휴대폰), 쿠키</td>
						<td>이용자 식별, 회원서비스 <br>
						제공, 본인인증 만 14세<br>
						 미만 회원 가입 시 확인,<br>
						  회원 혜택 및 각종 이벤트<br>
						   정보안내, 상품 수령, <br>
						   내부 시스템간 연동</td>
						<td>회원 탈퇴 요청 시까지<br>
							단, 해지 시 상법 등 <br>
							관계법령에 의하여 거래 <br>
							관련 권리의무관계의 확인 <br>
							등을 이유로 일정기간 <br>
							보유해야 할 필요가 <br>
							있을 경우에는 관계법령이<br>
							 정한 기간</td>
					</tr>
				</table>
				<p> - 여행상품 예약 시</p><br>
				<table>
					<tr>
						<td><strong>구분</strong></td>
						<td><strong>수집 항목</strong></td>
						<td><strong>목적</strong></td>
						<td><strong>보유 및 이용기간</strong></td>
					</tr>
					<tr>
						<td><strong>필수</strong></td>
						<td>성명(국문/영문),<br> 
						생년월일, 성별,<br> 여권번호, 여권만료일,<br> 여권발급일, 비자 소지<br> 여부, 이메일,<br> 연락처, 주소</td>
						<td>여행상품 예약 및 <br>상담, 출국가능 여부<br>
						 파악, 경품 배송,<br> 만족도 조사</td>
						<td>회원 탈퇴 요청 시까지<br>
							단, 해지 시 상법 등 <br>관계법령에 의하여 거래 <br>
							관련 권리의무관계의 <br>
							확인 등을 이유로 <br>
							일정기간 보유해야 할 <br>
							필요가 있을 경우에는 <br>관계법령이 정한 기간</td>
					</tr>
					<tr>
						<td><strong>성명, 생년월일, <br>
						성별, 여권번호<br>(주민등록번호)</strong></td>
						<td>여행자 보험 가입</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td><strong>성명, 신용카드 <br>
						번호, 유효기간, <br>
						계약자와의 관계, <br>계좌번호</strong></td>
						<td>대금결제, 정산, 환불</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td><strong>성명, 생년월일, <br>
						성별, 연락처,<br> 회원번호</strong></td>
						<td>포인트 서비스 제공 및 <br> 회원 확인</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
				</table>
				<p>* 회원은 개인정보 수집 및 이용에 대한 동의를 거부할 권리가 있으며, 동의 거부 시 회원가입이 제한됩니다.</p>
			</div>
			<div class="terms-modal-footer">
				<button class="terms-modal-close">닫기</button>
				<button class="terms-modal-close">확인</button>
			</div>
		</div>

		<div class="terms-modal" id="modal-2">
			<div class="terms-modal-header">
				<h2>약관동의</h2>
			</div>
			<div class="terms-modal-body">
				■ 고유식별정보 동의 안내 <br>
				<br>
				(주)랜드마크 국외여행 표준약관<br>
				<br>
				제1조(목적)<br>
				<br>
				이 약관은 (주)랜드마크와 여행자가 체결한 국외여행계약의 세부 이행 및 준수사항을 정함을 목적으로 합니다.<br>
				<br>
				제2조(용어의 정의)<br>
				<br>
				여행의 종류 및 정의, 해외여행수속대행업의 정의는 다음과 같습니다.<br>
				<br>
				 1. 기획여행 : 여행사가 미리 여행목적지 및 관광일정, 여행자에게 제공될 운송 및 숙식서비스 내용(이하 ‘여행서비스’라 한다),<br> 
				 여행요금을 정하여 광고 또는 기타 방법으로 여행자를 모집, 실시하는 여행<br>
				 2. 희망여행 : 여행자(개인 또는 단체)가 희망하는 여행조건에 따라 여행사가 운송, 숙식, 관광 등 여행에 관한 전반적인 계획을<br>
				  수립하여 실시하는 여행<br>
				 3. 해외여행 수속대행(이하 "수속대행계약"이라 함) : 여행사가 여행자로부터 소정의 수속대행 요금을 받기로 약정하고, 여행자의 <br>
				 위탁에 따라 다음에 열거하는 업무(이하 "수속대행업무"라 함)를 대행하는 것<br>
				  1) 사증, 재입국 허가 및 각종 증명서 취득에 관한 수속<br>
				  2) 출입국 수속서류 작성 및 기타 관련업무<br>
				제3조(여행사와 여행자 의무)<br>
				<br>
				① 여행사는 여행자에게 안전하고 만족스러운 여행서비스를 제공하기 위하여 여행알선 및 안내, 운송, 숙박 등 여행계획의 수립 및 <br>
				실행과정에서 맡은 바 임무를 충실히 수행하여야 합니다.<br>
				② 여행자는 안전하고 즐거운 여행을 위하여 여행자간 화합도모 및 여행사의 여행질서 유지에 적극 협조하여야 합니다.<br>
				<br>
				제4조(계약의 구성)<br>
				<br>
				① 여행계약은 여행계약서(붙임)와 여행약관, 여행일정표(또는 여행 설명서)를 계약내용으로 합니다.<br>
				② 여행계약서에는 여행사의 상호, 소재지 및 관광진흥법 제9조에 따른 보증보험 등의 가입(또는 영업보증금의 예치 현황) <br>
				내용이 포함되어야 합니다.<br>
				③ 여행일정표(또는 여행설명서)에는 여행일자별 여행지와 관광내용, 교통수단, 쇼핑횟수, 숙박장소, 식사 등 여행실시일정 및 <br>
				여행사 제공 서비스 내용과 여행자 유의사항이 포함되어야 합니다.<br>
				<br>
				제5조(계약체결의 거절)<br>
				<br>
				여행사는 여행자에게 다음 각 호의 1에 해당하는 사유가 있을 경우에는 여행자와의 계약체결을 거절할 수 있습니다.<br>
				 1. 질병, 신체이상 등의 사유로 개별관리가 필요하거나, 단체여행(다른 여행자의 여행에 지장을 초래하는 등)의 원활한 실시에 <br>
				 지장이 있다고 인정되는 경우<br>
				 2. 계약서에 명시한 최대행사인원이 초과된 경우<br>
				<br>
				제6조(특약)<br>
				<br>
				여행사와 여행자는 관계법규에 위반되지 않는 범위 내에서 서면(전자문서를 포함한다. 이하 같다)으로 특약을 맺을 수 있습니다. <br>
				이 경우 여행사는 특약의 내용이 표준약관과 다르고 표준약관보다 우선 적용됨을 여행자에게 설명하고 별도의 확인을 받아야 합니다.<br>
				<br>
				제7조(계약서 등 교부 및 안전정보 제공)<br>
				<br>
				여행사는 여행자와 여행계약을 체결한 경우 계약서와 약관 및 여행일정표(또는 여행설명서)를 각 1부씩 여행자에게 교부하고, <br>
				여행목적지에 관한 안전정보를 제공하여야 합니다. 또한 여행 출발 전 해당 여행지에 대한 안전정보가 변경된 경우에도 변경된 안전정보를 제공하여야 합니다.<br>
				<br>
				제8조(계약서 및 약관 등 교부 간주)<br>
				<br>
				다음 각 호의 경우 여행계약서와 여행약관 및 여행일정표(또는 여행설명서)가 교부된 것으로 간주합니다.<br>
				 1. 여행자가 인터넷 등 전자정보망으로 제공된 여행계약서, 약관 및 여행일정표(또는 여행설명서)의 내용에 동의하고 여행계약의 <br>
				 체결을 신청한데 대해 당사가 전자정보망 내지 기계적 장치 등을 이용하여 여행자에게 승낙의 의사를 통지한 경우<br>
				 2. 여행사가 팩시밀리 등 기계적 장치를 이용하여 제공한 여행계약서, 약관 및 여행일정표(또는 여행설명서)의 내용에 대하여 <br>
				 여행자가 동의하고 여행계약의 체결을 신청하는 서면을 송부한데 대해 여행사가 전자정보망 내지 기계적 장치 등을 이용하여 <br>
				 여행자에게 승낙의 의사를 통지한 경우<br>
				<br>
				제9조(여행사의 책임)<br>
				<br>
				여행사는 여행 출발시부터 도착시까지 여행사 본인 또는 그 고용인, 현지여행사 또는 그 고용인 등(이하 ‘사용인’이라 함)이 <br>
				제3조 제1항에서 규정한 여행사 임무와 관련하여 여행자에게 고의 또는 과실로 손해를 가한 경우 책임을 집니다.<br>
				<br>
				제10조(여행요금)<br>
				<br>
				① 여행계약서의 여행요금에는 다음 각 호가 포함됩니다. 단, 희망여행은 당사자간 합의에 따릅니다.<br>
				<br>
				 1. 항공기, 선박, 철도 등 이용운송기관의 운임(보통운임기준)<br>
				 2. 공항, 역, 부두와 호텔사이 등 송영버스요금<br>
				 3. 숙박요금 및 식사요금<br>
				 4. 안내자경비<br>
				 5. 여행 중 필요한 각종세금<br>
				 6. 국내외 공항, 항만세<br>
				 7. 관광진흥개발기금<br>
				 8. 일정표내 관광지 입장료<br>
				 9. 기타 개별계약에 따른 비용<br>
				② 제1항에도 불구하고 반드시 현지에서 지불해야 하는 경비가 있는 경우 그 내역과 금액을 여행계약서에 별도로 구분하여 표시하고,<br>
				 여행사는 그 사유를 안내하여야 합니다.<br>
				③ 여행자는 계약체결시 계약금(여행요금 중 10%이하 금액)을 여행업자에게 지급하여야 하며, 계약금은 여행요금 또는<br>
				 손해배상액의 전부 또는 일부로 취급합니다.<br>
				④ 여행자는 제1항의 여행요금 중 계약금을 제외한 잔금을 여행출발 7일전까지 여행사에게 지급하여야 합니다.<br>
				⑤ 여행자는 제1항의 여행요금을 당사가가 약정한 바에 따라 카드, 계좌이체 또는 무통장입금 등의 방법으로 지급하여야 합니다.<br>
				⑥ 희망여행요금에 여행자 보험료가 포함되는 경우 여행사는 보험회사명, 보상내용 등을 여행자에게 설명하여야 합니다.<br>
				<br>
				제11조(여행요금의 변경)<br>
				<br>
				① 국외여행을 실시함에 있어서 이용운송, 숙박기관에 지급하여야 할 요금이 계약체결시보다 5%이상 증감하거나 여행요금에 <br>
				적용된 외화환율이 계약체결시보다 2% 이상 증감한 경우 여행사 또는 여행자는 그 증감된 금액 범위 내에서 여행요금의 증감을 상대방에게 청구할 수 있습니다.<br>
				② 여행업자는 제1항의 규정에 따라 여행요금을 증액하였을 때에는 여행출발일 15일전에 여행자에게 통지하여야 합니다.<br>
				<br>
				제12조(여행조건의 변경요건 및 요금 등의 정산)<br>
				<br>
				① 계약서 등에 명시된 여행조건은 다음 각 호의 1의 경우에 한하여 변경될 수 있습니다.<br>
				<br>
				 1. 여행자의 안전과 보호를 위하여 여행자의 요청 또는 현지사정에 의하여 부득이하다고 쌍방이 합의한 경우<br>
				 2. 천재지변, 전란, 정부의 명령, 운송, 숙박기관 등의 파업, 휴업 등으로 여행의 목적을 달성할 수 없는 경우<br>
				② 여행사가 계약서 등에 명시된 여행일정을 변경하는 경우에는 해당 날짜의 일정이 시작되기 전에 여행자의 서면 동의를 받아야 합니다.<br>
				 이때 서면동의서에는 변경일시, 변경내용, 변경으로 발생하는 비용이 포함되어야 합니다.<br>
				③ 천재지변, 사고, 납치 등 긴급한 사유가 발생하여 여행자로부터 여행일정 변경 동의를 받기 어렵다고 인정되는 경우에는 제2항에<br>
				 따른 일정변경 동의서를 받지 아니할수 있습니다. 다만, 여행사는 사후에 서면으로 그 변경 사유 및 비용 등을 설명하여야 합니다.<br>
				④ 제1항의 여행조건 변경 및 제11조의 여행요금 변경으로 인하여 제10조제 1항의 여행요금에 증감이 생기는 경우에는 여행출발 전<br>
				 변경 분은 여행출발 이전에, 여행 중 변경 분은 여행종료 후 10일 이내에 각각 정산(환급)하여야 합니다.<br>
				⑤ 제1항의 규정에 의하지 아니하고 여행조건이 변경되거나 제16조 또는 제18조의 규정에 의한 계약의 해제, 해지로 인하여 손해배상액이<br>
				 발생한 경우에는 여행출발 전 발생 분은 여행출발이전에, 여행 중 발생 분은 여행종료 후 10일 이내에 각각 정산(환급)하여야 합니다.<br>
				⑥ 여행자는 여행출발 후 자기의 사정으로 숙박, 식사, 관광 등 여행요금에 포함된 서비스를 제공받지 못한 경우 여행사에게 그에 상응하는 <br>
				요금의 환급을 청구할 수 없습니다. 단, 여행이 중도에 종료된 경우에는 제18조에 준하여 처리합니다.<br>
				<br>
				제13조(여행자 지위의 양도)<br>
				<br>
				① 여행자가 개인사정 등으로 여행자의 지위를 양도하기 위해서는 여행사의 승낙을 받아야 합니다. 이때 여행사는 여행자 또는 여행자의 <br>
				지위를 양도받으려는 자가 양도로 발생하는 비용을 지급할 것을 조건으로 양도를 승낙할 수 있습니다.<br>
				② 전항의 양도로 발생하는 비용이 있을 경우 여행사는 기한을 정하여 그 비용의 지급을 청구하여야 합니다.<br>
				③ 여행사는 계약조건 또는 양도하기 어려운 불가피한 사정 등을 이유로 제1항의 양도를 승낙하지 않을 수 있습니다.<br>
				④ 제1항의 양도는 여행사가 승낙한 때 효력이 발생합니다. 다만, 여행사가 양도로 인해 발생한 비용의 지급을 조건으로 승낙한 경우에는<br>
				 정해진 기한 내에 비용이 지급되는 즉시 효력이 발생합니다.<br>
				⑤ 여행자의 지위가 양도되면, 여행계약과 관련한 여행자의 모든 권리 및 의무도 그 지위를 양도 받는 자에게 승계됩니다.<br>
				<br>
				제14조(여행사의 하자담보 책임)<br>
				<br>
				① 여행자는 여행에 하자가 있는 경우에 여행사에게 하자의 시정 또는 대금의 감액을 청구할 수 있습니다. 다만, 그 시정에 지나치게 <br>
				많은 비용이 들거나 그 밖에 시정을 합리적으로 기대할 수 없는 경우에는 시정을 청구할 수 없습니다.<br>
				② 여행자는 시정 청구, 감액 청구를 갈음하여 손해배상을 청구하거나 시정 청구, 감액 청구와 함께 손해배상을 청구 할 수 있습니다.<br>
				③ 제1항 및 제2항의 권리는 여행기간 중에도 행사할 수 있으며, 여행종료일부터 6개월 내에 행사하여야 합니다.<br>
				<br>
				제15조(손해배상)<br>
				<br>
				① 여행사는 현지여행업자 등의 고의 또는 과실로 여행자에게 손해를 가한 경우 여행사는 여행자에게 손해를 배상하여야 합니다.<br>
				② 여행사의 귀책사유로 여행자의 국외여행에 필요한 여권, 사증, 재 입국 허가 또는 각종 증명서 등을 취득하지 못하여 여행자의 <br>
				여행일정에 차질이 생긴 경우 여행사는 여행자로부터 절차대행을 위하여 받은 금액 전부 및 그 금액의 100%상당액을 여행자에게 배상하여야 합니다.<br>
				③ 여행사는 항공기, 기차, 선박 등 교통기관의 연 발착 또는 교통체증 등으로 인하여 여행자가 입은 손해를 배상하여야 합니다. 단,<br>
				 여행업자가 고의 또는 과실이 없음을 입증한 때에는 그러하지 아니합니다.<br>
				④ 여행사는 자기나 그 사용인이 여행자의 수하물 수령, 인도, 보관 등에 관하여 주의를 해태(懈怠)하지 아니하였음을 증명하지 아니하면 <br>
				여행자의 수하물 멸실, 훼손 또는 연착으로 인한 손해를 배상할 책임을 면하지 못합니다.<br>
				<br>
				제16조(여행출발 전 계약해제)<br>
				<br>
				① 여행사는 또는 여행자는 여행출발전 이 여행계약을 해제할 수 있습니다. 이 경우 발생하는 손해액은 ‘소비자분쟁해결기준’(공정거래위원회 고시)<br>
				에 따라 배상합니다.<br>
				<br>
				 1. 여행자의 여행계약 해제 요청이 있는 경우(여행자의 취소 요청시)<br>
				  - 여행출발일 ~30일 전까지 취소 요청 시 - 계약금 환급<br>
				  - 여행출발일 29~20일 전까지 취소 요청 시 - 여행요금의 10% 배상<br>
				  - 여행출발일 19~10일 전까지 취소 요청 시 - 여행요금의 15% 배상<br>
				  - 여행출발일 9~8일 전까지 취소 요청 시 - 여행요금의 20% 배상<br>
				  - 여행출발일 7~1일 전까지 취소 요청 시 - 여행요금의 30% 배상<br>
				  - 여행출발 당일 취소 요청 시 - 여행요금의 50% 배상<br>
				 2. 여행사의 취소통보로 여행이 취소된 경우 손해배상<br>
				  - 여행개시 ~30일 전까지 통보 시 - 계약금 환급<br>
				  - 여행개시 29~20일 전까지 통보 시 - 여행요금의 10% 배상<br>
				  - 여행개시 19~10일 전까지 통보 시 - 여행요금의 15% 배상<br>
				  - 여행개시 9~8일 전까지 통보 시 - 여행요금의 20% 배상<br>
				  - 여행개시 7~1일 전까지 통보 시 - 여행요금의 30% 배상<br>
				  - 여행출발 당일 취소 통보 시 - 여행요금의 50% 배상<br>
				단, 최저행사인원이 충족되지 않아 불가피하게 기획여행을 실시할 수 없는 경우에는 제17조(최저행사인원 미 충족시 계약해제)의 조항에 의거하여 <br>
				여행사가 여행자에게 배상한다.<br>
				<br>
				② 여행사 또는 여행자는 여행출발 전에 다음 각 호의 1에 해당하는 사유가 있는 경우 상대방에게 제1항의 손해배상액을 지급하지 아니하고 이 <br>
				여행계약을 해제할 수 있습니다.<br>
				<br>
				 1. 여행사가 해제할 수 있는 경우<br>
				  가. 제12조 제1항 제1호 및 제2호 사유의 경우<br>
				  나. 여행자가 다른 여행자에게 폐를 끼치거나 여행의 원활한 실시에 현저한 지장이 있다고 인정될 때<br>
				  다. 질병 등 여행자의 신체에 이상이 발생하여 여행에의 참가가 불가능한 경우<br>
				  라. 여행자가 계약서에 기재된 기일까지 여행요금을 납입하지 아니한 경우<br>
				 2. 여행자가 해제할 수 있는 경우<br>
				  가. 제12조 제1항 제1호 및 제2호의 사유가 있는 경우<br>
				  나. 여행사가 제21조에 따른 공제 또는 보증보험에 가입하지 아니 하였거나 영업보증금을 예치하지 않은 경우<br>
				  다. 여행자의 3촌 이내 친족이 사망한 경우<br>
				  라. 질병 등 여행자의 신체에 이상이 발생하여 여행에의 참가가 불가능한 경우<br>
				  마. 배우자 또는 직계존비속이 신체이상으로 3일 이상 병원(의원)에 입원하여 여행 출발 전까지 퇴원이 곤란한 경우 그 배우자 또는 보호자 1인<br>
				  바. 여행사의 귀책사유로 계약서 또는 여행일정표(여행설명서)에 기재된 여행일정대로의 여행실시가 불가능해진 경우<br>
				  사. 제10조 제1항의 규정에 의한 여행요금의 증액으로 인하여 여행 계속이 어렵다고 인정될 경우<br>
				제17조(최저행사인원 미 충족시 계약해제)<br>
				<br>
				① 여행사는 최저행사인원이 충족되지 아니하여 여행계약을 해제하는 경우 여행출발 7일전까지 여행자에게 통지하여야 합니다.<br>
				② 여행사가 여행참가자 수 미달로 전항의 기일내 통지를 하지 아니하고 계약을 해제하는 경우 이미 지급받은 계약금 환급 외에 다음 각 목의 1의 <br>
				금액을 여행자에게 배상하여야 합니다.<br>
				  가. 여행출발 1일전까지 통지시 : 여행요금의 30%<br>
				  나. 여행출발 당일 통지시 : 여행요금의 50%<br>
				<br>
				제18조(여행출발 후 계약해지)<br>
				<br>
				① 여행사 또는 여행자는 여행출발 후 부득이한 사유가 있는 경우 각 당사자는 여행계약을 해지할 수 있습니다. 다만, 그 사유가 당사자 한쪽의 <br>
				과실로 인하여 생긴 경우에는 상대방에게 손해를 배상하여야 합니다.<br>
				② 제1항에 따라 여행계약이 해지된 경우 귀환운송 의무가 있는 여행사는 여행자를 귀환운송 할 의무가 있습니다.<br>
				③ 제1항의 계약해지로 인하여 발생하는 추가 비용은 그 해지사유가 어느 당사자의 사정에 속하는 경우에는 그 당사자가 부담하고, 양 당사자 누구의<br>
				 사정에도 속하지 아니하는 경우에는 각 당사자가 추가 비용의 50%씩을 부담합니다.<br>
				④ 여행자는 여행에 중대한 하자가 있는 경우에 그 시정이 이루어지지 아니하거나 계약의 내용에 따른 이행을 기대할 수 없는 경우에는 계약을 해지할 수 있습니다.<br>
				⑤ 제4항에 따라 계약이 해지된 경우 여행사는 대금청구권을 상실합니다. 다만, 여행자가 실행된 여행으로 이익을 얻은 경우에는 그 이익을 여행사에게 상환하여야 합니다.<br>
				⑥ 제4항에 따라 계약이 해지된 경우 여행사는 계약의 해지로 인하여 필요하게 된 조치를 할 의무를 지며, 계약상 귀환운송 의무가 있으면 여행자를 귀환운송하여야 합니다.<br>
				 이 경우 귀환운송비용은 원칙적으로 여행사가 부담하여야 하나, 상당한 이유가 있는 때에는 여행사는 여행자에게 그 비용의 일부를 청구할 수 있습니다.<br>
				<br>
				제19조(여행의 시작과 종료)<br>
				<br>
				여행의 시작은 탑승수속(선박인 경우 승선수속)을 마친 시점으로 하며, 여행의 종료는 여행자가 입국장 보세구역을 벗어나는 시점으로 합니다. 다만, 계약내용상 국내이동이<br>
				 있을 경우에는 최초 출발지에서 이용하는 운송수단의 출발시각과 도착시각으로 합니다.<br>
				<br>
				제20조(설명의무)<br>
				<br>
				여행사는 계약서에 정하여져 있는 중요한 내용 및 그 변경사항을 여행자가 이해할 수 있도록 설명하여야 합니다.<br>
				<br>
				제21조(보험가입 등)<br>
				<br>
				여행사는 이 여행과 관련하여 여행자에게 손해가 발생한 경우 여행자에게 보험금을 지급하기 위한 보험 또는 공제에 가입하거나 영업보증금을 예치하여야 합니다.<br>
				<br>
				제22조(기타사항)<br>
				<br>
				① 이 계약에 명시되지 아니한 사항 또는 이 계약의 해석에 관하여 다툼이 있는 경우에는 여행사 또는 여행자가 합의하여 결정하되, 합의가 이루어지지 아니한 <br>
				경우에는 관계법령 및 일반관례에 따릅니다.<br>
				② 특수지역에의 여행으로서 정당한 사유가 있는 경우에는 이 표준약관의 내용과 달리 정할 수 있습니다.<br>
				<br>
				<br>
				<br>
				[ 부칙 ]<br>
				<br>
				- (최종개정일) 이 약관은 2019년 12월 06일부터 시행합니다.<br>
			</div>
			<div class="terms-modal-footer">
				<button class="terms-modal-close">닫기</button>
				<button class="terms-modal-close">확인</button>
			</div>
		</div>
		
		<div class="terms-modal" id="modal-5">
			<div class="terms-modal-header">
				<h2>고유식별정보 수집안내</h2>
			</div>
			<div class="terms-modal-body">
				■ 고유식별정보 동의 안내 <br>
				<br>
				당사는 개인정보보호법을 준수하며 서비스 수행의 목적에 한하여 최소한의 고유식별정보를 수집,<br>
				이용하며 기준은 아래와 같습니다.<br>
				<br>
				 1. 고유식별 정보 수집/이용 목적 : 해외여행 상품예약시 출국가능 여부파악 및 여행자 본인식별, 여행자보험 가입<br>
				 2. 수집하는 고유식별 정보의 항목 : 여권번호 (여권만료일)<br>
				 3. 고유식별정보의 보유 및 이용기간 : 여행상품 서비스 수행목적의 완료시점까지<br>
				<br>
				* 고객님은 개인정보 수집 및 이용에 대한 동의를 거부할 권리가 있습니다. <br>
				   동의를 거부할 경우 여행상품 예약 서비스 이용이 불가함을 알려드립니다.<br>
			</div>
			<div class="terms-modal-footer">
				<button class="terms-modal-close">닫기</button>
				<button class="terms-modal-close">확인</button>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
 
<script type="text/javascript">
	let pkNoVal = `<c:out value="${packvo.pkNo }"/>`;
	console.log(pkNoVal);
</script>
	<script type="text/javascript"
		src="/resources/js/product/reservation.js"></script>
</body>
</html>