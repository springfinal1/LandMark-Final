<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/freetour/theme.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<div class="theme-container">
		<div class="theme-sub-container">
			<div class="search-theme">
				<strong>검색결과</strong>
				<span class="themeName">여기 테마넣기</span>
			</div>
			
			<div class="theme-div">
				<ul class="themeType">
					<li class="theme-1">
						<div class="theme-a">
							<div>
								<!-- 설명  -->
								<strong class="theme-info-1 theme-strong"></strong>
								<!-- 나라이름 -->
								<span class="theme-country-1 theme-span"></span>
							</div>
						</div>
					</li>
					<li class="theme-2">
						<div class="theme-a">
							<div>
								<!-- 설명  -->
								<strong class="theme-info-2 theme-strong"></strong>
								<!-- 나라이름 -->
								<span class="theme-country-2 theme-span"></span>
							</div>
						</div>
					</li>
					<li class="theme-3">
						<div class="theme-a">
							<div>
								<!-- 설명  -->
								<strong class="theme-info-3 theme-strong"></strong>
								<!-- 나라이름 -->
								<span class="theme-country-3 theme-span"></span>
							</div>
						</div>
					</li>
					<li class="theme-4">
						<div class="theme-a">
							<div>
								<!-- 설명  -->
								<strong class="theme-info-4 theme-strong"></strong>
								<!-- 나라이름 -->
								<span class="theme-country-4 theme-span"></span>
							</div>
						</div>
					</li>
					<li class="theme-5">
						<div class="theme-a">
							<div>
								<!-- 설명  -->
								<strong class="theme-info-5 theme-strong"></strong>
								<!-- 나라이름 -->
								<span class="theme-country-5 theme-span"></span>
							</div>
						</div>
					</li>
					<li class="theme-6">
						<div class="theme-a">
							<div>
								<!-- 설명  -->
								<strong class="theme-info-6 theme-strong"></strong>
								<!-- 나라이름 -->
								<span class="theme-country-6 theme-span"></span>
							</div>
						</div>
					</li>						
				</ul>
			</div>
		</div>
	</div>
	
	
	
	
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
<script type="text/javascript">
	let themeTag = `<c:out value="${type}"/>`;
</script>
<script type="text/javascript" src="/resources/js/freetour/theme.js"></script>
</body>
</html>