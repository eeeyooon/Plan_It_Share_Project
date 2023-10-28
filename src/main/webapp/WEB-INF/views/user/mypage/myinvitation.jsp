<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Plan It Share</title>
<%@ include file="/WEB-INF/views/inc/asset.jsp"%>
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
	
	.table tr:first-child {
		background-color: #EAEAEA;
	}
	
	#notinvitation{
		font-size: 20px;
	
	}
	
	nav li:nth-child(7) > a {
		color: #6DA2DF;
	}
	
</style>
</head>
<body>


	<main>
		<%@ include file="/WEB-INF/views/inc/header.jsp"%>
		<section>
			<h1>일정 초대 목록</h1>
			<nav>
				<ul>
					<li><a href="/planitshare/mypage.do">내 정보 관리</a></li>
					<li><a href="/planitshare/mypage/myreview.do">작성 리뷰 보기</a></li>
					<li><a href="/planitshare/mypage/mycomment.do">작성 댓글 보기</a></li>
					<li><a href="/planitshare/mypage/ylikeplace.do">관심 여행 장소</a></li>
					<li><a href="/planitshare/mypage/mylikeplan.do">관심 여행 일정</a></li>
					<li><a href="/planitshare/mypage/myplan.do">내 일정 보기</a></li>
					<li><a  href="/planitshare/mypage/myinvitation.do">일정 초대 목록</a></li>
				</ul>
			</nav>
			<div class="container">
				<table class="table">
					<tr>
						<th>초대자</th>
						<th>승인 또는 거절</th>
					</tr>
					<c:forEach items="${list}" var="dto">
					<tr>
						<td>${dto.name}(${dto.host})</td>
						<td><input type="button" value="승인" class="btn btn-primary" onclick="iaccept(${dto.pseq}, ${dto.seq})">
							<input type="button" value="거절" class="btn btn-secondary" onclick="refuse(${dto.seq})">
						</td>
					</tr>
					</c:forEach>
					
					<tr id="notinvitation">
					<c:if test="${list.size() == 0}">
						<td colspan="2">초대된 일정이 없습니다.</td>
					</c:if>
					<tr>

				</table>
			</div>
		</section>

	</main>


	<script>
		function refuse (seq) {
			
	    	 let tr = $(event.target).parents('tr');
	    	 
	    	 if(confirm('초대를 거절하시겠습니까?'))
	            $.ajax({
	               type: 'POST',
	               url: '/planitshare/mypage/myinvitationrefuse.do',
	               data: 'seq=' + seq,
	               dataType: 'json',
	               success: function(result){
	                  
	                  if (result.result == "1"){

	                    tr.remove();
	                    
	                    if (result.count == "0") {
	                    	$('#notinvitation').append('<td colspan="2">초대된 일정이 없습니다.</td>');
	                    }
	                     
	                  } else {
	                     alert('faild');                     
	                  }
	                  
	               },
	               error: function(a,b,c){
	                  console.log(a,b,c);
	               }
	               
	                   
	            });
	            
	      }
		
		function iaccept(pseq, seq) {
			let tr = $(event.target).parents('tr');
			
			if(confirm('초대를 수락 하시겠습니까?'))
	            $.ajax({
	               type: 'POST',
	               url: '/planitshare/mypage/myinvitationaccept.do',
	               data: 'pseq=' + pseq + '&seq=' + seq,
	               dataType: 'json',
	               success: function(result){
	                  
	                  if (result.result == "1") {

	                    tr.remove();
	                       
	                    if (result.count == "0") {
	                    	$('#notinvitation').append('<td colspan="2">초대된 일정이 없습니다.</td>');
	                    }
	                    
	                  } else {
	                     alert('faild');                     
	                  }
	                  
	               },
	               error: function(a,b,c){
	                  console.log(a,b,c);
	               }
	               
	                   
	            });
			
			
			
		}
		
		
	</script>


</body>
</html>