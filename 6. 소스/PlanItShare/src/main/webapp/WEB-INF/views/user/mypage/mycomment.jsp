<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Plan It Share</title>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<style>

#box {
   
      display: flex;
      width: 1500px;
      margin: 0 30% 50px 30px;
      /* position: relative; */
   
  
  }
   
   section div#board{
        margin: 70px auto 0 auto;
        width: 800px;
        height: 900px;
    }

    .table {
    	margin-bottom: 100px;
        width: 800px;
        margin-top : 60px;
    }
    
	#box > nav > ul {
      
         width: 200px;
    
    }
    
    #box > nav {
    
       width: 400px;
       padding-left: 158px;
       padding-top: 25px;
       
    }
    
    section div > table tr th {
        text-align: center;
    }
    
    section div > table tr td {
        text-align: center;
        padding: 10px;
    }
    
   .pagination {
        justify-content: center;
    }
    
    
    #board > table > tbody > tr:nth-child(2) > td:nth-child(1) {
    	
    	width: 60px;
    	height: 60px;
    
    }
    
    #check {
    
    	width: 20px;
    	height: 20px;
    
    }
    
    
    #checkdel-btn {
    	
    	width: 80px;
    	margin-left: 0;
    	
    }
    
    
    #mycomment {
    	
    	color: #6DA2DF;
    
    }
    
    .title {
    	
    	margin-left: 40px;
    	color: #A6A6A6;
    	
    }
    
    #board > form > table > tbody > tr:nth-child(1) > th:nth-child(2) {
    	
    	text-align: center;
    }
    
    
    #board > form > table > tbody > tr > td:nth-child(2) {
    	
    	width: 600px;
    	text-align: center;
    
    }
    
    
    
    
    
    #board > form > table > tbody > tr:nth-child(1) > th:nth-child(1) {
    
    	width: 45px;
    	height: 45px;
    	
    }
    
    
    #allCheck {
    
   		width: 20px;
    	height: 20px;
    
    }
    
    #board > nav {
    
		margin-top: 30px;    
    }
    
    

</style>
</head>
<body>
	
	
	<main>
		<%@ include file="/WEB-INF/views/inc/header.jsp" %>
		<section>
		
		<div id="box">
		<%@ include file="mypagesubmenu.jsp"%>
		
			<div id="board">
		
				<form action="/planitshare/mypage/mycommentdel.do" method="post">
				<table class="table">
					<tr>
						<th><input type="checkbox" name="allCheck" id="allCheck"></th>
						<th>댓글</th>
						<th>작성날짜</th>					
					</tr>
					<c:if test="${empty list}">
						<tr>
							<td colspan="3" style="text-align: center">작성된 글이 없습니다. </td>
						</tr>
					</c:if>
					<c:forEach var="dto" items="${list}">
						<tr>
							<td><input type="checkbox" name="check" id="check" value="${dto.seq}" class="form-control"></td>
							<td>${dto.content}<span class="title">${dto.title}</span></td>
							<td>${dto.regdate}</td>
						</tr>
					</c:forEach>
				</table>
				<hr>
				<input type="submit" name="btn" value="삭제" id="checkdel-btn" class="btn btn-primary btn-block">
				
				</form>
				
				<nav aria-label="Page navigation example">
                <ul class="pagination">
                    <c:if test="${pagination.prev == true}">
                    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                    </c:if>
                    <c:forEach var="index" begin="${pagination.beginPage}" end="${pagination.endPage}" step="1">
                    <li class="page-item"><a class="page-link" href="/planitshare/mypage/myreview.do?page=${index}">${index}</a></li>
                    </c:forEach>
                    <c:if test="${pagination.next == true}">
                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
                    </c:if>
                </ul>
            	</nav>
			</div>	
		</div>	
		</section>
	
	</main>


	<script>
	
		$("#allCheck").click(function() { //전체 선택 + 해제
			
			var checked = $(this).prop("checked");
			
			if (checked) {
				$(":checkbox[name=check]").prop("checked", true);
			} else {
				$(":checkbox[name=check]").prop("checked", false)				
			}
			
		});
		
	
	
	</script>


</body>
</html>