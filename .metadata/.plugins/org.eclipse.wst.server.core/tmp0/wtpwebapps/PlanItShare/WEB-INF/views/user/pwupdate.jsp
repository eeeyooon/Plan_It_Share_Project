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
    
    	width: 400px;
    	margin: 0 auto;
    }
    
    #pwupdate-box > div {
    
    	margin-bottom: 40px;
    }
    
    


</style>
</head>
<body>
	
	
	<main>
		<%@ include file="/WEB-INF/views/inc/header.jsp" %>
		<section>
			<div id="box">
				<h2>비밀번호 재설정하기</h2>
				<form action="/planitshare/pwupdate.do" method="post">
					<div id="pwupdate-box">
						<div>
							<h4>새로운 비밀번호</h4>
							<input type="password" name="pw" class="form-control" id="pw" placeholder="비밀번호를 입력해주세요." required>
						</div>
						<div>
							<h4>새로운 비밀번호 확인</h4>
							<input type="password" name="pwCheck" class="form-control" id="pwCheck" placeholder="비밀번호를 입력해주세요." required>
						</div>
						<div id="btn">
							<input type="submit" value="비밀번호 변경하기" id="pwUpdate" class="btn btn-primary">
							<input type="hidden" name="id" value="${id}">
							<!-- 받은 아이디 같이 넘기기 -->
						</div>
					</div>
				
				</form>
			</div>
			
			
			
		</section>
	
	</main>


	<script>
	
		<c:if test="${result == 1}">
	    alert('비밀번호가 수정되었습니다.');
	    location.href="/planitshare/login.do"
		</c:if>
	    
	    
		<c:if test="${result == 0}">
		    alert('비밀번호 변경에 실패했습니다.');
		    history.back();
		</c:if>
		
		
		<c:if test="${not empty error}">
		    alert('${error}');
		    history.back();
		</c:if>
		
	
	
	</script>


</body>
</html>