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
	
	#pwsearch-box > div {
	
		margin-bottom: 20px;
	}
	
	#pwsearch-box > div > input {
	
		height: 45px;
	}
	
	
	#pwsearch-btn {
	
		margin-bottom: 50px;
	}


</style>
</head>
<body>
	
	
	<main>
		<%@ include file="/WEB-INF/views/inc/header.jsp" %>
		<section>
			
			
			<div id="box">
				<h2>비밀번호 찾기</h2>
				<form action="/planitshare/pwsearch.do" method="post">
					<div id="pwsearch-box">
						<div>
							<h4>아이디</h4>
							<input type="text" name="id" class="form-control" id="id" required>
						</div>
						<div>
							<h4>이름</h4>
							<input type="text" name="name" class="form-control" id="name" required>
						</div>
						<div>
							<h4>전화번호</h4>
							<input type="text" name="tel" class="form-control" id="tel" required>
						</div>						
						<div id="btn">
							<input type="submit" value="비밀번호 찾기" id="pwsearch-btn" class="btn btn-primary">
						</div>
					</div>
				
				</form>
			
			
			</div>
			
			
			
		</section>
	
	</main>


	<script>
		<c:if test="${notUser == 'y'}">
			alert('일치하는 회원 정보가 존재하지 않습니다.');
			location.href="/planitshare/pwsearch.do";
		</c:if>
	
	</script>


</body>
</html>