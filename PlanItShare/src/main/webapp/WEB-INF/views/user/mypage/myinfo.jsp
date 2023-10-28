<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Plan It Share</title>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<style>
	  section {
	     margin: 0 30px;
	  }
		
	  nav {
	     width: 300px;
	     float: left;
	  }
	   
	
	  ul {
	     list-style: none;
	     font-size: 23px;
	     font-weight: bold;
	  }
	   
	  li {
	     margin: 15px;
	  }
	   
	
	  h1 {
	     margin: 0 auto;
	     text-align: center;
	     height: 160px;
	  }
	   
	  section {
	     width: 1200px;
	     margin: 150px auto;
	  }
	   

	  .container {
	    width: 700px;
	    margin: 0 300px;
	    text-align: center;
	    height: 480px;
	    border-radius: 10px;
	  }
	  
	  h2 {
	  	padding-top: 30px;
	  }
	  
	  .container > div {
	  	font-size: 25px;
	  	text-align: left;
	  
	  }
	  
	  .container #profile > img {
        width: auto; 
        height: auto;
        max-width: 200px;
        max-height: 200px;
        margin-left: 70px;
        margin-top: 50px;
      }
     
	  
	 .container #profile {
        float: left;
     
     }
	  
	  #info {
	  	margin-top: 80px;
	  	margin-left: 330px;
	  	width: 300px;
	  
	  }
	  
	  #info > div {
	  	margin-bottom: 6px;
	  
	  }
	  
	  .fa-solid {
	  	margin-right: 10px;
	  }
	  
	  .btns {
	  	margin-top: 100px;
	  }
	  
	  .btns > input:nth-child(2), .btns > input:nth-child(3)  {
		float: right;
		margin-right: 5px;
	  }
	  
	  nav li:nth-child(1) > a {
		color: #6DA2DF;
	  }
	  
</style>
</head>
<body>
	
	
	<main>
		<%@ include file="/WEB-INF/views/inc/header.jsp" %>
		<section>
	         <h1>마이페이지</h1>
	         <nav>
	            <ul>
	               <li><a href="/planitshare/mypage.do">내 정보 관리</a></li>
	               <li><a href="/planitshare/mypage/myreview.do">작성 리뷰 보기</a></li>
	               <li><a href="/planitshare/mypage/mycomment.do">작성 댓글 보기</a></li>
	               <li><a href="/planitshare/mypage/mylikeplace.do">관심 여행 장소</a></li>
	               <li><a href="/planitshare/mypage/mylikeplan.do">관심 여행 일정</a></li>
	               <li><a href="/planitshare/mypage/myplan.do">내 일정 보기</a></li>         
	               <li><a href="/planitshare/mypage/myinvitation.do">일정 초대 목록</a></li>         
	            </ul>
	        </nav>
	        <div class="container">
	        	<h2>내 정보</h2>
	        	<div id="profile"><img src="/planitshare/userimage/${dto.profile}"></div>
	        	<div id="info">
		        	<div><i class="fa-solid fa-user"></i>${dto.name}(${dto.id})</div>
		        	<div><i class="fa-solid fa-phone"></i>${dto.tel}</div>
		        	<div><i class="fa-solid fa-pen-to-square"></i>작성 리뷰: ${dto.reviewcnt}개</div>
		        	<div><i class="fa-solid fa-pen-to-square"></i>작성 댓글: ${dto.commentcnt}개</div>
		        </div>
		        <div class="btns">
		        <input type="button" class="btn btn-light" value="탈퇴하기" onclick="location.href='/planitshare/mypage/unregister.do'">
		        <input type="button" class="btn btn-secondary" value="비밀번호 수정하기" onclick="location.href='/planitshare/mypage/mypwedit.do?id=${dto.id}';">
		        <input type="button" class="btn btn-secondary" value="내 정보 수정하기" onclick="location.href='/planitshare/mypage/myinfoedit.do?id=${dto.id}';">
		        </div>
	        </div>
      	</section>
      	
	
	</main>


	<script>
	
	</script>


</body>
</html>