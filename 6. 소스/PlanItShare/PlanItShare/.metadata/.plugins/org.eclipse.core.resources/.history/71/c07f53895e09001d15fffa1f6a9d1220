<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Plan It Share</title>
<%@ include file="/WEB-INF/views/inc/asset.jsp"%>
<style>
#city-submenu {
      box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
      width: 1400px;
      height: 50px;
      display: flex;
      justify-content: space-around;
      align-items : center;
      font-size: 1.2rem;
   }
   
   h2 {
      text-align: center;
      margin-bottom: 50px;
   }
   
   #search-box {
      margin: 50px 0;
      text-align: center;
   }
   
   #search-box > * {
      display: inline-block;
      margin-right: 10px;
   }
   
   #search-box select {
      width: 100px;
   }
   
   #search-box input[type=text] {
      width: 300px;
   }
   
   #search-box input[type=button] { 
      width: 80px;
   }
   
   .fa-solid {
   		margin-left: 7px;
   }

   
   .fa-solid.fa-heart {
   	  color: tomato;
   }
   
   #list {
   
   		width: 1000px;
   		margin: 0 auto;
   		
   }
   
   .planlist {
   		float: left;
   		margin: 10px;
   		text-align: center;
   }
   
   
   .planlist > img {
   		width: 300px;
   		height: 200px;
   		background-size: contain;
   			
   		
   }
   
	#list::after {
        content: '';
        display: block;
        clear: both;
    }
   
   .btn-primary {
   		margin-top: 30px;
   		float: right;
   		margin-right: 50px;
   }
   
   #notfound {
		text-align: center;
		font-size: 20px;
		margin-right: 70px;
	}
   
   #page {
   		margin: 0 auto;
   		width: 100px;
   		text-align: center;
   }
   
   li {
   		list-style: none;
   }
   
</style>
</head>
<body>
	<main>
		<%@ include file="/WEB-INF/views/inc/header.jsp"%>
		<section>
			
			<div id="search-box">
				<form method="GET" action="/planitshare/plan/plansearch.do">
					<table class="search">
						<tr>
							<td>
								<select name="column" class="form-control" style="width: 130px;">
									<option value="content">내용</option>
									<option value="author">작성자</option>
								</select>
							</td>
							<td>
								<input type="text" name="word" class="form-control" required>
							</td>
							<td>
								<button class="btn btn-secondary">
								<i class="fa-solid fa-magnifying-glass"></i>
								</button>
							</td>
						</tr>
					</table>
				</form>
			</div>

		<div id="list">
			 <c:forEach items="${list}" var="dto">
	         <div class="planlist" onclick="location.href='/planitshare/plan/view.do?seq=${dto.seq}';">
	            <img src="/planitshare/asset/image/${dto.image}">
	            <div class="text">
	                <div>${dto.title}</div>
	                <span><i class="fa-solid fa-user"></i>${dto.author}</span>
	                <span><i class="fa-solid fa-eye"></i>${dto.readCount}</span>
	                <span><i class="fa-solid fa-heart"></i>${dto.likecnt}</span>
	                <c:if test="${dto.reviewcnt > 0}">
	                <span>(${dto.reviewcnt})</span>
	                </c:if>
	            </div>
	         </div>
	         </c:forEach>  	      	         
        </div>
        
        <c:if test="${list.size() == 0}">
			<ul id="notfound">
				<li>검색된 결과가 없습니다.</li>
			</ul>
		</c:if>
		 
	 	<div id="page">	
        	${pagebar}
        </div>
        <div>
	        <input type="button" class="btn btn-primary" value="일정등록하기">
	    </div> 
		
		</section>
		
	</main>

	<script>
		<c:if test="${map.isSearch == 'y'}">
		$('select[name=column]').val('${map.column}');
		$('input[name=word]').val('${map.word}');
		</c:if>
	</script>

</body>
</html>