<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Plan It Share</title>
<%@ include file="/WEB-INF/views/inc/asset.jsp"%>
<style>

	#header-menu li:nth-child(2) a {
		color : #6DA2DF;
	}

#city-submenu {
      box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
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
   
section {
	margin: 0 30px;
}

#container {
	display: flex;
}

nav {
	width: 300px; //
	float: left;
}

#tripList {
	padding: 10%

}

.planlist {
	margin-bottom: 30px;
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
	box-shadow: 0 5px 18px -7px rgba(0, 0, 0, 1);
	background-color: #E7EAED;
}

h2 {
	padding-top: 30px;
}

.container>div {
	font-size: 25px;
	text-align: left;
}

#profile>img {
	width: 200px;
	margin-left: 70px;
	margin-top: 50px;
}

#profile {
	float: left;
}

#info {
	margin-top: 80px;
	margin-left: 330px;
	width: 300px;
}

#info>div {
	margin-bottom: 6px;
}

.fa-solid {
	margin-right: 10px;
}

.btns {
	margin-top: 100px;
}

.btns>input:nth-child(2), .btns>input:nth-child(3) {
	float: right;
	margin-right: 5px;
}

.img-fluid {
	float: left;
	width: 250px;
	height: 250px;
	margin-right: 20px;
}

.category {
	font-size: 30px;
}

.pagination {
	justify-content: center;
}


.fa-heart:before {
	color: tomato;
}

.fa-star:before {
	color: gold;
}


.card {
    padding-top: 1rem;
    padding-left: 1.1rem;
    display: inline-block;
    margin-left: 20px;
    margin-bottom: 25px;
}
   
</style>
</head>
<body>
	<main>
		<%@ include file="/WEB-INF/views/inc/header.jsp"%>
		<section>
		
		<%@ include file="/WEB-INF/views/inc/citysubmenu.jsp" %>

			<div id="search-box">
				<form method="GET" action="/planitshare/city/cityplan/cityplanlist.do">
					<table class="search">
						<tr>
							<td>
								<select name="column" class="form-control" style="width: 130px;">
							

									<option value="name">작성자</option>
									<option value="content">내용</option>
									
		
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

						<div id="tripList">
			
			<c:forEach items="${jList}" var="dto">
			<div class="card" onclick="location.href=''">
				<div class="planlist">
	            <span><img src="/planitshare/asset/image/${dto.image}" class="img-fluid" alt="지역 대표 이미지"></span>
	            <div class="text">
	                <div>${dto.title}</div>
	                <span><i class="fa-solid fa-user"></i>${dto.name}</span>
	                <span><i class="fa-solid fa-eye"></i>${dto.readcount}</span>
	                <span><i class="fa-solid fa-heart"></i>${dto.likeCnt}</span>
	            </div>
	       		</div>
	       		</div>
			</c:forEach>
			</div>

				<div id="product_order_list">
					<p></p>


				</div>
			
			<div style="text-align: center;">${pagebar}</div>
			



		</section>
	</main>
	
	<script type="text/javascript">
	
		// 검색중
		<c:if test = "$map.isSearch == 'y'}">
		$('select[name = column]').val('${map.column}');
		$('input[name = word]').val('${map.word}');
		</c:if>
	
	</script>
	
	
	
	
	
	

</body>
</html>