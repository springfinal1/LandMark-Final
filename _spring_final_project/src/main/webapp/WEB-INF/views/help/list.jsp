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
	
	<div class="help-list-container">
		<h1>문의내역</h1>
		<div>
			<c:set value="${param.answer}" var="answer" />
			<form action="/help/list">
				<div class="search-box">
					<select name="answer" class="answer-select">
						<option ${answer eq '' ? 'selected' : ''} value="">전체내역</option>
						<option ${answer eq 'y' ? 'selected' : ''} value="y">답변완료</option>
						<option ${answer eq 'n' ? 'selected' : ''} value="n">답변대기</option>
					</select>
					<input type="hidden" name="pageNo" value="1" >
					<button class="button search-button" type="submit">검색</button>
				</div>
			</form>
			<table>
				<tr>
					<th>문의번호</th>
					<th>문의유형</th>
					<th>작성자</th>
					<th>제목</th>
					<th>답변여부</th>
					<th>작성일</th>
				</tr>
				<c:forEach items="${hList}" var="hList">
				<tr data-helpNo="${hList.helpNo}" class="inquiryHistory-item">
					<td>${hList.helpNo}</td>
					<td>${hList.type}</td>
					<td>${hList.id}</td>
					<td><a href="/help/detail?helpNo=${hList.helpNo}">${hList.title}</a></td>
					<td class="${hList.answer eq 'y' ? 'answer-yes' : ''}">${hList.answer eq 'n' ? '답변대기' : '답변완료'}</td>
					<td>${hList.regDate}</td>
				</tr>
				</c:forEach>
				<c:if test="${empty hList}">
				<tr>
					<td colspan="6">문의내역이 없습니다.</td>
				</tr>
				</c:if>
			</table>
		</div>
		
		<!-- 페이지네이션 영역 -->
		<div class="paging-container">
			<a class="prev-a" href="/help/list?pageNo=${ph.pageStart-1}&answer=${param.answer}"><i id="${ph.prev eq false ? 'disable' : 'enable'}" 
				class="fa-solid fa-circle-chevron-left"></i></a>
			<c:forEach begin="${ph.pageStart}" end="${ph.pageEnd}" var="i">
			<a href="/help/list?pageNo=${i}&answer=${param.answer}"><span id="${ph.pageNo eq i ? 'selectNo' : ''}">${i}</span></a>
			</c:forEach>
			<a class="next-a" href="/help/list?&pageNo=${ph.pageEnd+1}&answer=${param.answer}"><i id="${ph.next eq false ? 'disable' : 'enable'}" 
				class="fa-solid fa-circle-chevron-right"></i></a>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	
	<script type="text/javascript">
		let prev = `<c:out value="${ph.prev}" />`;
		let next = `<c:out value="${ph.next}" />`;
	</script>
	<script type="text/javascript" src="/resources/js/pagenation.js"></script>
</body>
</html>