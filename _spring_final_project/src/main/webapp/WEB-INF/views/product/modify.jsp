<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/product/product_register.css" rel="stylesheet">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<c:set value="${pldto.packvo }" var="packvo"/>
	<c:set value="${pldto.pfList }" var="pfList"/>
	<c:set value="${pldto.avo }" var="avo"/>
	<c:set value="${pldto.hvo }" var="hvo"/>
	<c:set value="${pldto.fvo }" var="fvo"/>
	<c:set value="${pldto.plvo }" var="plvo"/>


	<div class="product-container">
		<div class="product-register-form">	
			<form action="/product/modify" method="post" enctype="multipart/form-data">
			<strong>상품수정</strong>				
					<table class="product-table">
						<tr>
							<th>상품명</th>
							<td colspan="5"><input type="text" name="pkName" placeholder="상품명을 입력해주세요" class="product-input" value="${packvo.pkName }"></td>
						</tr>
						<tr>
							<th>상품내용</th>
							<td colspan="5"><textarea name="pkContent" class="product-text">${packvo.pkContent }</textarea></td>
						</tr>
						<tr>
							<th>비행기 가격</th>
							<td colspan="5"><input type="text" name="apPrice" placeholder="비행기 비용" class="product-input" value="${avo.apPrice }"></td>
						</tr>
						<tr>
							<th>출발일 / 도착일</th>
							<td colspan="2"><input type="datetime-local" name="apArrival" class="local" id="apArrival" value="${avo.apArrival }"></td>
							<td colspan="2"><input type="datetime-local" name="apDeparture" class="local" id="apDeparture" value="${avo.apDeparture }"></td>
						</tr>
						<tr>
							<th>나라 / 지역 / 축제 / 축제 참여비용 / 대륙</th>
							<td><input type="text" name="plCountry" placeholder="나라" class="product-input" id="country" value="${plvo.plCountry }"></td>
							<td><input type="text" name="plName" placeholder="지역" class="product-input" id="place" value="${plvo.plName }"></td>
							<td><input type="text" name="fvName" placeholder="축제" class="product-input" id="festival" value="${fvo.fvName }"></td>
							<td><input type="text" name="fvPrice" placeholder="축제 참여비용" class="product-input" id="festival-price" value="${fvo.fvPrice }"></td>
							<td>
								<select name="plContinent" class="product-continent">
									<option>선택</option>
									<option value="유럽">유럽</option>
									<option value="아메리카">아메리카</option>
									<option value="동북아">동북아</option>
									<option value="동남아">동남아</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>호텔명 / 비용</th>
							<td colspan="2"><input type="text" name="htName" placeholder="호텔명" class="product-input" id="hotelName" value="${hvo.htName }"></td>
							<td colspan="2"><input type="text" name="htPrice" placeholder="호텔 비용" class="product-input" id="hotel-price" value="${hvo.htPrice }"></td>
						</tr>
						<tr>
							<th>이미지</th>
							<td>
								<input type="file" name="files" id="files" style="display:none" multiple="multiple">					
								<button type="button" id="trigger" class="imgBtn">이미지</button>	
							</td>
							<td colspan="4"><div class="imgZone" id="imgZone"></div></td>
						</tr>
					</table>			
					<input type="hidden" name="pkNo" value="${packvo.pkNo }">
					
					<button type="submit" id="regBtn" class="regBtn">상품 수정</button>
			</form>
		</div>
	</div>
	
<script type="text/javascript" src="/resources/js/product/triggerFile.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>