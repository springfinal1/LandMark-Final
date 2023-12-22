<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/event/EventRegister.css" rel="stylesheet">
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
	
	<form action="/event/eventModify" method="post">
	<div class="container">

		<ul class="tabs">
			<li class="tab-link current" data-tab="tab-1" id="tab-1li">이벤트 종류 선택</li>
			<li class="tab-link" data-tab="tab-2" id="tab-2li">설정</li>
		</ul>

		<div id="tab-1" class="tab-content current">
			<div class="sub-container">
				<div class="sub current">
					<div data-event="rouletteEv" class="rouletteEv"><i class="fa-solid fa-ticket"></i></div>
					<p>룰렛형</p>
					<small>사용자가 경품내용을 알 수 있습니다.</small>
				</div>
				<div class="sub current">
					<div data-event="AttendanceEv" class="AttendanceEv"><i class="fa-solid fa-calendar-days"></i></div>
					<p>출석체크형</p>
					<small>사용자가 하루에 한번 출석체크합니다. </small>
				</div>
				<div class="sub current">
					<div data-event="prboxEv" class="prboxEv"><i class="fa-solid fa-gift"></i></div>
					<p>선물상자형</p>
					<small>사용자가 경품내용을 알 수 없습니다. 입력한 혜택이 랜덤으로 사용자에게 지급됩니다.</small>
				</div>
			</div>
			<div class="tab1-low">
				<button type="button" class="nextButton">다음</button>
			</div>
			
		</div>
		<div id="tab-2" class="tab-content">
			<div>
				<label>1. 제목</label>
				<input type="text" name="evName" id="evName" value=${evo.evName }>
			</div>
			<div>
				<label>2. 기간</label>
				<input type="datetime-local" name="evStart" id="evStart" value="${evo.evStart }"> ~
				<input type="datetime-local" name="evEnd" id="evEnd" value="${evo.evEnd }">
			</div>
			<div style="display: none;">
				<select name="evType" id="evSelec">
						<option>선택...</option>
						<option value="prboxEv" >선물상자</option>
						<option value="rouletteEv">룰렛</option>
						<option value="AttendanceEv">출석체크</option>
				</select >
				<input name="evNo" value="${evo.evNo }">
			</div>
			<div>
				<label>3. 내용</label>
				<textarea id="summernote" name="evContent">${evo.evContent }</textarea>
			</div>
			<div class="tab2-low">
				<button type="button" class="prevButton">이전</button>
				<button class="submitButton" type="submit">등록</button>
			</div>
		</div>
		

	</div>
		
</form>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

	<script type="text/javascript" src="/resources/js/review/summernote.js"></script>
	<script type="text/javascript">
	function uploadImage(file) {
		var formData = new FormData();
		formData.append('file', file);

		$.ajax({
			url : '/event/image',
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
	<script type="text/javascript">
		let evType=`<c:out value='${evo.evType}'/>`;
	</script>
<script type="text/javascript"
		src="/resources/js/event/EventRegister.js"></script>
		 <script type="text/javascript">
			selectEvent(evType);
		</script>
</body>
</html>