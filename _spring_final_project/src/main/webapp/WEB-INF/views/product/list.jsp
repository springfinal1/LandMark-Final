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
<link rel="stylesheet" href="/resources/css/product/product_list.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	 
	 
	 
	<div class="product-container">
		<div class="sub-container">
			
			<div class="place-container">
			<!-- 서치라인 -->
			<c:choose>
				<c:when test="${type eq 1}">
					<div class="place-h2">
						<h2>
							<a href="#" id="placeAll">지역보기</a>
						</h2>		
					</div>
					
					<div class="placeDiv" id="placeDiv">
					
						<div class="place-drop-menu">
							<span><a href="/product/list?pkContinent=동북아">동북아</a></span>
							<span><a href="/product/list?pkContinent=동남아">동남아</a></span>
							<span><a href="/product/list?pkContinent=유럽">유럽</a></span>		
							<span><a href="/product/list?pkContinent=아메리카">남미/중미/북미</a></span>												
						</div>		
					</div>
				</c:when>
				<c:when test="${type eq 2}">
					<div class="place-h2">
						<h2>
							<a href="#" id="placeAll">테마보기</a>
						</h2>		
					</div>
					
					<div class="placeDiv" id="placeDiv">
					
						<div class="place-drop-menu">
							<span><a href="/product/list?pkContinent=이색휴양지">이색 휴양지</a></span>
							<span><a href="/product/list?pkContinent=아름다운도시">아름다운 도시</a></span>
							<span><a href="/product/list?pkContinent=커플여행">커플 여행</a></span>
							<span><a href="/product/list?pkContinent=럭셔리호캉스">럭셔리 호캉스</a></span>
							<span><a href="/product/list?pkContinent=일본료칸(온천)">일본 료칸(온천)</a></span>						
						</div>		
					</div>
				</c:when>
			</c:choose>
			</div>
			
			
			 
			
			
			
	<c:choose>
		<c:when test="${pldto ne null }">
			<!-- 리스트  -->
			<div class="product-list-container">			
				<c:forEach items="${pldto }" var="pldto">

						<input type="hidden" value="${pldto.packvo.pkNo }" name="pkNo"> 
						<input type="hidden" id="textNumber" value="${pldto.packvo.pkNo }">

					<div class="itemBox">										
						<div class="imgZone">
							<c:forEach items="${pldto.pfList }" var="pfList">
								<img class="listImg" src="/product_upload/${fn:replace(pfList.pfSaveDir,'-','/')}/${pfList.pfUuid}_${pfList.pfName}">
							</c:forEach>
						</div>							
						<div class="textDiv">
							<div class="list-product">
							
								<div>
									<h5 class="airdate"><i class="fa-solid fa-hashtag" id="dateZone-i"></i>상품명</h5>
									${pldto.packvo.pkName }
								</div>
								
								<div id="countryZone">
									<h5 class="airdate">
									<i class="fa-solid fa-location-dot" id="countryZone-i"></i>지역</h5>
									${pldto.plvo.plCountry }
								</div>
							
								<div id="airZone">						
									<h5 class="airdate"><span class="material-symbols-outlined" id="airZone-i">calendar_month</span>출발기간</h5>
									${pldto.avo.apArrival } ~ ${pldto.avo.apDeparture }
								</div>
							</div>
							<div class="list-price">
								<div class="list-price-heart">
									<div>
										가격
									</div>
									<div>									
										<i class="fa-solid fa-heart heart-btn" id="heartBtn" data-heart="${pldto.packvo.pkNo }"></i>								
									</div>
								</div>
								<div class="list-product-price"><fmt:formatNumber value="${pldto.packvo.pkPrice}" pattern="#,###"/> 원</div>
								<div>
									<a href="/product/detail?pkNo=${pldto.packvo.pkNo }"><button type="button" class="detailBtn">자세히보기</button></a>
								</div>
							</div>
						</div>					
					</div>			
				</c:forEach>
				
			</div>
			</c:when>
			<c:when test="${pldto eq null }">
				<div class="noProduct">
					<div>
						<span class="material-symbols-outlined">production_quantity_limits</span>
						<h2>등록된 상품이 없습니다.</h2>
					</div>
				</div>
			</c:when>
			</c:choose>
		</div>
	</div>
	 
	
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

<script type="text/javascript">
	let idVal=`<c:out value='${uvo.id}'/>`;
</script>

<script type="text/javascript" src="/resources/js/product/product_list.js"></script>

<script type="text/javascript">
	if(idVal != null){
		openFunction();
	}else{
		alret("로그인후 이용해주세요");
	}
</script>


</body>
</html>