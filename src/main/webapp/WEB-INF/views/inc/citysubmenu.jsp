<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



	<h2>${dto.name}</h2>
		<div id="city-submenu">
          <span><a href="/planitshare/city.do?cseq=${dto.seq}">홈</a></span>
          <span><a href="/planitshare/city/lodge.do?cseq=${dto.seq}">숙소</a></span>
          <span><a href="/planitshare/city/tour.do?cseq=${dto.seq}">관광명소</a></span>
          <span><a href="/planitshare/city/food.do?cseq=${dto.seq}">음식점</a></span>
          <span><a href="/planitshare/city/plan.do?cseq=${dto.seq}">${dto.name}일정</a></span>
       	</div>


