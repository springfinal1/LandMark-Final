<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/help/help.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<form action="/help/register" method="post" onsubmit="return validation()">
		<div class="help-register-container">
			<div>
				<h1>문의하기</h1>
			</div>
			<div>
				<div class="title">아이디<span class="required">*</span></div>
				<div class="input-box"><input type="text" name="id" value="${uvo.id}" readonly="readonly"></div>
			</div>
			<div>
				<div class="title">문의유형<span class="required">*</span></div>
				<div class="select-box">
				 	<span class="select-span">선택</span>
				 	<span><i class="fa-solid fa-angle-down" id="arrow"></i></span>
					<dl class="select-dl">
						<dd data-select="선택">선택</dd>
						<dd data-select="상품문의">상품문의</dd>
						<dd data-select="항공문의">항공문의</dd>
						<dd data-select="결제문의">결제문의</dd>
						<dd data-select="기타문의">기타문의</dd>
					</dl>
					<select style="display:none" class="type-select" name="type"></select>
					<div class="type-check"></div>
				</div>
			</div>
			<div>
				<div>
					<div class="title">제목<span class="required">*</span></div>
					<div class="input-box"><input type="text" id="title" name="title" placeholder="제목을 입력하세요."></div>
					<div class="title-check"></div>
				</div>
			</div>
			<div>
				<div class="title">문의내용<span class="required">*</span></div>
				<div class="input-box"><textarea id="content" class="content-textarea" name="content"></textarea></div>
				<div class="content-check"></div>
			</div>
			<div class="button-box">
				<span><a href="/"><button type="button">취소</button></a></span>
				<span><button type="submit" class="help-register-btn">확인</button></span>
			</div>
		</div>
	</form>
	
	<div class="modal-background">
		<div class="help-register-modal">
			<span class="material-symbols-outlined" id="confirm-btn">close</span>
			<span class="modal-text"></span>
			<span><button type="button" id="confirm-btn">확인</button></span>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
<script type="text/javascript" src="/resources/js/help/help.js"></script>
</html>