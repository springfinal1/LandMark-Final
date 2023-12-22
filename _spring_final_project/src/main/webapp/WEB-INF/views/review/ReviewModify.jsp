<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/review/ReviewRegister.css" rel="stylesheet">
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<form action="/review/modify" method="post">
			<div class="title-div">
				<div>제목</div>
				<input type="text" name="title" class="inp" value="${rvo.title}">
			</div>
			
			<div class="write-div">
				<textarea id="summernote" name="content">${rvo.content}</textarea>
			</div>
			
			<input type="hidden" value="${rvo.rvNo}" name="rvNo">
			<input type="hidden" name="id" value="${uvo.id}">
			
			<div class="secret-div">
				<input type="checkbox" name="secret" value="Y">
				<span>비밀글로 작성하시겠습니까?</span>
			</div>
		
			<button type="submit" class="submit">수정</button>
		</form>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

	<script type="text/javascript" src="/resources/js/review/summernote.js"></script>
	<script type="text/javascript">
		function uploadImage(file) {
			var formData = new FormData();
			formData.append('file', file);

			$.ajax({
				url : '/review/image',
				method : 'POST',
				data : formData,
				contentType : false,
				processData : false,
				enctype : 'multipart/form-data',
				success : function(url) {
					console.log('Image uploaded successfully. URL:', url);
					var imgTag = '<img src="' + url + '" />';
					$('#summernote').summernote('pasteHTML', imgTag);
				},
				error : function() {
					console.error('Error uploading image');
				}
			});
		}
	</script>

</body>
</html>