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
	//float: left;
}

#tripList {
    display: flex;
    flex-wrap: wrap;
    justify-content : space-between;
}

.planlist {
	margin-bottom : 30px;
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
    margin-bottom: 2rem;
    padding: 1rem;
    margin-left: 1rem;
}

</style>
</head>
<body>


	<main>
		<%@ include file="/WEB-INF/views/inc/header.jsp"%>
		<section>
			<h1>관심 여행 일정</h1>
			<div id="container">
			
			<nav>
					<ul>
						<li><a href="">내 정보 관리</a></li>
						<li><a href="/planitshare/mypage/myreview.do">작성 리뷰 보기</a></li>
						<li><a href="/planitshare/mypage/mycomment.do">작성 댓글 보기</a></li>
						<li><a href="/planitshare/mypage/mylikeplace.do">관심 여행 장소</a></li>
						<li><a href="/planitshare/mypage/mylikeplan.do"style="color: #6DA2DF;">관심 여행 일정</a></li>
						<li><a href="/planitshare/mypage/myplan.do">내 일정 보기</a></li>
						<li><a href="/planitshare/mypage/myinvitation.do">일정 초대 목록</a></li>
					</ul>
				</nav>

			<!-- 관심여행일정 -->
			<div id="tripList">
			
			<c:forEach items="${lpList}" var="dto">
			<div class="card" onclick="location.href=''">
				<div class="planlist">
	            <span><img src="/planitshare/asset/image/${dto.image}" class="img-fluid" alt="지역 대표 이미지"></span>
	            <div class="text">
	                <div>${dto.title}</div>
	                <div class="story">
	                <span><i class="fa-solid fa-user"></i>${dto.name}</span>
	                <span><i class="fa-solid fa-eye"></i>${dto.readcount}</span>
	                <span><i class="fa-solid fa-heart"></i>${dto.likeCnt}</span>
	                </div>
	            </div>
	       		</div>
	       		</div>
			</c:forEach>
			</div>

				
			</div>
		<div style="text-align: center;">${pagebar}</div>				
				

				
		</section>

	</main>


	<script>
		
	</script>


</body>
</html>