<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/review/ReviewDetail.css" rel="stylesheet">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<!-- <div class="detail-container"> -->
	<div class="detail-delmod-div">
		<a href="/review/remove?rvNo=${rvo.rvNo}">
			<i class="fa-solid fa-trash"></i>삭제
		</a>
		<a href="/review/modify?rvNo=${rvo.rvNo}">
			<i class="fa-solid fa-pencil"></i>수정
		</a>
	</div>

	<div class="detail-head-div">
		<h3>${rvo.title}</h3>
		
		<div class="head-text-div">
			<div>
				<span>${rvo.id}</span>
			</div>
		
			<div>
				<span>조회수:${rvo.readCount}</span>
				<span><a href="#ReviewCmtArea" id="cmtCount"></a></span>
				<span id="headLikeSpan">좋아요 </span>
				<span>${rvo.regAt}</span>
			</div>
		</div>
	</div>
	
	<div class="detail-middle-div">
	
		<div id="contentArea">
			${rvo.content}
		</div>
	</div>
	<!-- 좋아요 영역 -->
	<div class="recommend-div">
				<button type="button" id="like">
					<img src="/resources/image/review-image/love.png">
					<span id="likeSpan"></span>
				</button>
	</div>
	
	<!-- 댓글 영역 -->
	<div class="review-comment-container">
		<!-- 댓글 표시 영역 -->
		<div id="ReviewCmtArea"></div>
	
	
		<!-- 댓글 등록 영역 -->
		<div class="comment-write-div">
			<div>
				<span id="cmtWriter" >${uvo.id}</span> 		
			</div>
			<div class="cmt-input-div">
				<textarea rows="10" cols="30" id="cmtText"></textarea>
				<button  type="button" id="cmtPostBtn">등록</button>	
			</div>
		</div>
	</div>
	<div></div>
	


	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	
	<script type="text/javascript">
		let rnoVal=`<c:out value='${rvo.rvNo}'/>`;
		let idVal=`<c:out value='${uvo.id}'/>`;
		console.log('rnoVal:'+rnoVal+',idVal:'+idVal);
	</script>
	
	<script type="text/javascript" src="/resources/js/review/ReviewLike.js"></script>
	<script type="text/javascript" src="/resources/js/review/ReviewComment.js"></script>
	
	<script type="text/javascript">
		getCommentList(rnoVal);
		UserLikeDisplay();
		spreadCommentCount(rnoVal);
		spreadLikeCount(rnoVal);
	</script>
	
	<script type="text/javascript">
	function autoResize(textarea) {
		  textarea.style.height = 'auto';
		  textarea.style.height = textarea.scrollHeight + 'px';
		}
	</script>
	

</body>
</html>