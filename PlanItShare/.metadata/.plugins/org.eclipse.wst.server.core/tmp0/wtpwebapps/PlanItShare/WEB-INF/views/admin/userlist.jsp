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
      display: flex;
   }

   #admin-submenu {
      width: 200px;
      height: 300px;
      margin-right: 50px;
      margin-top: 100px;
   }
   
   #admin-submenu li {
      list-style: none;
      margin-bottom: 15px;
      font-size: 23px;
      font-weight: bold;
   }
   
   #admin-submenu li:nth-child(2) a { color : #6DA2DF; }
   
   .table.user {
       width: 800px;
   }
   
   .table.user td {
       height: 60px;
   }
	
   .pagination {
   	  justify-content: center;
   }	
   
   .table th {
   	  text-align: center;
   }
   
   .table td:nth-child(2) {text-align: center;}
   .table td:nth-child(3) {text-align: center;}
   .table td:nth-child(5) {text-align: center;}
   .table td:nth-child(6) {text-align: center;}
   .table td:nth-child(7) {text-align: center;}
	
</style>
</head>
<body>
	
	
	<main>
		<%@ include file="/WEB-INF/views/inc/header.jsp" %>
		<section>
		<%@ include file="/WEB-INF/views/inc/adminsubmenu.jsp" %>
        <div>
        <table class="table table-bordered user">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>성별</th>
				<th>전화번호</th>
				<th>상태</th>
				<th>가입일</th>
				<th></th>
			</tr>
			<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.id}</td>
				<td>${dto.name}</td>
				<td>${dto.gender}</td>
				<td>${dto.tel}</td>
				<td><c:if test="${dto.active == 'y'}">일반회원</c:if><c:if test="${dto.active == 'n'}">탈퇴회원</c:if></td>
				<td>${dto.regdate}</td>
				<c:if test="${dto.active == 'y'}">
				<td><button type="button" class="btn btn-primary btn-sm" onclick="updateUser('${dto.id}');">탈퇴</button></td>
				</c:if>
				<c:if test="${dto.active == 'n'}">
				<td></td>
				</c:if>
			</tr>
			</c:forEach>
		</table>
		<div style="text-align: center;">
			${pagebar}
		</div>	
		</div>
		</section>
	</main>

	<script>
	
		function updateUser(id) {
			
			if(confirm('회원이 탈퇴시킵니다. 계속 진행하시겠습니까?')){
			
				$.ajax({
					type: 'GET',
					url: '/planitshare/adminpage/userunregister.do',
					data: 'id=' + id,
					dataType: 'json',
					success: function(result) {
						
						console.log(result);
						
						if (result.result == '1') {
							alert('회원이 탈퇴되었습니다.');
							location.reload();
						} else {
							alert('회원 탈퇴에 실패했습니다.');
						}
						
					}, 
					error: function(result) {
						console.log(result);
					}
				});
			}
			
		}
		
		$("#pagebar").change(function() {
			
			location.href = '/planitshare/adminpage/userlist.do?page=' + $(this).val();
			
		});
		
		$('#pagebar').val(${nowPage});
	
	</script>


</body>
</html>