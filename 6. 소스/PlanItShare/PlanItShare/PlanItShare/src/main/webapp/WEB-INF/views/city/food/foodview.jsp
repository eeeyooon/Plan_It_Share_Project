<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Plan It Share</title>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<style>
	
	#info-box {
		width: 800px;
		height: 200px;
		margin: 0 auto 100px auto;
	}

	#info-box img {
		width: 400px;
		height: 250px;
		float: left;
		margin-right: 20px;
	}
	
	#review-box {
		margin-bottom: 20px;
	}
	
	#like {
		outline: none;
		border: none;
		background-color: white;
		float: right;

	}
	
	#like i {
		color: black;
		font-size: 2rem;
	}
	
	#like i.liked {
		color: tomato;
		font-size: 2rem;
	}
	
	i.fa-solid.fa-heart.likeCnt {
		color: tomato;
	}
	
	i.fa-solid.fa-star.reviewCnt {
		color: gold;
	}
	
	p span {
		margin-right: 10px;
	}
	
	p i {
		margin-right: 5px;
	}
	
	form input[type=file] {
		margin-bottom: 10px;
	}
	
	form textarea {
		margin-bottom: 10px;
	}
	
	form input[type=button] {
		margin-bottom: 10px;
		float: right;
	}
	
	#write-review {
		margin-bottom: 60px;
	}
	
	textarea {
	    resize: none;
	}
	
	input.form-control-file {
		width: 650px;
		float: right;
	}
	
	span.rateit-selected {
		white-space: nowrap;
	}
	
	span.author-info {
		display: inline-block;
		color: gray;
	}
	
	.review-img {
		display: block;
		width: 80px;
		height: 80px;
	}
	
	.btns {
		float: right;
	}
	
	.btns .badge {
		cursor: pointer;
	}
	
	#content-box {
		width: 660px;
	}
	
	#write-review table {
		width: 800px;
	}
	
	#write-review table td:first-child {
		width: 700px;
	}
	
	#header-menu li:nth-child(2) a {
		color: #6DA2DF
	}
</style>
<script src="/planitshare/asset/js/jquery.rateit.js"></script>
<link rel="stylesheet" href="/planitshare/asset/css/rateit.css"/>
</head>
<body>
	<%@ include file="/WEB-INF/views/inc/header.jsp" %>
	
	<main>
		<section>
			<div id="info-box">
				<img src="/planitshare/asset/image/${dto.image}">
				<h5>${dto.name}</h5>
				<p>${dto.category}</p>
				<p>${dto.address}</p>
				<p><span>영업시작시간: ${dto.open}</span> <span>영업종료시간: ${dto.close}</span></p>
				<p>
			    	<i class="fa-solid fa-heart likeCnt"></i><span id="likeCnt">${dto.likeCnt}</span>
			    	<i class="fa-solid fa-star reviewCnt"></i><span>${dto.reviewAvg eq null ? 0.0 : dto.reviewAvg} (${dto.reviewCnt})</span>
		    	</p>
				<c:if test="${auth.loginmode == 'user'}">
				<p><button id="like"><i class="fa-solid fa-heart"></i></button></p>
				</c:if>
			</div>
			
			<div id="write-review">
				<form id="review-form">
					<span class="rateit" data-rateit-mode="font" data-rateit-resetable="false"></span>
					<input type="file" class="form-control-file" name="image">
					<input type="hidden" name="fseq" value="${dto.seq}">
					<input type="hidden" name="star">
					<table>
						<tr>
							<td><textarea class="form-control" name="content" rows="5" placeholder="리뷰를 작성해주세요."></textarea></td>
							<td><input type="button" value="리뷰 등록" class="btn btn-secondary" id="add-review"/></td>
						</tr>
					</table>
				</form>
			</div>
			
			<div id="review-box">
			<c:forEach var="dto" items="${rlist}">
			<div class="card">
			  <div class="card-body">
			  	<span class="rateit" data-rateit-mode="font" data-rateit-value="${dto.star}" data-rateit-resetable="false" data-rateit-readonly="true"></span>
			    <span class="author-info">${dto.id} ${dto.regdate}</span>
			    <c:if test="${not empty dto.image}">
			  	<img src="/planitshare/userimage/food/${dto.image}" class="review-img">
			  	</c:if>
			    <p class="card-text">${dto.content}</p>
			    <c:if test="${auth.id == dto.id}">
			    <div class="btns">
			    <span class="badge badge-secondary" onclick="updateReview(${dto.seq})">수정</span>
			    <span class="badge badge-secondary" onclick="deleteReview(${dto.seq})">삭제</span>
			    </div>
			    </c:if>
			  </div>
			</div>
			</c:forEach>
			</div>
			
			
		</section>
	</main>

<script>

	// 관심등록한 음식점일 경우
	<c:if test="${like == 'y'}">
	$('#like i').addClass('liked');
	</c:if>

	// 별점 값 bind
	$(".rateit").bind('rated', function (event, value) {
		$('input[name=star]').val(value);
	});

	// 리뷰 등록
	$('#add-review').click(function() {
		
		// 로그인 체크
		let id = '${auth.id == null ? '' : auth.id}';
		
		if (id == '' || id == null) {
			alert('로그인 후 리뷰를 작성해주세요.');
			location.href='/planitshare/login.do';
			return;
		}
		
		let formData = new FormData($('#review-form')[0]);
		
		$.ajax({
			type: 'POST',
			enctype: 'multipart/form-data',
			url: '/planitshare/city/food/view/reviewadd.do',
			data: formData,
			cache: false,
			contentType : false,
			processData : false,
			dataType: 'json',
			success: function(result) {
				
				if (result.result == '1') {
					location.reload();
				} else {
					alert('리뷰 등록 실패');
				}
			},
			error: function(a, b, c) {
				console.log(a, b, c);
			}
		});
	});
	
	// 리뷰 삭제
	function deleteReview(seq) {
		
		if (confirm("리뷰를 삭제하시겠습니까?")) {
			$.ajax({
				type: 'GET',
				url: '/planitshare/city/food/view/reviewdel.do',
				dataType: 'json',
				data: 'seq=' + seq,
				success: function(result) {
					location.reload();
				},
				error: function(a, b, c) {
					console.log(a, b, c);
				}
			});	
		}
		
	}
	
	// 리뷰 수정
	function updateReview(seq) {
		
	}
	
	// 관심등록, 해제 구현
	$(document).on("click", '#like', function() {
		$.ajax({
			type: 'GET',
			url: '/planitshare/city/food/view/like.do',
			dataType: 'json',
			data: 'seq=' + ${dto.seq},
			success: function(result) {
				if (result.status == 'insertLike') {
					$('#like i').addClass('liked');
					let likeCnt = $('#likeCnt').html();
					$('#likeCnt').html(parseInt(likeCnt) + 1);
				} else {
					$('#like i').removeClass('liked');
					let likeCnt = $('#likeCnt').html();
					$('#likeCnt').html(parseInt(likeCnt) - 1);
				}
			},
			error: function(a, b, c) {
				console.log(a, b, c);
			}
		});
	});
	
</script>
</body>
</html>