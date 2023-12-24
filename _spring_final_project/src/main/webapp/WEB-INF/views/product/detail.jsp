<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/product/product_detail.css">
<link rel="stylesheet" href="/resources/css/product/product_modal.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<style>
	
</style>

</head>
<body>
		<sec:authorize access="isAuthenticated()">
	      <sec:authentication property="principal.uvo.id" var="authId" />
	      <sec:authentication property="principal.uvo.email" var="authEmail" />
	      <sec:authentication property="principal.uvo.name" var="authName" />
	      <sec:authentication property="principal.uvo.age" var="authAge" />
	      <sec:authentication property="principal.uvo.phoneNumber" var="authPhoneNumber" />
	      <sec:authentication property="principal.uvo.authList" var="auths" />
      </sec:authorize>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<c:set value="${pldto.packvo }" var="packvo"/>
	<c:set value="${pldto.pfList }" var="pfList"/>
	<c:set value="${pldto.avo }" var="avo"/>
	<c:set value="${pldto.hvo }" var="hvo"/>
	<c:set value="${pldto.fvo }" var="fvo"/>
	<c:set value="${pldto.plvo }" var="plvo"/>



	<div class="product-container">
		<div class="inner-container">	
		
			<div class="product-title">${packvo.pkName }</div>
			
			<div class="main-section">
			
				<div class="sub-container">
					<!-- 상품명 / 아이콘(공유 메일 프린트) -->
					<div class="top-content">
						<!-- 상품명 -->
						<div>
						</div>
						
					</div>
					
					<!-- 사진 리스트 -->
					<div class="div-img">
						<c:forEach items="${pfList }" var="flist">
							<img class="div-imgzone" alt="그림없음" src="/product_upload/${fn: replace(flist.pfSaveDir,'\\','/')}/${flist.pfUuid }_${flist.pfName}">
						</c:forEach>
					</div>
					
					<div>
						<div>
							<div class="manager-div">
								<span id="managerInfoA" class="manager-div-a">담당자 정보 <span class="material-symbols-outlined" id="managerInfoSpan">error</span></span>	
							</div>
							
						</div>
					</div>
					
					<!-- 상품가격 -->
					<table class="product-table">
						<tr class="product-table-tr1">		
							<th>상품가격</th>
							<th>한국출발</th>
							<th>한국도착</th>
						</tr>
						<tr>
							<td class="table-td"><span class="apprice air-info"><fmt:formatNumber value="${packvo.pkPrice}" pattern="#,###"/></span>  원 <br><p class="price-info">유류할증료 포함<br>제세공과금 포함</p></td>
							<td class="table-td"><span class="air-info">${avo.apArrival }</span> <br><p class="price-info">유류할증료 포함<br>제세공과금 포함</p></td>
							<td class="table-td"><span class="air-info">${avo.apDeparture }</span> <br><p class="price-info">유류할증료 포함<br>제세공과금 포함</p></td>
						</tr>	
					</table>
					<!-- 버튼그룹 -->
					<div class="button-grop">
						<button id="evtBtn1" class="evtBtn">상품핵심포인트</button>
						<button id="evtBtn2" class="evtBtn">수하물안내</button>
						<button id="evtBtn3" class="evtBtn">예약안내사항</button>
						<button id="evtBtn4" class="evtBtn">약관정보</button>
						<button id="evtBtn5" class="evtBtn">해외안전정보</button>
					</div>
					<!-- 밑에 바뀌는 div -->
					<div id="product-eventTap" class="product-eventTap">
						<div class="product-point">
							<strong >상품 핵심포인트</strong>
						</div>	
						<div class="item-div">
							<div class="icon-div">
								<span class="material-symbols-outlined">more_horiz</span>
								<span class="icon-text">기타</span>
							</div>
							<div class="item-info">
								<p>공항픽업서비스 : 전용차량 픽업 서비스</p>
								<p>전문가이드투어 : 한국인 전문 가이드투어</p>
								<p>참고사항 : 실시간 항공, 호텔 예약상품으로 상품에 포함된 기본 운임 마감시, 상품가 변동될 수 있습니다.</p>
							</div>
						</div>
						<div class="item-div">
							<div class="icon-div">
								<span class="material-symbols-outlined">verified_user</span>
								<span class="icon-text">여행자보험</span>
							</div>
							<div class="item-info">
								<p>해외 여행자보험(최대1억원/DB손해보험)</p>
								<a href="#">보장내용 및 금액 상세보기</a>
							</div>
						</div>
					</div>
			
				</div><!-- 서브종료  -->
						
				<div class="option-detail">
					<div class="option-price-div">				
						<div class="option-price-text">가격</div>
						
						<div class="option-price-info">
							<strong class="option-price-strong"><fmt:formatNumber value="${packvo.pkPrice}" pattern="#,###"/></strong>
							<span class="option-price-span">원</span>
						</div>
						
						<div class="option-price-button">
							<button type="button" id="minus" class="option-button">-</button>
							<input type="text" value="1" id="pepleCnt" readonly="readonly">
							<button type="button" id="plus" class="option-button">+</button>
						</div>	
						
					</div>
					
					<div class="option-final-price">
						<!-- 최종금액 -->
						<strong class="option-price-text">최종 합계금액</strong>
						<div class="finalPrice-info">
							<strong id="finalPrice" ><fmt:formatNumber value="${packvo.pkPrice}"  pattern="#,###" /></strong>
							<span class="finalPrice-won">원</span>
						</div>
						<input type="hidden" id="price">
						<input type="hidden" value="${packvo.pkPrice }" id="hiddenPrice">
					</div>
					
					<div class="button-div">
						<c:set value="peopleCount" var="peopleCnt" />
						<a href="/product/reservation?pkNo=${packvo.pkNo}&peopleCount=${result}"><button type="button" class="option-submit-button">예약하기</button></a>
					</div>
					<div class="admin-product-controll">
						<!-- 관리자만 보이게 만들기 -->
						<c:if test="${auths.stream().anyMatch(authVO -> authVO.auth.equals('ROLE_ADMIN')).get()}">
							<div>
								<a href="/product/modify?pkNo=${packvo.pkNo}">상품정보 수정하기</a>
							</div>
							
							<div>
								<div class="product-remove">상품 제거</div>
							</div>               
             		  </c:if>
					</div>
				</div> <!-- 옵션 -->
			
			</div>
		</div>
	</div> <!-- all -->
	
	
	<!-- 모달창 (담당자정보) -->
	<div class="modal-background">
		<div class="modal-container">
			
			<div class="modal-header">
				<h5>담당자 정보</h5>
				<span id="confirm-btn">X</span>
			</div>
			
			<div class="modal-body">
				<table>
					<tr>
						<th class="modal-table-th">담당자</th>
						<td class="modal-table-td">이성훈</td>
					</tr>
					
					<tr>
						<th class="modal-table-th">전화번호</th>
						<td class="modal-table-td">010-7441-5488</td>
					</tr>
					
					<tr>
						<th class="modal-table-th">부서명</th>
						<td class="modal-table-td">이젠1팀</td>
					</tr>
					
					<tr>
						<th class="modal-table-th">상담시간</th>
						<td class="modal-table-td">평일 09:00~18:00</td>
					</tr>
				</table>
			</div>
			
			<div class="modal-footer">
				<div class="modal-footer-div">
					<div class="modal-footer-icon">
						<p>궁금하신사항을 문의해 주시면 <br> 친절하게 알려드리겠습니다.</p>
						<i>
							<img src="/resources/image/list-image/free-icon-smiling-3039750.png" class="icon-image">
						</i>		
					</div>
					
					<div class="modal-footer-span">
						<a href="#" >
							<span class="material-symbols-outlined">edit</span>
							<span class="aa">상품 문의하기</span>
						</a>
					</div>
				</div>
			</div>	
		</div>
	</div>
	
	<!-- 상품제거 모달창 -->
   <div class="join-background">
      <div class="join-modal">
         <span class="material-symbols-outlined" id="confirm-btn">close</span>
         <span class="modal-text">상품을 삭제하시겠습니까?</span>
         
         <div class="remove-div">
	         <div id="confirm-btn">취소</div>
	         <div class="remove-btn-a">
	         	<a href="/product/remove?pkNo=${packvo.pkNo }">상품삭제</a>
	         </div>
         </div>
      </div>
   </div>
	
	
	
	
	
	
	
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
<script type="text/javascript">
	let cntPeople = `<c:out value="${result}" />`;
	console.log(cntPeople);
</script>
<script type="text/javascript" src="/resources/js/product/product_detail.js"></script>
<script type="text/javascript">
	let country = `<c:out value="${plvo.plCountry}"/>`;
	let pkNoVal = `<c:out value="${packvo.pkNo}"/>`;
	console.log(country);
	console.log(pkNoVal);
</script>
<!-- <script type="text/javascript" src="/resources/js/product/product_price.js"></script> -->
<script type="text/javascript" src="/resources/js/product/product_modal.js"></script>
</body>
</html>