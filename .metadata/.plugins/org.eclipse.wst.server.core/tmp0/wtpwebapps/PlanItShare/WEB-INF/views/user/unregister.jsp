<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Plan It Share</title>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<style>

	h2, #check-message {
	
		margin-bottom: 40px;
	}
	
	#check-message {
		margin-top: 30px;
		text-align: center;
	}
	
	#check-user {
		display: flex;
		justify-content: space-between;
	}
	
	#unregister {
		margin-top: 20px;
	}

</style>
</head>
<body>
	
	
	<main>
		<%@ include file="/WEB-INF/views/inc/header.jsp" %>
		<section>
		
			<div id="box">
            <h2>회원 탈퇴</h2>
            <p>
                회원 탈퇴 전, 유의사항을 확인해 주시기 바랍니다. <br>
                - 회원 탈퇴시 'Plan It Share [플래닛 쉐어]' 이용이 불가합니다. <br>
                - 회원 탈퇴 후 사이트에 작성하신 글, 댓글은 삭제되지 않으며 글, 댓글 삭제를
                원하시는 경우에는 먼저 해당 게시물을 삭제한 후 탈퇴를 신청하시기 바랍니다. <br>
                - 아이디 제외 모든 개인 정보는 파기됩니다. <br>
                - 회원 탈퇴 후 2년동안은 동일 아이디로 재가입이 불가능합니다. <br>
            </p>
            <div id="check-message">
                <input type="checkbox" name="check" id="check" class="form-check-input">
                <label for="check">상기 회원 탈퇴 시 처리사항 안내를 확인하였음에 동의합니다.</label>
            </div>
            <form method="post" action="/planitshare/mypage/unregister.do">
            <div id="check-user">
                <span>
                    <label>이름<input type="text" name="name" class="form-control" required></label>
                </span>
                <span>
                    <label>아이디<input type="text" name="id" class="form-control" required></label>
                </span>
                <span>
                     <label>비밀번호<input type="password" name="pw" class="form-control" required></label>
                </span>
                <span>
                    <input type="submit" value="탈퇴하기" class="btn btn-secondary" id="unregister">
                </span>
            </div>
            </form>
        </div>
			
		</section>
	
	</main>


	<script>
	
	   $("#unregister").attr("disabled", true);
	   $("#check").on('click',function(){
	       var chk = $('input:checkbox[id="check"]').is(":checked");
	       if(chk){
	           $("#unregister").removeAttr('disabled');
	       }else{
	           $("#unregister").attr("disabled", true);
	       }
	   });
	   
	   
	   $('#unregister').click(function() {
	       if (confirm('정말 탈퇴하시겠습니까?')) {
	           $('form').submit();
	       }
	   });
	   
	   <c:if test="${not empty error}">
       alert('${error}');
	   </c:if>
		
	
	</script>


</body>
</html>