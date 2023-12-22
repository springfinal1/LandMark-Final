<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/help/help.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.uvo.id" var="authId" />
		<sec:authentication property="principal.uvo.email" var="authEmail" />
		<sec:authentication property="principal.uvo.name" var="authName" />
		<sec:authentication property="principal.uvo.age" var="authAge" />
		<sec:authentication property="principal.uvo.authList" var="auths" />
	</sec:authorize>
	
	<div class="help-detail-container">
		<h1>문의사항</h1>
		<div>
			<form action="/help/coment" method="post">
				<table>
					<tr>
						<th>문의번호</th>
						<td>${hdto.helpNo}</td>
					</tr>
					<tr>
						<th>문의유형</th>
						<td>${hdto.type}</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${hdto.id}</td>
					</tr>
					<tr>
						<th>작성일</th>
						<td>${hdto.regDate}</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>${hdto.title}</td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea class="content-text" readonly="readonly">${hdto.content}</textarea></td>
					</tr>
					<tr>
						<th>답변여부</th>
						<td class="${hdto.answer eq 'y' ? 'answer-yes' : ''}">${hdto.answer eq 'n' ? '답변대기' : '답변완료'}</td>
					</tr>
					
					<!-- 답변영역 -->
					<tr class="answer-ok">
						<th>답변</th>
						<!-- 관리자만 답변가능 -->
						<c:choose>
							<c:when test="${auths.stream().anyMatch(authVO -> authVO.auth.equals('ROLE_ADMIN')).get()}">
							<td>
								<textarea name="coment">${hdto.coment}</textarea>
								<input type="hidden" name="helpNo" value="${hdto.helpNo}">
								<button type="submit" class="coment-btn">답변등록</button>
							</td>
							</c:when>
							<c:otherwise>
							<td>
								<c:if test="${not empty hdto.coment}">
									<textarea name="coment" readonly="readonly">${hdto.coment}</textarea>
								</c:if>
							</td>
							</c:otherwise>
						</c:choose>
					</tr>
					
				</table>
			</form>
		</div>

	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>