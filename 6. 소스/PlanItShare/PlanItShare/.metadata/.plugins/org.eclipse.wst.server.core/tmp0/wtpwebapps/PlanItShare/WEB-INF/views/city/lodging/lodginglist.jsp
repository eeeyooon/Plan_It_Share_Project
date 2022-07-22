<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Plan It Share</title>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<style>
	#header-menu li:nth-child(2) > a{
		color: #6DA2DF;
	}

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
   
   .lodgingimg {
   		width: 300px;
   		height: 200px;
   		background-size: contain;	
   		float: left;
   		margin-right: 20px;
   }
   
   .fa-solid.fa-heart {
   		color:tomato;
   }
   
   .fa-solid.fa-star {
   		color: gold;
   		margin-left: 10px;
   }
   
   .container {
   		width: 700px;
   		margin-bottom: 10px;
   		padding: 10px;
   		border: 1px solid #D9D9D9;
   		border-radius: 5px;
   		cursor: pointer;
   }
   
   .container::after {
   		content: '';
   		display: block;
   		clear: both;
   }
   
   h1 {
   		text-align: center
   }
   
   ul {
   		list-style: none;
   		margin-top: 50px;
   	}
   

   
</style>
</head>
<body>
   <%@ include file="/WEB-INF/views/inc/header.jsp" %>
   
   <main>
      <section>
   <%@ include file="/WEB-INF/views/inc/citysubmenu.jsp" %>
         
         <div id="search-box">
         	<form method="GET" action="/planitshare/city/lodgingsearch.do">
         	<table class="search">
         		<tr>
         			<td>
			            <select name="column" class="form-control" style="width: 130px;">
			               <option value="name">숙소명</option>
			               <option value="category">카테고리</option>
			            </select>
		            </td>
		            <td>
	            		<input type="text" name="word" class="form-control" required>
	            	</td>
	            	<td>
	            		<button class="btn btn-secondary"><i class="fa-solid fa-magnifying-glass"></i></button>
	            	</td>
	            </tr>
	        </table>
            </form>           
         </div>
         
         <h1>인기 ${dto.name} 숙소</h1>
         <c:forEach items="${list}" var="dto">
         	<div class="container" onclick="location.href='/planitshare/city/lodgingview.do?seq=${dto.seq}';">
	         <img class="lodgingimg" src="/planitshare/asset/image/${dto.image}">
	         <ul>
	         	<li>${dto.name}</li>
	         	<li>${dto.category}</li>
	         	<li><i class="fa-solid fa-heart"></i>${dto.likecnt}<i class="fa-solid fa-star"></i>${dto.reviewavg}
	         	<c:if test="${dto.reviewcnt > 0}">
	         	<span>(${dto.reviewcnt})</span>
	         	</c:if>
	         	</li>
	         	<li></li>
	         	<li>${dto.address}</li>
	         </ul>
         	</div>
         </c:forEach>
         
      </section>
   </main>

</body>
</html>