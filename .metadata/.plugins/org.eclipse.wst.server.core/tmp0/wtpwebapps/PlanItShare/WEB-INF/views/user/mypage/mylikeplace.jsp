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

#container {
	display : flex;
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
	width: 200px;
	height: 200px;
	margin-right: 20px;
}

#category {
	font-size: 25px;
	display : flex;
	justify-content: space-between;
	width : 250px;
	color: #c9c4c4;
}

#category a {
	color : dimgray;
}

#pagebar {
	display : flex;
}

.pagination {
	margin : auto;
}

.fa-heart:before {
	color: tomato;
}

.fa-star:before {
	color: gold;
}

.no-gutters {
	width: 700px;
}

.px-4 {
    padding-top: 3rem;
}


.card {
	margin-bottom: 1rem;
	padding: 1rem;
}

.name {
	font-size: 24px;
}






</style>
</head>
<body>


	<main>
		<%@ include file="/WEB-INF/views/inc/header.jsp"%>
		<section>
			<h1>관심 여행 장소</h1>
			<div id="container">
			<nav>
					<ul>
						<li><a href="">내 정보 관리</a></li>
						<li><a href="/planitshare/mypage/myreview.do">작성 리뷰 보기</a></li>
						<li><a href="/planitshare/mypage/mycomment.do">작성 댓글 보기</a></li>
						<li><a href="/planitshare/mypage/mylikeplace.do"style="color: #6DA2DF;">관심 여행 장소</a></li>
						<li><a href="/planitshare/mypage/mylikeplan.do">관심 여행 일정</a></li>
						<li><a href="/planitshare/mypage/myplan.do">내 일정 보기</a></li>
						<li><a href="/planitshare/mypage/myinvitation.do">일정 초대 목록</a></li>
					</ul>
				</nav>
				<div id="board">

				
				<div id="category">
					<a href="/planitshare/mypage/mylikeplace.do?distint=food" <c:if test="${distint == 'food'}">style="color: black;"</c:if>>음식점</a> 
					<a href="/planitshare/mypage/mylikeplace.do?distint=tour" <c:if test="${distint == 'tour'}">style="color: black;"</c:if>>관광명소</a> 
					<a href="/planitshare/mypage/mylikeplace.do?distint=lodging" <c:if test="${distint == 'lodging'}">style="color: black;"</c:if>>숙소</a>
				</div>

				<!-- 음식점 -->
				
					<c:if test="${distint == 'food'}">
						<c:forEach items="${fList}" var="dto">
							
							<div class="card" onclick="location.href=''">
							
									<div class="row no-gutters">
									<span><img src="/planitshare/asset/image/${dto.image}"
										class="img-fluid" alt="식당 이미지"></span>
									<div class="col">
										<div class="card-block px-4">											
											<h5 class="name">${dto.name}</h5>
											<div class="card-text">${dto.category}</div>
											<div class="card-text">
												<i class="fa-solid fa-heart">${dto.likeCnt}</i>
												<i class="fa-solid fa-star"><c:if test="${not empty dto.reviewAvg}">${dto.reviewAvg}</c:if>
												<c:if test="${empty dto.reviewAvg}">0</c:if></i>
												
												(${dto.reviewCnt})
											</div>
											<div class="card-text">${dto.address}</div>
										</div>
									</div>
								</div>
								
							</div>
						</c:forEach>
					</c:if>
				
				


				<!-- 관광명소 -->
				<c:if test="${distint == 'tour'}">
					<c:forEach items="${tList}" var="dto">
						<div class="card">
							
								<div class="row no-gutters">
									<span><img src="/planitshare/asset/image/${dto.image}"
										class="img-fluid" alt="관광지이미지"></span>
									<div class="col">
										<div class="card-block px-4">
											<h4 class="card-title">
												<a href="">${dto.placename}</a>
											</h4>
											<div class="card-text">${dto.category}</div>
											<div class="card-text">
												<i class="fa-solid fa-heart">${dto.likeCnt}</i>
												<i class="fa-solid fa-star"><c:if test="${not empty dto.reviewAvg}">${dto.reviewAvg}</c:if>
												<c:if test="${empty dto.reviewAvg}">0</c:if></i>
												
												(${dto.reviewCnt})
											</div>
											<div class="card-text">${dto.address}</div>
										</div>
									</div>
								</div>
							
						</div>
					</c:forEach>
				</c:if>


				<!-- 숙소 -->
				<c:if test="${distint == 'lodging'}">
					<c:forEach items="${lList}" var="dto">
						<div class="card">
							
								<div class="row no-gutters">
									<span><img src="/planitshare/asset/image/${dto.image}"
										class="img-fluid" alt="숙소이미지"></span>
									<div class="col">
										<div class="card-block px-4">
											<h4 class="card-title">
												<a href="">${dto.name}</a>
											</h4>
											<div class="card-text">${dto.category}</div>
											<div class="card-text">
												<i class="fa-solid fa-heart">${dto.likeCnt}</i>
												<i class="fa-solid fa-star"><c:if test="${not empty dto.reviewAvg}">${dto.reviewAvg}</c:if>
												<c:if test="${empty dto.reviewAvg}">0</c:if></i>
												
												(${dto.reviewCnt})
											</div>
											<div class="card-text">${dto.address}</div>
										</div>
									</div>
								</div>
							
						</div>
					</c:forEach>
				</c:if>
				</div>

			</div>

			<div id="pagebar">${pagebar}</div>

		</section>


	</main>


	<script>
		
	</script>


</body>
</html>