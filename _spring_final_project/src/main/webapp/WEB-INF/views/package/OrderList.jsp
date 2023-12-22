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

<link rel="stylesheet" href="/resources/css/peyment/myOrder.css"
	type="text/css">

<script src="https://code.jquery.com/jquery-2.2.4.js"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<style>
body, h1, h2, h3, h4, h5, h6, p, span {
	font-family: 'Noto Sans KR', sans-serif !important;
}
</style>

</head>
<body>

	<c:set value="${pldto.packvo }" var="packvo" />
	<c:set value="${pldto.pfList }" var="pfList" />
	<c:set value="${pldto.avo }" var="avo" />
	<c:set value="${pldto.hvo }" var="hvo" />
	<c:set value="${pldto.fvo }" var="fvo" />
	<c:set value="${pldto.plvo }" var="plvo" />


	<div class="main-container">
		<div class="main-body">
			<div class="main-item">
				<div class="item-head">
					<h2>결제내역</h2>
				</div>
				<c:forEach items="${ollList }" var="ollList">
					<div class="item-reserve">
						<div class="item-img">
							<img class="listImg"
								src="/product_upload/${fn:replace(ollList.pfSaveDir,'-','/')}/${ollList.pfUuid}_${ollList.pfName}">
						</div>

						<div class="item-info">
							<div class="no">
								<dl>
									<dt>예약번호</dt>
									<dd>${ollList.orderNum }</dd>
								</dl>

								<dl>
									<dt>출발일</dt>
									<dd>${ollList.apArrival }</dd>
								</dl>
								<dl>
									<dt>도착일</dt>
									<dd>${ollList.apDeparture }</dd>
								</dl>
									<dl>
									<dt>여행지</dt>
									<dd>${ollList.pkName }</dd>
								</dl>
							</div>
							<div class="item-info-tit">
								<strong>${ollList.pkContent }</strong>
							</div>
							<div>
								<a class="prev-aa"
									href="/peyment/getList?orderNum=${ollList.orderNum}">
									<button type="button" class="payMentCancel site-btn">
										<span>상세보기</span>
									</button>

								</a>
							</div>
							<div class="item-price">
								<strong>${ollList.totalPrice}원</strong>
							</div>
						</div>

					</div>
				</c:forEach>
			</div>

			<!-- 페이지네이션 영역 ${ph.prev ? '' : 'disabled'} -->

			<div class="paging-container">
				<a class="prev-a" href="/peyment/OrderList?pageNo=${ph.pageStart-1}"><i
					id="${ph.prev eq false ? 'disable' : 'enable'}"
					class="fa-solid fa-circle-chevron-left"></i></a>
				<c:forEach begin="${ph.pageStart}" end="${ph.pageEnd}" var="i">
					<a href="/peyment/OrderList?pageNo=${i}"><span
						id="${ph.pageNo eq i ? 'selectNo' : ''}">${i}</span></a>
				</c:forEach>
				<a class="next-a" href="/peyment/OrderList?pageNo=${ph.pageEnd+1}"><i
					id="${ph.next eq false ? 'disable' : 'enable'}"
					class="fa-solid fa-circle-chevron-right"></i></a>
			</div>

		</div>




	</div>
	<div class="panel-item">
		<div class="tit">
			<h2 class="main-item">항공권 예약 내역</h2>
		</div>
		<div class="banner-box">
			<div class="text-head">
				온라인을 통해 항공권을 예약하신 고객께서는 <img class="aa"
					src="https://www.kyowontour.com/images/emoji/emoji-airplane-departure02.svg"
					alt="" style="width: 70px;"> 나의 항공권에서 확인이 가능합니다. <a><button
						type="button" class="btn-gradient-bottom">
						<span>나의 항공권</span>
					</button></a>

			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<script type="text/javascript">
		let pkVo = `<c:out value="${payDTO}" />`;
		let prev = `<c:out value="${ph.prev}" />`;
		let next = `<c:out value="${ph.next}" />`;
	</script>

	<script type="text/javascript" src="/resources/js/pagenation.js">
		
	</script>
</body>
</html>