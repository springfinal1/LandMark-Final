<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
		
			<form action="/user/modify" method="post" onsubmit="return validation()">
				<div class="inner-container">
					<div>
						<h1>회원정보수정</h1>
					</div>
					<div>
						<div class="title">아이디<span class="required"></span></div>
						<div class="input-box"><input type="text" id="id" name="id" autocomplete="off" value="${uvo.id}" readonly="readonly"></div>
						<div class="id-check"></div>
					</div>
					<div>
						<div class="input-box"><input class="update-btn" type="button" id="pwdModifyBtn" value="비밀번호 수정"></div>
					</div>
					<div id="hidden" class="pwd-box">
						<div class="title">비밀번호<span class="required">*</span></div>
						<div class="input-box"><input type="password" id="pwd" name="pwd" autocomplete="off" placeholder="비밀번호를 입력하세요(4자~8자)"></div>
						<div class="pwd-check"></div>
					</div>
					<div id="hidden" class="pwd-box">
						<div class="title">비밀번호확인<span class="required">*</span></div>
						<div class="input-box"><input type="password" id="pwd2" name="pwd2" autocomplete="off" placeholder="비밀번호를 재입력하세요."></div>
						<div class="pwd-check2"></div>
					</div>
					<div>
						<div class="input-box"><input class="update-btn" type="button" id="nameModifyBtn" value="이름 수정"></div>
					</div>
					<div id="hidden" class="name-box">
						<div class="title">이름<span class="required">*</span></div>
						<div class="input-box"><input type="text" id="name" name="name" autocomplete="off" value="${uvo.name}"></div>
						<div class="name-check"></div>
					</div>
					<div>
						<div class="input-box"><input class="update-btn" type="button" id="ageModifyBtn" value="나이 수정"></div>
					</div>
					<div id="hidden" class="age-box">
						<div class="title">나이<span class="required">*</span></div>
						<div class="input-box"><input id="age" type="text" name="age" value="${uvo.age}"></div>
						<div class="age-check"></div>
					</div>
					<div>
						<div class="input-box"><input class="update-btn" type="button" id="phoneModifyBtn" value="연락처 수정"></div>
					</div>
					<div id="hidden" class="phone-box">
						<div class="title">연락처<span class="required">*</span></div>
						<div class="input-box"><input type="text" id="phone" name="phoneNumber" autocomplete="off" value="${uvo.phoneNumber}" placeholder="연락처를 입력하세요(' - ' 제외 10자리~12자리)"></div>
						<div class="phone-check"></div>
					</div>
					<div>
						<div class="input-box"><input class="update-btn" type="button" id="emailModifyBtn" value="이메일 수정"></div>
					</div>
					<div id="hidden" class="email-box">
						<div class="title">이메일<span class="required">*</span></div>
						<div class="input-box email-box">
							<input type="text" id="firstEmail" placeholder="이메일" value="${fn:substringBefore(uvo.email, '@')}">@
							<input type="text" id="lastEmail" placeholder="직접입력" value="${fn:substringAfter(uvo.email, '@')}">
							<input type="hidden" id="email" name="email" value="${uvo.email}">
							<select id="emailSelect" name="select">
								<option value="">직접입력
								<option value="google.com">google.com
								<option value="naver.com">naver.com
								<option value="nate.com">nate.com
								<option value="hotmail.com">hotmail.com
							</select>
						</div>
						<div class="email-check"></div>
					</div>
					<div>
						<div class="input-box"><input class="update-btn" type="button" id="addressModifyBtn" value="주소 변경"></div>
					</div>
					<div id="hidden" class="address-box">
						<div class="title">주소</div>
						<div class="input-box"><input type="text" id="address" name="address" autocomplete="off" placeholder="주소를 입력하세요." value="${uvo.address}"></div>
						<div class="address-check"></div>
					</div>
					<div class="button-box" id="button-box">
						<span><a href="/"><button type="button">취소</button></a></span>
						<span><button type="submit" class="modify-btn">확인</button></span>
					</div>
					<span>
						<a id="userDelete">회원탈퇴 >></a>
					</span>
				</div>
			</form>
			<!-- 회원탈퇴 확인 모달 -->
			<div class="userDelete-background">
				<div class="userDelete-modal">
					<span class="material-symbols-outlined close-btn">close</span>
					<span class="modal-text"></span>
					<span><button type="button" id="confirmBtn" class="close-btn">확인</button></span>
				</div>
			</div>
			
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
<script type="text/javascript" src="/resources/js/user/modify.js"></script>
</html>