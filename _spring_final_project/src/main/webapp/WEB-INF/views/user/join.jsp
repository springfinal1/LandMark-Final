<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
		
			<form action="/user/join" method="post" onsubmit="return validation()">
				<div class="inner-container">
					<div>
						<h1>회원가입</h1>
					</div>
					<div>
						<div class="title">아이디<span class="required">*</span></div>
						<div class="input-box id-input"><input type="text" id="id" name="id" autocomplete="off" placeholder="아이디를 입력하세요(영문+숫자 4자~8자)"><button id="checkId" type="button" disabled>중복확인</button></div>
						<div class="id-check"></div>
					</div>
					<div>
						<div class="title">비밀번호<span class="required">*</span></div>
						<div class="input-box"><input type="password" id="pwd" name="pwd" autocomplete="off" placeholder="비밀번호를 입력하세요(4자~8자)"></div>
						<div class="pwd-check"></div>
					</div>
					<div>
						<div class="title">비밀번호확인<span class="required">*</span></div>
						<div class="input-box"><input type="password" id="pwd2" name="pwd2" autocomplete="off" placeholder="비밀번호를 재입력하세요."></div>
						<div class="pwd-check2"></div>
					</div>
					<div>
						<div class="title">이름<span class="required">*</span></div>
						<div class="input-box"><input type="text" id="name" name="name" autocomplete="off" placeholder="이름을 입력하세요."></div>
						<div class="name-check"></div>
					</div>
					<div>
						<div class="title">나이<span class="required">*</span></div>
						<div class="input-box"><input id="age" type="text" name="age" placeholder="나이를 입력하세요(숫자)"></div>
						<div class="age-check"></div>
					</div>
					<div>
						<div class="title">연락처<span class="required">*</span></div>
						<div class="input-box"><input type="text" id="phone" name="phoneNumber" autocomplete="off" placeholder="연락처를 입력하세요(' - ' 제외 10자리~12자리)"></div>
						<div class="phone-check"></div>
					</div>
					<div>
						<div class="title">이메일<span class="required">*</span></div>
						<div class="input-box email-box">
							<input type="text" id="firstEmail" placeholder="이메일">@<input type="text" id="lastEmail" placeholder="직접입력">
							<input type="hidden" id="email" name="email">
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
						<div class="title">주소</div>
						<div class="input-box"><input type="text" id="address" name="address" autocomplete="off" placeholder="주소를 입력하세요."></div>
						<div class="address-check"></div>
					</div>
					<div class="button-box">
						<span><a href="/"><button type="button">취소</button></a></span>
						<span><button type="submit" class="join-btn">확인</button></span>
					</div>
				</div>
			</form>
			
			
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
<script type="text/javascript" src="/resources/js/user/user.js"></script>
<script type="text/javascript">
	let msg = `<c:out value = "${message}" />`;
	if(msg == 2){
		alert('비밀번호를 입력해 주세요.');
	} else if(msg == 3){
		alert('이미 존재하는 ID 입니다.')
	} else if(msg == 4){
		alert("필수 항목을 입력해 주세요.")
	}
</script>

</html>