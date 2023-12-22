<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<link href="/resources/css/common.css" rel="stylesheet">
<link href="/resources/css/input.css" rel="stylesheet">
<link href="/resources/css/user/user.css" rel="stylesheet">
<title>Insert title here</title>
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
   <div class="all-container">

         <!-- 네비바 영역 -->
      <header class="header-container">
         
         <!-- 메인로고 -->
         <div class="main-logo">
            <a href="/">
               <img alt="" src="/resources/image/main-logo/landmark-logo2.png">
            </a>
         </div>
         <div class="nav-menu">
               <!-- 여행 메뉴 -->
            <dl class="drop-menu">	
               <dd><a href="#">축제즐기기</a>
                  <dl class="sub-menu">
                     <dd><a href="/product/list/?pkContinent=동북아" class="festival">동북아</a></dd>
                     <dd><a href="/product/list/?pkContinent=동남아" class="festival">동남아</a></dd>
                     <dd><a href="/product/list/?pkContinent=유럽" class="festival">유럽</a></dd>
                     <dd><a href="/product/list/?pkContinent=아메리카" class="festival">남미/중미/북미</a></dd>
                  </dl>
               </dd>
               <dd><a href="#">패키지여행</a>
                  <dl class="sub-menu">
                     <dd><a href="/product/list/?pkContinent=이색휴양지" class="package">이색 휴양지</a></dd>
                     <dd><a href="/product/list/?pkContinent=아름다운도시" class="package">아름다운도시</a></dd>
                     <dd><a href="/product/list/?pkContinent=커플여행" class="package">커플여행</a></dd>
                     <dd><a href="/product/list/?pkContinent=럭셔리호캉스" class="package">럭셔리호캉스</a></dd>
                     <dd><a href="/product/list/?pkContinent=일본료칸(온천)" class="package">일본 료칸(온천)</a></dd>
                  </dl>
               </dd>
               <dd><a href="#">항공</a>
                  <dl class="sub-menu">
                     <dd><a href="/freetour/air">항공 바로가기</a></dd>
                  </dl>
               </dd>
            </dl>
            <!-- 이벤트 메뉴 -->
            <dl class="event-menu">
               <dd class="not-dd"><span>|</span></dd>
               <dd><a href="/event/OneventList">이벤트</a></dd>
               <dd><a href="/review/reviewList">리뷰</a></dd>
            </dl>
         </div>

         <!-- 회원 메뉴 -->
         <div class="nav-user-menu">
            <dl>
               <!-- 관리자전용 -->
               <c:if test="${auths.stream().anyMatch(authVO -> authVO.auth.equals('ROLE_ADMIN')).get()}">
               <dd><a href="/user/list?pageNo=1">회원목록(관리자전용)</a></dd>
               <dd><a href="/product/register">상품등록(관리자전용)</a></dd>
               </c:if>
               
               <!-- 게스트 -->
               <sec:authorize access="isAnonymous()">
               <dd><a href="/user/join">회원가입</a></dd>
               <dd><a href="/user/login">로그인</a></dd>
               </sec:authorize>
               
               <!-- 로그인인증 회원 -->
               <sec:authorize access="isAuthenticated()">
               <dd><a href="/user/detail">마이페이지</a></dd>
               <dd><a href="/user/logout" id="logout">로그아웃</a></dd>
               </sec:authorize>
               
               <dd><a href="/help/customerCenter">고객센터</a></dd>
            </dl>
         </div>
         
      </header>   
         
</body>
<script type="text/javascript" src="/resources/js/dropMenu.js"></script>
</html>