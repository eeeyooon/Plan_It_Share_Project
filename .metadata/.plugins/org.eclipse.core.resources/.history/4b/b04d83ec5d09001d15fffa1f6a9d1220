<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
   <div id="header-logo"><a href="/planitshare/main.do"><img src="/planitshare/asset/image/logo.png" alt="logo"></a></div>  
   <ul id="header-menu">
       <li><a href="/planitshare/main.do">홈</a></li>
       <li><a href="/planitshare/city.do">여행지</a></li>
       <li><a href="/planitshare/plan.do">여행일정</a></li>
   </ul>
   
   <!-- 로그인 안 했을 때 -->
   <c:if test="${empty auth}">
	<div id="before-login">
       <a href="/planitshare/login.do">로그인</a>
       <a href="/planitshare/register.do">회원가입</a>
  	 </div> 
  </c:if>



   <!-- 로그인 했을 때 -->
   
   <c:if test="${not empty auth}">
   		<div id="login">
		   
		   <c:if test="${auth.loginmode eq 'user'}">
		   <div id="header-profile">
		       <div id="image-container">
		       	   <div id="profile"><img src="/planitshare/userimage/${auth.profile}" alt="" ></div>
		       </div>
		       <div id="login-info">
		       	   <div id="name">${auth.name}님</div>	       	   
		           <div>
		               <a href="/planitshare/mypage.do">마이페이지</a>
		               <a href="/planitshare/logout.do">로그아웃</a>
		           </div>	           
		       </div>
		   </div>
		   </c:if>
		   
		    <c:if test="${auth.loginmode eq 'admin'}">
	           
		    <div id="header-profile">
		       <div id="image-container">
		       	   <div id="profile"><img src="/planitshare/asset/image/admin.png" alt="amdin-profile" ></div>
		       </div>
		       <div id="login-info">
		       	   <div id="name">관리자님</div>
		       	    <div>
		               <a href="/planitshare/adminpage.do">관리자페이지</a>
		               <a href="/planitshare/logout.do">로그아웃</a>
		           </div>
		       </div>
		   </div>
		    </c:if>
		   
		 </div>
   </c:if>
   
   
</header>


