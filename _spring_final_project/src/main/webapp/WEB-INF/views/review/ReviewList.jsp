<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/review/ReviewList.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	
	<div class="list-head-div">
		<h2>Review</h2>
		<p>소중한 고객님의 후기를 기다립니다.</p>
	</div>
	
	
		<!-- 검색라인 -->
			<form action="/review/reviewList" method="get" >
				<div class="search-div">
				<c:set value="${ph.pgvo.type}" var="typed"></c:set>
				
				<select name="type" class="review-search-select">
					<option ${typed eq null ? 'selected':''}>Choose...</option>
					<option value="t" ${typed eq "t" ? 'selected':''}>제목</option>
					<option value="c" ${typed eq "c" ? 'selected':''}>내용</option>
					<option value="tc" ${typed eq "tc" ? 'selected':''}>제목+내용</option>
				</select> 
				
				<input type="text" name="keyword" class="search-input"
					placeholder="검색어를 입력하세요"> 
				<input type="hidden"
					value="${ph.pgvo.qty}"> 
				<input type="hidden" value="1">
				
				<button type="submit" class="searchBtn">
					<span class="material-symbols-outlined">search</span>
				</button>
				</div>
			</form>
			
		<div class="middle-div">
			<div class="totalcount-div">
				<span>총 ${ph.totalCount}건</span>
				<span>
					<a href="/review/reviewList">
						<button type="button" class="best-btn">
							전체 게시글
						</button>
					</a>
				</span>
				<span>
					<a href="/review/BestReview">
						<button type="button" class="best-btn">
							<i class="bi bi-hand-thumbs-up"></i>
							BEST 게시글
						</button>
					</a>
				</span>
			</div>
		
			<c:forEach items="${list}" var="rvo">
				<div class="review-list">
					<div class="review-list-text">
						<div class="review-title-div">
							<a href="/review/reviewDetail?rvNo=${rvo.rvNo}" class="review-title-a">
								<c:if test="${fn:contains(rvo.secret, 'Y')}">
									<i class="fa-solid fa-lock"></i>
								</c:if>
								${fn:contains(rvo.secret, 'Y') ? '비밀글입니다':rvo.title}
							</a>
							<div class="review-list-content">
								${rvo.content}
							</div>
							<div class="review-list-detail">
					 			<span>${rvo.id}</span> 
								<span>${rvo.regAt}</span>
							</div>
						</div>
					</div>
					
					<c:if test="${rvo.thumbnail ne null }">
						<div class="review-list-image">
							<img src="${rvo.thumbnail}">
						</div>
					</c:if>
					
				</div>
			</c:forEach>
		</div>

		<!-- 페이징 라인 -->
		<div class="pagingContainer">
			<c:if test="${ph.prev}">
				<a href="/review/reviewList?pageNo=${ph.startPage-1}&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}" class="prev-a">
					<button type="button">
						<i class="bi bi-caret-left"></i>
					</button>
				</a>
			</c:if>
			
			<c:forEach begin="${ph.startPage}" end="${ph.endPage}" var="i">
				<a href="/review/reviewList?pageNo=${i}&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}">
					<span id="${ph.pgvo.pageNo eq i ? 'selectNo' : ''}">${i}</span>
				</a>
			</c:forEach>
			
			<c:if test="${ph.next}">
				<a href="/review/reviewList?pageNo=${ph.endPage+1}&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}" class="next-a">
					<button type="button">
						<i class="bi bi-caret-right"></i>
					</button>
				</a>
			</c:if>
			<div class="paging-div">
				<a href="/review/reviewRegister">
					<i class="bi bi-pencil" id="pencil"></i>
					작성하기
				</a>
			</div>
		</div>
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	
	<script type="text/javascript">
		let msg = `<c:out value='${msg}'/>`;
		console.log(msg);
		if (msg == "secret")
			alert('비밀글입니다.');
	</script>
	<script type="text/javascript" src="/resources/js/pagenation.js"></script>
</body>
</html>