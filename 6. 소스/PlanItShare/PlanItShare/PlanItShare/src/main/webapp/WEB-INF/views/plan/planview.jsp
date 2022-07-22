<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Plan It Share</title>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<style>
	.table.layout {
		width: 1000px;
		margin-bottom: 10px;
	}
	
	.table.layout tr:nth-child(1) {
		text-align: center;
	}
	
	.table.layout tr:nth-child(2),
	.table.layout tr:nth-child(3) {
		text-align: right;
	}
	
	#title, #author-date, #count {
		margin-bottom: 10px;
	}
	
	#count span {
		margin-right: 10px;
	}
	
	#count i {
		margin-right: 5px;
	}
	
	#plan-info .fa-solid.fa-heart {
		color: tomato;
	}
	
	#author-date {
		color: dimgray;
	}
	
	#map-box {
		width: 500px;
	}
	
	#map {
		width: 450px;
		height: 300px;
		margin-bottom: 10px;
	}
	
	#map-box .btn {
		margin: 0 auto;
		width: 450px;
	}
	
	.date, .comment-info {
		color: gray;
	}
	
	.day {
		display: inline-block;
		margin-right: 10px;
		margin-top: 50px;
	}
	
	.table.plan {
		margin-bottom: 100px;
	}
	
	.comment-info {
		display: inline-block;
		margin-bottom: 5px;
	}
	
	.table.comment td {
		height: 120px;
	}
	
	#like {
		outline: none;
		border: none;
		background-color: white;
		display: inline-block;
		margin-bottom: 50px;
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
	
	#invite img {
		width: 50px;
		height: 50px;
		border-radius: 50% 50%;
	}
	
	#invite span {
		display: inline-block;
		margin-right: 5px;
	}
	
	.table.comment td {
		padding: 15px;
	}
	
	#plan {
		height: 400px;
	}
	
	#plan th {
		width: 120px;
	}
	
	#plan td, #plan th {
		text-align: center;
		vertical-align: middle;
		border: 1px solid lightgray;
		padding: 5px;
	}
	
	#plan tr:nth-child(1) td { height : 40px; } 
	#plan tr:nth-child(2) td { height : 40px; } 
	#plan tr:nth-child(3) td { height : 40px; } 
	#plan tr:nth-child(4) td { height : auto; } 
	
	#write-comment textarea {
		resize: none;
		width: 900px;
		display: inline-block;
	}
	
	#write-comment input[type=button] {
		display: inline-block;
	}
	
	.table.plan, #write-comment {
		width: 1000px;
		margin: 0 auto;
	}
	
	.table.plan {
		margin-bottom: 50px;
	}
	
	.place-img {
		width: 100px;
		height: 80px;
	}
	
	.day-title {
		border-bottom: 1px solid lightgray;
	}
	
	#place td {
		vertical-align: middle;
	}
	
	.comment-box {
		position: relative;
		left: 0;
		top: 0;
	}
	
	#delcomment-btn {
		position: absolute;
		bottom: 8px;
		display: block;
		cursor: pointer;
		right: 8px;
	}
	
	.modal-body {
		margin: 0 auto;
	}
	
	.ui-widget {
		z-index:2147483647;
	}
	
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/inc/header.jsp" %>
	
	<main>
		<section>
		
		<!-- Modal -->
		<div class="modal fade" id="modal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="staticBackdropLabel">일정에 초대하기</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		      	<div class="ui-widget">
		      		<label for="invite-user" class="form-label">초대할 회원의 아이디<input type="text" id="invite-user" class="form-control"></label>
				</div>
			  	
			 </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
		        <button type="button" class="btn btn-primary" id="invite-btn">초대하기</button>
		      </div>
		    </div>
		  </div>
		</div>
			
			<table class="table table-borderless layout">
				<tr>
					<td colspan="2" id="plan-info">
						<h2 id="title">${pdto.title}</h2>
						<div id="author-date">${pdto.author} ${pdto.regdate}</div>
						<div id="count">
							<i class="fa-solid fa-heart"></i><span id="likeCnt">${pdto.likeCnt}</span>
							<i class="fa-solid fa-eye"></i><span>${pdto.readcount}</span>
						</div>
					</td>
				</tr>
				<tr id="invite">
					<td colspan="2">
						<c:forEach var="planUser" items="${puList}">
						<span><img src="/planitshare/userimage/${planUser.profile}" title="${planUser.id}"></span>
						</c:forEach>
						<span><img src="/planitshare/userimage/${pdto.authorProfile}" title="${pdto.author}"></span>
						<c:if test="${auth.id == pdto.author}">
						<button class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#modal">+</button>
						</c:if>
					</td>
				</tr>
				<c:if test="${auth.id == pdto.author}">
				<tr>
					<td colspan="2">
						<button type="button" class="btn btn-primary">수정하기</button>
						<button type="button" class="btn btn-secondary" onclick="delplan('${pdto.seq}')">삭제하기</button>
					</td>
				</tr>
				</c:if>
				
				<c:forEach var="planUser" items="${puList}">
				<c:if test="${auth.id == planUser.id}">
				<tr>
					<td colspan="2">
						<button type="button" class="btn btn-primary">수정하기</button>
						<button type="button" class="btn btn-secondary" onclick="delplan('${pdto.seq}')">삭제하기</button>
					</td>
				</tr>
				</c:if>
				</c:forEach>
				<tr>
					<td id="map-box">
						<div id="map" style="width:100%;height:350px;"></div>
						<button class="btn btn-secondary btn-block" type="button" onclick="location.href='/planitshare/plan/planmap.do?seq=${pdto.seq}'">지도 보기</button>
					</td>
					<td>
						<table class="table table-bordered" id="plan">
							<tr>
								<th>여행지역</th>
								<td>${pdto.city}</td>
							</tr>
							<tr>
								<th>여행시작일자</th>
								<td>${pdto.startdate}</td>
							</tr>
							<tr>
								<th>여행종료일자</th>
								<td>${pdto.enddate}</td>
							</tr>
							<tr>
								<th>내용</th>
								<td>${pdto.content}</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			
			<table class="table table-borderless plan">
				<c:forEach var="day" items="${days}">
				<tr class="day-title">
					<th><h4 class="day">Day ${day.day}</h4> <span class="date">${day.date}</span></th>
				</tr>
				<c:forEach var="plan" items="${planList}">
				<tr>
					<c:if test="${plan.day == day.day}"> 
					<td>
						<table id="place">
							<tr>
								<td>
									<img src="/planitshare/asset/image/${plan.image}" class="place-img">
								</td>
								<td>
								<h5>${plan.name}</h5>
								<span>${plan.address}</span>
								</td>
							</tr>
						</table>
					</td>
					</c:if>
				</tr>
				</c:forEach>
				</c:forEach>
			</table>
			
			<c:if test="${not empty auth}">
			<button id="like"><i class="fa-solid fa-heart"></i></button>
			</c:if>
			
			<table class="table table-bordered comment">
				<c:forEach var="dto" items="${clist}">
				<tr>
					<td class="comment-box">
						<span class="comment-info">${dto.id} ${dto.regdate}</span>
						<div>${dto.content}</div>
						<c:if test="${dto.id == auth.id}">
						<span class="badge badge-secondary" id="delcomment-btn" onclick="deleteComment('${dto.seq}')">삭제</span>
						</c:if>
					</td>
				</tr>
				</c:forEach>
			</table>
			
			<table id="write-comment">
				<tr>
					<td><textarea class="form-control" placeholder="댓글을 작성해주세요." id="comment"></textarea></td>
					<td><input type="button" class="btn btn-primary" value="댓글 작성" id="add-comment"/></td>
				</tr>
			</table>
		</section>
		
	</main>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=45bff8e1f05130c0cfcaa2b32275bf5e"></script>
	<script>
	var staticMapContainer  = document.getElementById('map'), // 이미지 지도를 표시할 div  
	    staticMapOption = { 
	        center: new kakao.maps.LatLng(33.37665833461409, 126.54221668447137), // 이미지 지도의 중심좌표
	        level: 10 // 이미지 지도의 확대 레벨
	    };

	// 이미지 지도를 표시할 div와 옵션으로 이미지 지도를 생성합니다
	var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
	
	// 관심등록한 음식점일 경우
	<c:if test="${like == 'y'}">
	$('#like i').addClass('liked');
	</c:if>

	// 댓글 작성
	$('#add-comment').click(function() {
		
		// 로그인 체크
		let id = '${auth.id == null ? '' : auth.id}';
		
		if (id == '' || id == null) {
			alert('로그인 후 댓글을 작성해주세요.');
			location.href='/planitshare/login.do';
			return;
		}
		
		$.ajax({
			type: 'POST',
			url: '/planitshare/plan/view/addcomment.do',
			data: 'comment=' + $('#comment').val() + '&seq=' + ${pdto.seq},
			dataType: 'json',
			success: function(result) {
				
				if (result.result == '1') {
					location.reload();
				} else {
					alert('댓글 작성 실패');
				}
			},
			error: function(a, b, c) {
				console.log(a, b, c);
			}
		});
	});
	
	// 댓글 삭제
	function deleteComment(seq) {
		
		if (confirm("댓글를 삭제하시겠습니까?")) {
			$.ajax({
				type: 'GET',
				url: '/planitshare/plan/view/delcomment.do',
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
	
	// 관심등록, 해제 구현
	$(document).on("click", '#like', function() {
		$.ajax({
			type: 'GET',
			url: '/planitshare/plan/view/like.do',
			dataType: 'json',
			data: 'seq=' + ${pdto.seq},
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
	
	function delplan(seq) {
		if (confirm('해당 일정을 삭제하시겠습니까?')) {
			location.href='/planitshare/plan/view/delete.do?seq=' + seq;
		}
	}
	
	let idList = [];
	
	<c:forEach var="id" items="${idList}">
		idList.push("${id}");
	</c:forEach>
	
	$( function() {
	    $( "#invite-user" ).autocomplete({
	      source: idList
	    });
	  } );
	
	  // modal이 열릴 때 다시 영역 한정 (appendTo 옵션)
	  $("#modal").on("shown.bs.modal", function() {
	    $("#tags").autocomplete("option", "appendTo", "#modal")
	  })
	  
	  $('#invite-btn').click(function() {
		 
		 $.ajax({
			type: 'GET',
			url: '/planitshare/plan/view/invite.do',
			data: 'pseq=${pdto.seq}' + '&id=' + $('#invite-user').val() + '&host=${pdto.author}',
			dataType: 'json',
			success: function(result) {
				
				if (result.result == "1") {
					alert('초대 성공');
					$('#invite-user').val('');
				} else {
					alert('올바르지 않은 아이디입니다.');
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
