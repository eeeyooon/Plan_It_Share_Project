<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Plan It Share</title>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<style>

	h2 {
	
		text-align: center;
		margin-bottom: 40px;
	}
	
	#box {
	
		width: 300px;
		margin: 0 auto;
	}
	
	#idsearch-box > div {
	
		margin-bottom: 20px;
	}
	
	#idsearch-box > div > input {
	
		height: 45px;
	}
	
	
	#idsearch-btn {
	
		margin-bottom: 50px;
	}
	

</style>
</head>
<body>
	
	
	<main>
		<%@ include file="/WEB-INF/views/inc/header.jsp" %>
		<section>
		
			<div id="box">
				<h2>아이디 찾기</h2>
				<form action="/planitshare/idsearch.do" method="post">
					<div id="idsearch-box">
						<div>
							<h4>이름</h4>
							<input type="text" name="name" id="name" class="form-control" required>
						</div>
						<div>
							<h4>전화번호</h4>
							<input type="text" name="tel" id="tel" class="form-control" required>
						</div>					
						<div>
							<input type="submit" value="아이디 찾기" id="idsearch-btn" class="btn btn-primary">
						</div>					
					</div>
				</form>
			
			</div>
			
		</section>
	</main>


	<script>
	
		//찾은 아이디 alert 띄우기
		<c:if test="${not empty id}">
	    alert('가입하신 아이디는 ${id} 입니다.');
	    location.href="/planitshare/login.do";
		</c:if>
		
		
		<c:if test="${notUser == 'y'}">
		alert('일치하는 회원 정보가 존재하지 않습니다.');
		location.href="/planitshare/idsearch.do";
		</c:if>
	
	</script>


</body>
</html>