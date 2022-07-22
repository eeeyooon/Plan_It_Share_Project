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
	  	padding-top: 10px;
	  	text-align: left;
	  	font-size: 22px;
	  }
	  
	  input[type=text], input[type=password] {
	  	width: 300px;
	  	margin: 0 auto;
	  	margin-bottom: 20px;
	  }
	  
	  input[type=file] {
	  	width: 300px;
	    margin: 0 auto;
	  }
	  
	  .btn {
	  	width: 300px;
	  	margin-top: 10px;
	  
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
		        <h2>비밀번호 수정하기</h2>
				<form method="post" action="/planitshare/mypage/mypwedit.do">
					
					<div><input type="password" name="pw" placeholder="현재 비밀번호" class="form-control" required></div>
					<div><input type="password" name="newPw" placeholder="새 비밀번호" class="form-control" required></div>
					<div><input type="password" name="checkPw" placeholder="새 비밀번호 확인" class="form-control" required></div>
					
					
					<div><input type="submit" class="btn btn-primary" value="비밀번호 변경하기"></div>
					<div><input type="button" class="btn btn-secondary" value="취소하기" onclick="history.back()"></div>
					
				</form>
			</div>
		</section>
	
	</main>


	<script>
		<c:if test="${result == 1}">
	    alert('비밀번호가 수정되었습니다.');
	    location.href="/planitshare/mypage.do"
		</c:if>
	    
	    
		<c:if test="${result == 0}">
		    alert('비밀번호 변경에 실패했습니다.');
		    history.back();
		</c:if>
		
		<c:if test="${not empty error1}">
		    alert('${error1}');
		    history.back();
		</c:if>
		
		
		<c:if test="${not empty error2}">
		    alert('${error2}');
		    history.back();
		</c:if>

	</script>


</body>
</html>