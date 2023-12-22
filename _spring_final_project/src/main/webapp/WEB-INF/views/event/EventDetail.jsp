<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/event/EventDetail.css" rel="stylesheet">
<link href="/resources/css/event/AttendenceEvent.css" rel="stylesheet">
<link href="/resources/css/event/Roulette.css" rel="stylesheet">
<link
   href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.css'
   rel='stylesheet' />
<link
   href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.print.css'
   rel='stylesheet' media='print' />
   
<!-- <link href="/resources/css/event/Roulette.css"> -->
<style type="text/css">
@font-face {
   font-family: 'Orbit-Regular';
   src:
      url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2310@1.0/Orbit-Regular.woff2')
      format('woff2');
   font-weight: normal;
   font-style: normal;
}

canvas {
   /* font-family: Pretendard; */
   font-family: Orbit-Regular;
}
</style>
</head>
<body>
      <sec:authorize access="isAuthenticated()">
      <sec:authentication property="principal.uvo.id" var="authId" />
      <sec:authentication property="principal.uvo.email" var="authEmail" />
      <sec:authentication property="principal.uvo.name" var="authName" />
      <sec:authentication property="principal.uvo.age" var="authAge" />
      <sec:authentication property="principal.uvo.phoneNumber" var="authPhoneNumber" />
      <sec:authentication property="principal.uvo.authList" var="auths" />
      </sec:authorize>
   <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
   <div class="event-detail-container">
      <div class="event-tap">
         <div class="event-tap-side">
            <ul>
               <li><a href="/event/OneventList" class="event-show" id="on">진행중인
                     이벤트<span>></span>
               </a></li>
               <li><a href="/event/LasteventList" class="event-show"
                  id="last">지난 이벤트<span>></span></a></li>
               <li><a href="/event/OneventList" class="event-list-show">목록보기<span>></span></a>
               </li>
            </ul>
         </div>
      </div>

      <div class="event-detail-div">
         <div>
            <div class="event-detail-title">${evo.evName }</div>
            <div class="event-detail-period">${evo.evStart }~${evo.evEnd}</div>
         </div>
         <div class="event-detail-content" id="contentArea">
            ${fn:replace(evo.evContent,'\\','/')}</div>
         <div class="button-box">
            <button class="play-event">이벤트 참여하기</button>
            <c:if test="${auths.stream().anyMatch(authVO -> authVO.auth.equals('ROLE_ADMIN')).get()}">
               <div class="event-edit">
                  <a href="/event/eventModify?evNo=${evo.evNo}"><button type="button">수정</button></a>
                  <a href="/event/eventRemove?evNo=${evo.evNo}"><button type="button">삭제</button></a>
               </div>
            </c:if>
         </div>
      </div>


      <div class="play-div">
         <button class="close-playdiv-btn"><i class="fa-solid fa-x"></i></button>
         <c:if test="${evo.evType eq 'rouletteEv' }">
            <div class="roulette-div">
               <div>
                  <div class="canvas-box">
                     <i class="fa-solid fa-caret-down fa-xl"></i>
                     <canvas width='650' height='650'></canvas>
                  </div>
                  <div class="moving-box">
                     <i class="fa-solid fa-backward" id="play"></i>
                     <button onclick="rotate()" id="roulette-btn">룰렛 돌리기</button>
                  </div>
               </div>
            </div>
         </c:if>
         <c:if test="${evo.evType eq 'AttendanceEv'}">
            <div class="attendence-div">
               <ul class="attendence-ul">
                  <c:forEach begin="1" end="${atvo.maxAttendanceCount}" var="i">
                     <li data-atcnt="${i}" class="attendence-content-li">
                        <img src="/resources/image/event-image/Nat.jpg" id="attendence-content${i}">
                     </li>
                  </c:forEach>
               </ul>
               <a href="/event/attendance?id=${uvo.id}&evNo=${evo.evNo}" class="attendanceBtn"><button class="abtn">출석하기</button></a>
            </div>
         </c:if>
      </div>
   </div>
   <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
   
   
   <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
   <script type="text/javascript">
      let uid = `<c:out value='${uvo.id}'/>`;
      let evType = `<c:out value='${evo.evType}'/>`;
      let evNo = `<c:out value='${evo.evNo}'/>`;
      let endDate=`<c:out value='${evo.evEnd}'/>`;
      /* let maxAttendanceCount = `<c:out value='${atvo.maxAttendanceCount}'/>`; */
      let msg = `<c:out value='${msg}'/>`;
      if (msg == "attendanced")
         alert('이미 출석했습니다.');
      console.log(evType);
   </script>
   <script type="text/javascript" src="/resources/js/event/EventDetail.js"></script>
   <script type="text/javascript" src="/resources/js/event/AttendanceEvent.js"></script>
   <script type="text/javascript" src="/resources/js/event/RouletteEvent.js"></script>
   <script type="text/javascript">
      printAttendanceContent();
   </script>

</body>
</html>