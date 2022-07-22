<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Plan It Share</title>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
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
	
	h4 {
		text-align: center;
		margin-top: 100px;
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
		width: 120px;
	}
	
	#search-box input[type=text] {
		width: 300px;
	}
	
	#search-box input[type=button] { 
		width: 80px;
	}
	
	.card {
		width: 700px;
		margin: 30px auto;
	}
	
	.food-img {
		float: left;
		width: 300px;
		height: 200px;
		margin-right: 20px;
	}

	.card-title, .card-text {
		margin : 5px 0;
	}
	
	.card-text span {
		margin-right: 10px;
	}
	
	.card-text i {
		margin-right: 5px;
	}
	
	i.fa-solid.fa-heart {
		color: tomato;
	}
	
	i.fa-solid.fa-star {
		color: gold;
	}
	
	.pagination {
		margin-top: 50px;
		justify-content: center;
	}
	
	.card {
		cursor: pointer;
	}
	
	#food-info {
		margin-top: 30px;
	}
	
	h1 {
		text-align: center;
	}
	
	#header-menu li:nth-child(2) a {
		color: #6DA2DF
	}
</style>
</head>
<body>
	<main>
		<%@ include file="/WEB-INF/views/inc/header.jsp" %>
		<section>
		
			<!-- 서브 메뉴 -->
			<h2>${cdto.name}</h2>
			<div id="city-submenu">
				<span><a href="">홈</a></span>
				<span><a href="">숙소</a></span>
				<span><a href="">관광명소</a></span>
				<span><a href="">음식점</a></span>
				<span><a href="">${cdto.name}일정</a></span>
			</div>
			
			<div id="search-box">
				<select class="form-control" name="distinct">
					<option value="name">음식점명</option>
					<option value="category">카테고리</option>
				</select>
				<input type="text" name="keyword" id="" class="form-control" placeholder="검색어를 입력해주세요."/>
				<button type="button" class="btn btn-secondary" id="search-btn"><i class="fa-solid fa-magnifying-glass"></i></button>
			</div>
			
			<c:if test="${empty keyword}">
			<h1>인기 음식점</h1>
			</c:if>
			
			<!-- 리스트 출력 -->
			<c:forEach var="dto" items="${list}">
			<div class="card" onclick="location.href='/planitshare/city/food/view.do?cseq=${dto.cseq}&seq=${dto.seq}'">
			  <div class="card-body">
			  	<img src="/planitshare/asset/image/${dto.image}" class="food-img">
			  	<div id="food-info">
				    <h5 class="card-title">${dto.name}</h5>
				    <p class="card-text">${dto.category}</p>
				    <p class="card-text">
				    	<i class="fa-solid fa-heart"></i><span>${dto.likeCnt}</span>
				    	<i class="fa-solid fa-star"></i><span>${dto.reviewAvg eq null ? 0.0 : dto.reviewAvg} (${dto.reviewCnt})</span>
			    	</p>
				    <p class="card-text">${dto.address}</p>
			    </div>
			  </div>
			</div>
			</c:forEach>
			
			<!-- 검색 결과가 없을 때 -->
			<c:if test="${not empty distinct && not empty keyword && empty list}">
				<h4>검색 결과가 없습니다.</h4>
			</c:if>
			
			<!-- 페이징 -->
			<c:if test="${not empty list}">
            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <c:if test="${pagination.prev}">
                        <li class="page-item">
                            <a class="page-link" href="/planitshare/city/food.do?cseq=${cdto.seq}&page=${pagination.currentPage - 1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:forEach begin="${pagination.beginPage}" end="${pagination.endPage}" var="index">
                        <li class="page-item"><a class="page-link" href="/planitshare/city/food.do?cseq=${cdto.seq}&page=${index}">${index}</a></li>
                    </c:forEach>
                    <c:if test="${pagination.next}">
                        <li class="page-item">
                            <a class="page-link" href="/planitshare/city/food.do?cseq=${cdto.seq}&page=${pagination.currentPage + 1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                </ul>
            </nav>
            </c:if>
			
		</section>
	</main>
	<script>
	
		<c:if test="${distinct != null && keyword != null}">	
		$('select[name=distinct]').val('${distinct}');
		$('input[name=keyword]').val('${keyword}');
		</c:if>
	
		$('#search-btn').click(function() {
			
			let cseq = <c:out value="${cdto.seq}" />
			let distinct = $('select[name=distinct] option:selected').val();
			let keyword = $('input[name=keyword]').val();
			
			location.href='/planitshare/city/food.do?cseq=' + cseq + '&distinct=' + distinct + '&keyword=' + keyword;
		});
	</script>
</body>
</html>