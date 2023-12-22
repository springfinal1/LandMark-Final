<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
		
		<div class="list-container">
			<div><h1>회원목록</h1></div>
			<div class="table-box">
				<div>
					<span>ID</span>
					<span>회원등급</span>
					<span>포인트</span>
					<span>이름</span>
					<span>나이</span>
					<span>이메일</span>
					<span>연락처</span>
					<span>주소</span>
				</div>
				<c:forEach items="${udtoList}" var="udto">
				<div>
					<span>${udto.id}</span>
					<span>${empty udto.grade ? '브론즈' : udto.grade}</span>
					<span>${udto.point}</span>
					<span>${udto.name}</span>
					<span>${udto.age}</span>
					<span>${udto.email}</span>
					<span>${udto.phoneNumber}</span>
					<span>${udto.address}</span>
				</div>
				</c:forEach>
			</div>
			
			<!-- 페이지네이션 영역 ${ph.prev ? '' : 'disabled'} -->
			<div class="paging-container">
				<a class="prev-a" href="/user/list?pageNo=${ph.pageStart-1}"><i id="${ph.prev eq false ? 'disable' : 'enable'}" class="fa-solid fa-circle-chevron-left"></i></a>
				<c:forEach begin="${ph.pageStart}" end="${ph.pageEnd}" var="i">
				<a href="/user/list?pageNo=${i}"><span id="${ph.pageNo eq i ? 'selectNo' : ''}">${i}</span></a>
				</c:forEach>
				<a class="next-a" href="/user/list?pageNo=${ph.pageEnd+1}"><i id="${ph.next eq false ? 'disable' : 'enable'}" class="fa-solid fa-circle-chevron-right"></i></a>
			</div>
			
		</div>
			
			
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
<script type="text/javascript">
	let uvoVal = `<c:out value="${uvo}" />`;
	let prev = `<c:out value="${ph.prev}" />`;
	let next = `<c:out value="${ph.next}" />`;
</script>
<script type="text/javascript" src="/resources/js/pagenation.js"></script>


</html>