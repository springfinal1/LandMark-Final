<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.uvo.authList" var="auths"/>
	</sec:authorize>
	<div class="detail-container">
	
		<div class="user-infomation">
			<div>
				<div>
					<span>${uvo.id}님, 안녕하세요.</span>
					<span><i class="fa-regular fa-face-smile"></i></span>
				</div>
			</div>
			
			<div>
				<div>
					<span>포인트</span>
					<span>${msvo.point}<i id="p" class="fa-solid fa-p"></i></span>
				</div>
				<div>
					<span>회원등급</span>
					<span>${msvo.grade}</span>
				</div>
				<div>
					<span>누적결제금액</span>
					<span>${msvo.totalPrice} 원</span>
				</div>
			</div>
			<div class="user-detail-top">
				<div>
					<div>포인트는 10000P가 있어요.</div>
					<div>회원등급별로 적용되는 할인율은</div>
					<div>브론즈 3%, 실버 5%, 골드 7% 입니다.</div>
					<div>포인트는 예약시 사용할수 있습니다.</div>
				</div>
				<div>
					<div>누적금액에 따라 등급이 정해집니다.</div>
					<div>기본 (브론즈)</div>
					<div>500만원 이상 ~ 1000만원 미만 (실버)</div>
					<div>1000만원 이상 (골드)</div>
				</div>
			</div>
		</div>
		
		
		<div class="user-detail-mid">
		
			<div class="user-package-reservation">
				<div>
					<span>예약 내역</span>
				</div>
				<div class="my-list">
					<!-- 패키지예약내역 영역 -->
					<c:choose>
						<c:when test="${not empty packList}">
							<div class="list-items">
								<div class="fixed-title">
									<span class="packge-orderDate">예약일자</span>
									<span class="packge-name">상품명</span>
									<span class="packge-price">결제금액</span>
								</div>
								<c:forEach items="${packList}" var="pack">
								<div class="qa-list">
									<span class="packge-orderDate">${pack.orderDate}</span>
									<span class="packge-name"><a href="/peyment/getList?orderNum=${pack.orderNum}">${pack.pkName}</a></span>
									<span class="packge-price"><fmt:formatNumber value="${pack.totalPrice}" pattern="#,###" />원</span>
								</div>
								</c:forEach>
							</div>
						</c:when>
						<c:otherwise>
							<div class="noHistory"><i class="fa-solid fa-cart-shopping"></i>예약내역이 없습니다.</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			
			<div class="user-airplane-reservation">
				<div>
					<span>항공권 예약 내역</span>
				</div>
				<div class="my-list">
					<!-- 항공예약내역 영역 -->
					<c:choose>
						<c:when test="${not empty ftList}">
							<div class="list-items">
								<div class="fixed-title">
									<span class="ticket-date">출발/도착</span>
									<span class="ticket-arrival">도착공항</span>
									<span class="ticket-flighType">항공유형</span>
									<span class="ticket-seatType">좌석유형</span>
									<span class="ticket-people">인원수</span>
								</div>
								<c:forEach items="${ftList}" var="ftList">
								<div class="qa-list ticket-list" data-seat="${ftList.seatType}" data-city="${ftList.cityCode}" data-departure="${ftList.departureDay}"
									 data-gate="${ftList.gate}">
									<span class="ticket-date">${ftList.departureDay}/${ftList.arrivalDay}</span>
                                    <span class="ticket-arrival">${ftList.arrival}</span>
									<span class="ticket-flighType">${ftList.flightType}</span>
									<span class="ticket-seatType">${ftList.seatType}</span>
									<span class="ticket-people">${ftList.ftPeple}</span>
								</div>
								</c:forEach>
							</div>
						</c:when>
						<c:otherwise>
							<div class="noHistory"><i class="fa-solid fa-plane-slash"></i>예매한 항공권이 없습니다.</div>
						</c:otherwise>
					</c:choose>	
				</div>
			</div>
			
		</div>
		
		<div class="user-detail-bottom">
		
			<div class="user-wishlist">
				<div>
					<span>관심 상품</span>
				</div>
				<div class="my-list">
					<!-- 관심상품 영역 -->
					<c:choose>
						<c:when test="${not empty faList}">
							<div class="list-items">
								<div class="fixed-title">
									<span class="favvorite-name">상품명</span>
									<span class="favvorite-continent">지역</span>
									<span class="favvorite-price">패키지금액</span>
								</div>
								<c:forEach items="${faList}" var="faList">
								<div class="qa-list">
									<span class="favvorite-name">${faList.pkName}</span>
									<span class="favvorite-continent"><a href="/product/detail?pkNo=${faList.pkNo}">${faList.pkContinent}</a></span>
									<span class="favvorite-price"><fmt:formatNumber value="${faList.pkPrice}" pattern="#,###" />원</span>
								</div>
								</c:forEach>
							</div>
						</c:when>
						<c:otherwise>
							<div class="noHistory"><i class="fa-solid fa-cart-shopping"></i>관심상품이 없습니다.</div>
						</c:otherwise>
					</c:choose>					
				</div>
			</div>
			
			<div class="user-inquiryHistory">
				<div>
					<span>나의 문의내역</span>
				</div>
				<div class="my-list">
					<!-- 문의내역 영역 -->
					<c:choose>
						<c:when test="${not empty hList}">
							<div class="list-items">
								<div class="fixed-title">
									<span class="inquiry-type">문의유형</span>
									<span class="inquiry-title">문의제목</span>
									<span class="inquiry-answer">답변여부</span>
								</div>
								<c:forEach items="${hList}" var="hList">
								<div class="qa-list">
									<span class="inquiry-type">${hList.type}</span>
									<span class="inquiry-title"><a href="/help/detail?helpNo=${hList.helpNo}">${hList.title}</a></span>
									<span class="inquiry-answer ${hList.answer eq 'n' ? '' : 'answer-yes'}">${hList.answer eq 'n' ? '답변대기' : '답변완료'}
									</span>
								</div>
								</c:forEach>
							</div>
						</c:when>
						<c:otherwise>
							<div class="noHistory"><i class="fa-regular fa-comments"></i>문의내역이 없습니다.</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			
			
		</div>
		
		<div class="user-category">
			<div>
				<a href="#">
					<span><i class="fa-regular fa-pen-to-square"></i></span>
					<span>내가쓴리뷰</span>
				</a>
			</div>
			<div>
				<a href="/help/list?pageNo=1&answer=">
					<span><i class="fa-regular fa-circle-question"></i></span>
					<span>문의내역</span>
				</a>
			</div>
			<!-- 자체회원만 수정허용 -->
			<c:if test="${auths.stream().anyMatch(authVO -> authVO.auth.equals('ROLE_USER')).get()}">
			<div>
				<a href="/user/modify">
					<span><i class="fa-regular fa-user"></i></span>
					<span>회원정보수정</span>
				</a>
			</div>
			</c:if>
		</div>
				
	</div> 	
	
	<!-- 회원가입 완료시 모달창 오픈 -->
	<div class="join-background">
		<div class="join-modal">
			<span class="material-symbols-outlined" id="confirm-btn">close</span>
			
			<span><button type="button" id="confirm-btn">확인</button></span>
		</div>
	</div>
	
    <!-- 항공권 모달 -->
    <div class="flight-ticket-modal-back">
        <div class="flight-ticket-modal">
        	<span class="material-symbols-outlined" id="closeTicketModal">close</span>
            <div class="section-left">
                <div class="header-left">AIR TICKET</div>
                <div class="body-left">
                    <div>
                        <span>ICN</span>
                        <i class="fa-solid fa-plane"></i>
                        <span class="city-code">JFK</span><!-- cityCode 입력영역 -->
                    </div>
                    <div>
                        <div>
                            <span>DEPARTURE TIME</span>
                            <span class="departure-day">2023-12-25</span><!-- 출발일 입력영역 -->
                        </div>
                        <div>
                            <span>GATE</span>
                            <span class="gate">37A</span>
                        </div>
                        <div>
                            <span>SEAT TYPE</span>
                            <span class="seat-type">일반석</span><!-- 좌석타입 입력영역 -->
                        </div>
                    </div>
                </div>
            </div>
            <div class="section-right">
                <div class="header-right"></div>
                <div class="body-right">
                    <div>
                        <span>DEPARTURE TIME</span>
                        <span class="departure-day">2023-12-25</span><!-- 출발일 입력영역 -->
                    </div>
                    <div>
                        <span>GATE</span>
                        <span class="gate">37A</span>
                    </div>
                    <div>
                        <span>SEAT TYPE</span>
                        <span class="seat-type">일반석</span><!-- 좌석타입 입력영역 -->
                    </div>
                    <span class="barcode">
                        <i class="fa-solid fa-barcode"></i>
                        <i class="fa-solid fa-barcode"></i>
                        <i class="fa-solid fa-barcode"></i>
                        <i class="fa-solid fa-barcode"></i>
                        <i class="fa-solid fa-barcode"></i>
                    </span>
                </div>
            </div>
        </div>
    </div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
<script type="text/javascript" src="/resources/js/user/detail.js"></script>
</html>