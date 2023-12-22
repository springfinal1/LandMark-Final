<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/product/product_register.css" rel="stylesheet">

</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<!-- 가격 , 지역 , 나라 , 축제 , 항공 , 호텔   -->
	<div class="product-container">
		<div class="product-register-form">	
			<form action="/product/register" method="post" enctype="multipart/form-data" class="product-form">
				<strong>상품등록</strong>
				
				<table class="product-table">
					<tr>
						<th>상품명</th>
						<td colspan="5"><input type="text" name="pkName" placeholder="상품명을 입력해주세요" class="product-input"></td>
					</tr>
					<tr>
						<th>상품내용</th>
						<td colspan="5"><textarea name="pkContent" class="product-text"></textarea></td>
					</tr>
					<tr>
						<th>비행기 가격</th>
						<td colspan="5"><input type="text" name="apPrice" placeholder="비행기 비용" class="product-input"></td>

					</tr>
					<tr>
						<th>출발일 </th>
						<td colspan="2"><input type="datetime-local" name="apArrival" class="local" id="apArrival"></td>
						<td colspan="1" class="arrivalDay"> 도착일</td>
						<td colspan="2"><input type="datetime-local" name="apDeparture" class="local" id="apDeparture"></td>
					</tr>
					<tr>
						<th>나라 / 지역 / 축제 / 축제 참여비용 / 테마</th>
						<td><input type="text" name="plCountry" placeholder="나라" class="product-input" id="country"></td>
						<td><input type="text" name="plName" placeholder="지역" class="product-input" id="place"></td>
						<td><input type="text" name="fvName" placeholder="축제" class="product-input" id="festival"></td>
						<td><input type="text" name="fvPrice" placeholder="축제 참여비용" class="product-input" id="festival-price"></td>
						<td>
							<select name="plContinent" class="product-continent">
									<option>--선택--</option>
								<optgroup label="축제">					
									<option value="유럽">유럽</option>
									<option value="아메리카">아메리카</option>
									<option value="동북아">동북아</option>
									<option value="동남아">동남아</option>
								</optgroup>
								<optgroup label="테마여행">
									<option value="이색휴양지">이색휴양지</option>
									<option value="아름다운도시">아름다운도시</option>
									<option value="커플여행">커플여행</option>
									<option value="럭셔리호캉스">럭셔리호캉스</option>
									<option value="일본료칸(온천)">일본료칸(온천)</option>
								</optgroup>
							</select>
						</td>
					</tr>
					<tr>
						<th>호텔명</th>
						<td colspan="2"><input type="text" name="htName" placeholder="호텔명" class="product-input" id="hotelName"></td>
						<td colspan="1" class="arrivalDay"> 비용</td>
						<td colspan="2"><input type="text" name="htPrice" placeholder="호텔 비용" class="product-input" id="hotel-price"></td>
					</tr>
					<tr>
						<th>이미지</th>
						<td>
							<input type="file" name="files" id="files" style="display:none" multiple="multiple">					
							<button type="button" id="trigger" class="imgBtn">이미지 추가하기</button>	
						</td>
						<td colspan="4"><div class="imgZone" id="imgZone"></div></td>
					</tr>
				</table>			
				
				<button type="submit" id="regBtn" class="regBtn">상품 등록</button>
			</form>		
		</div>
	</div>
			
	
<script type="text/javascript" src="/resources/js/product/triggerFile.js"></script>


</body>
</html>