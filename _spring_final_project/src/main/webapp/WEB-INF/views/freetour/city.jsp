<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/freetour/freetour-list.css">
</head>
<body>
   <jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
   <c:set value="${dep }" var="dep"/>
   <c:set value="${arr }" var="arr"/>
   
   <div class="freetour-all-container">
      <div class="reservation-info">
      
         <div class="arrInfo-header"> <!-- 출발  -->
            <c:choose>
               <c:when test="${depInfo ne 'noAirInfo' }">
                  <h2 class="startAirport">${startAirport }</h2>
               </c:when>
               <c:when test="${depInfo eq 'noAirInfo' }">
                  <h2>비행기가 없어요</h2>
               </c:when>   
            </c:choose>
         </div>
         
         <div class="pepleInfo">
            <i class="fa-solid fa-arrow-right"></i>
            <span>성인1/왕복</span>
         </div>
         
         <div class="arrInfo-header"><!-- 도착 -->
            <c:choose>
               <c:when test="${arrInfo ne 'noAirInfo' }">
                  <h2 >${arrInfo.get(0).airport }</h2>
               </c:when>
               <c:when test="${arrInfo eq 'noAirInfo' }">
                  <h2>비행기가 없어요</h2>
               </c:when>
            </c:choose>
         </div>
      </div>
      <div class="final-check-container">
         <div class="blue-con"></div>
         <div class="final-sub-container">
            <div class="final-reser-info">   
               <strong>예약정보</strong>
               <h1 class="reser-h1">예약정보를 입력해주세요</h1>
               <div class="start-info"> <!-- 출발  -->
                  <div class="airport">
                     <span class="depName"></span>
                  </div>
   
                              
                  <div class="air-time">
                     <span class="depAir"></span>
                     <span class="depTime"></span>   
                  </div>
               </div>
               <div class="end-info"> <!-- 도착 -->
                  <div class="airport">
                     <span class="arrName"></span>
                  </div>

                  
                  <div class="air-time">                     
                     <span class="arrAir"></span>
                     <span class="arrTime"></span>                     
                  </div>
               </div>         
            </div>
            
            <div class="final-reser-payment">
               <div class="final-reser-payment-peple-info">
                  <div>
                     <span class="peple-seat">
                        <span class="adult">${adult }</span>
                        <span class="child">${child }</span>
                        <span class="infant">${infant }</span>
                        <span class="seat">${seat }</span>                                      
                     </span>
                     
                     <span class="air-detail">비행상세</span>
                  </div>
               </div>
               
               
               <div class="final-reser-payment-pay-info">
                  <div>
                     <span class="pep-cnt">${aivo.pepleCount }</span>
                     <span class="reser-pay">${aivo.price }원</span>
                  </div>
                  <form action="/freeTourPeyment/PeyReservation" method="post" accept-charset="UTF-8">
                     <input type="hidden" name=ftPrice value="${aivo.price}">
                     <input type="hidden" name=arrival value="${aivo.arrival }">                                       
                     <input type="hidden" name=date value="${aivo.date }">                                         
                     <input type="hidden" name="departureDay" id="departureDay">                     
                     <input type="hidden" name="arrivalDay" id="arrivalDay">                                          
                     <input type="hidden" name="seatType" value="${aivo.seat }">
                     <input type="hidden" name="flightType" value="${aivo.verification }">
                     <input type="hidden" name="tfPeple" value="${aivo.peple }">
                     <input type="hidden" name="gate" id="gateNumber">
                     <input type="hidden" name="cityCode" value="${dep }">                    
                     <input type="hidden" name="airlineArr" id="airlineArr">
                     <input type="hidden" name="flightIdArr" id="flightIdArr">
                     <input type="hidden" name="airlineDep" id="airlineDep">
                     <input type="hidden" name="flightIdDep" id="flightIdDep">
                     <input type="hidden" name="airplane" value='A'>
                     <input type="hidden" name="ftPeple" value="${aivo.peple }"> 
                     <div>
                        <button type="submit" class="submitBtn">예약하기</button>
                     </div>
                  </form>
               </div>
            </div>
         </div>
      </div>

      
      <!-- 인천 -> 해외 -->
      
      <c:choose>
         <c:when test="${depInfo ne 'noAirInfo' && arrInfo ne 'noAirInfo'}">
            <div class="depArrInfo">
             <!-- 인천 -> 해외로 가는거 고르게 하기 -->
             <!-- 항공사 , 인천->해외 출발시간,도착시간 // 해외->인천 출발시간,도착시간 -->
                   <div>
                     <c:forEach items="${depInfo }" var="depInfo">
                        
                        <div class="arrInfo-div">
                           <div class="arrInfo-header">
                              <span class="arrInfo-div-span0">${startAirport} <i class="fa-solid fa-right-long"></i> ${depInfo.airport }</span>
                              <span> ${depInfo.airportCode }</span>
                           </div>
                           <div class="arrInfo-div-div">
                              <div class="arrInfo-div-span1">
                                 <span class="depAirLine">${depInfo.airline }</span>
                                 <span class="depFlight">${depInfo.flightId }</span>
                              </div>
                              <div class="arrInfo-i">
                                 <i class="fa-solid fa-plane-departure" id="dep"></i>
                              </div>
                              <div class="arrInfo-div-span2">
                                 <strong>도착일자/시간</strong>
                                 
                                 <input type="hidden" value="${depInfo.scheduleDateTime }" class="dep-Day">
                                 
                                 <span>
                                    <fmt:parseDate value="${depInfo.scheduleDateTime }" pattern="yyyyMMddHHmm" var="depDate"/>
                                    <fmt:formatDate value="${depDate }" pattern="yyyy년 MM월 dd일 HH:mm" />
                                 </span>
                              </div>
                           </div>      
                           <div class="reservation-div" data-airport="${depInfo.airport }" data-airportcode="${depInfo.airportCode }" 
                           data-schedule="${depInfo.scheduleDateTime }" data-airline="${depInfo.airline }" data-flightId="${depInfo.flightId }">
                              <button class="reservation-btn">선택</button>
                           </div>
                        </div>
                     </c:forEach>
                  </div>
      
                  <div>
                     <c:forEach items="${arrInfo }" var="arrInfo">
                     <input type="hidden" name="gatenumber" value="${arrInfo.gatenumber }" id="arrGate">
                        <div class="arrInfo-div">
                           <div class="arrInfo-header">
                              <span class="arrInfo-div-span0">${arrInfo.airport } <i class="fa-solid fa-right-long"></i> ${startAirport }</span>
                              <span>${arrInfo.airportCode }</span>
                           </div>
                           <div class="arrInfo-div-div">
                              <div class="arrInfo-div-span1">
                                 <span class="arrAirLine">${arrInfo.airline }</span>
                                 <span class="arrFlight">${arrInfo.flightId }</span>
                              </div>
                              <div class="arrInfo-i">
                                 <i class="fa-solid fa-plane-arrival" id="arr"></i>
                              </div>
                              <div class="arrInfo-div-span2">                          
                                 <strong>도착일자/시간</strong>
                                 
                                 <input type="hidden" value="${arrInfo.scheduleDateTime }" class="arr-Day">
                                 
                                 <span>
                                    <fmt:parseDate value="${arrInfo.scheduleDateTime }" pattern="yyyyMMddHHmm" var="depDate"/>
                                    <fmt:formatDate value="${depDate }" pattern="yyyy년 MM월 dd일 HH:mm" />
                                 </span>
                              </div>
                           </div>
                           
                           <div class="reservation-div" data-airport="${arrInfo.airport }" data-airline="${arrInfo.airline }" data-flightId="${arrInfo.flightId }"
                           data-schedule="${arrInfo.scheduleDateTime }" data-airportCode="${arrInfo.airportCode }">
                              <button class="arr-choice">선택</button>
                           </div>
                        </div>
                     </c:forEach>
                  </div>
               </div>
            </c:when>
            <c:when test="${depInfo eq 'noAirInfo' && arrInfo eq 'noAirInfo' }">
               <div class="noneAir">
                  <div class="none-airport">
                     <span class="material-symbols-outlined" id="noneAirport">production_quantity_limits</span>
                     <h2>선택하신 조건으로 검색된 항공권이 없습니다.</h2>
                     <a href="/freetour/air"><button type="button" class="return-btn">이전</button></a>                  
                  </div>
               </div>
            </c:when>
         </c:choose>
   </div>
   
   <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
   <script type="text/javascript" src="/resources/js/freetour/airport.js"></script>
   <script type="text/javascript">
      console.log("출발"+dep);
      console.log("도착"+arr);
      
   </script>
</body>
</html>