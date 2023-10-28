<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Plan It Share</title>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<style>
	#category span {
		display: inline-block;
		margin-right: 10px;
		margin-bottom: 20px;
	}
	
	#category span a {
		font-size: 1.2rem;
		color: gray;
		font-weight: bold;
	}
	
	.table {
		width: 1280px;
	}
	
	.table tr th,	
	.table tr td:nth-child(1),
	.table tr td:nth-child(2),
	.table tr td:nth-child(5),
	.table tr td:nth-child(6),
	.table tr td:nth-child(7) {
		text-align: center;
	}
	
	.table tr th:nth-child(1) { width: 60px; }
	.table tr th:nth-child(2) { width: 130px; }
	.table tr th:nth-child(3) { width: 200px; }
	.table tr th:nth-child(4) { width: auto; }
	.table tr th:nth-child(5) { width: 110px; }
	.table tr th:nth-child(6) { width: 116px; }
	.table tr th:nth-child(7) { width: 115px; }
	.table tr th:nth-child(8) { width: 115px; }

	section {
      display: flex;
   }

   #admin-submenu {
      width: 200px;
      height: 300px;
      margin-right: 50px;
      margin-top: 100px;
   }
   
   #admin-submenu li {
      list-style: none;
      margin-bottom: 15px;
      font-size: 23px;
      font-weight: bold;
   }
	
	#category span.selected a {
		color: black;
	}
	
	.pagination {
		justify-content: center;
	}
	
	#add-btn {
		float: right;
		margin-bottom: 5px;
	}

</style>
</head>
<body>
	
	
	<main>
		<%@ include file="/WEB-INF/views/inc/header.jsp" %>
		<section>
		
			<nav id="admin-submenu">
				<ul>
					<li><a href="">추천 여행지 관리</a></li>
					<li><a href="">회원 조회</a></li>
					<li><a href="">통계 확인</a></li>
					<li><a href="/planitshare/adminpage/place.do">여행 장소 관리</a></li>
					<li><a href="">일정 게시판 관리</a></li>
					<li><a href="">금칙어 관리</a></li>
				</ul>
			</nav>
		
			<table>
				<tr>
					<td>
						<span id="category">
							<span><a href="/planitshare/adminpage/place.do?distinct=lodging">숙소</a></span>
							<span><a href="/planitshare/adminpage/place.do?distinct=tour">관광명소</a></span>
							<span><a href="/planitshare/adminpage/place.do?distinct=food">음식점</a></span>
						</span>
						<button type="button" class="btn btn-primary" id="add-btn">새 장소 등록</button>
					</td>
				</tr>
				<tr>
					<td>
					<table class="table table-bordered">
						<tr>
							<th>지역</th>
							<th>카테고리</th>
							<th>여행장소</th>
							<th>주소</th>
							<c:if test="${distinct == 'lodging'}">
							<th>체크인 시간</th>
							<th>체크아웃 시간</th>
							</c:if>
							<c:if test="${distinct == 'food' || distinct == 'tour'}">
							<th>영업시작시간</th>
							<th>영업종료시간</th>
							</c:if>
							<th></th>
						</tr>
						<c:if test="${distinct == 'lodging'}">
						<c:forEach var="dto" items="${list}">
							<tr>
								<td>${dto.city}</td>
								<td>${dto.category}</td>
								<td>${dto.name}</td>
								<td>${dto.address}</td>
								<td>${dto.checkIn}</td>
								<td>${dto.checkOut}</td>
								<td>
									<span><button type="button" class="btn btn-secondary btn-sm"  onclick="update(${dto.seq})">수정</button></span>
									<span><button type="button" class="btn btn-danger btn-sm" onclick="del(${dto.seq})">삭제</button></span>
								</td>
							</tr>
						</c:forEach> 
						</c:if>
						
						<c:if test="${distinct == 'food'}">
						<c:forEach var="dto" items="${list}">
							<tr>
								<td>${dto.city}</td>
								<td>${dto.category}</td>
								<td>${dto.name}</td>
								<td>${dto.address}</td>
								<td>${dto.open}</td>
								<td>${dto.close}</td>
								<td>
									<span><button type="button" class="btn btn-secondary btn-sm" onclick="update(${dto.seq})">수정</button></span>
									<span><button type="button" class="btn btn-danger btn-sm" onclick="del(${dto.seq})">삭제</button></span>
								</td>
							</tr>
						</c:forEach>
						</c:if>
						
						<c:if test="${distinct == 'tour'}">
						<c:forEach var="dto" items="${list}">
							<tr>
								<td>${dto.city}</td>
								<td>${dto.category}</td>
								<td>${dto.placename}</td>
								<td>${dto.address}</td>
								<td>${dto.open}</td>
								<td>${dto.close}</td>
								<td>
									<span><button type="button" class="btn btn-secondary btn-sm" onclick="update(${dto.seq})">수정</button></span>
									<span><button type="button" class="btn btn-danger btn-sm"  onclick="del(${dto.seq})">삭제</button></span>
								</td>
							</tr>
						</c:forEach>
						</c:if>
					</table>
					</td>
				</tr>
				<tr>
					<td>
						<c:if test="${not empty list}">
			            <nav aria-label="Page navigation example">
			                <ul class="pagination">
			                    <c:if test="${pagination.prev}">
			                        <li class="page-item">
			                            <a class="page-link" href="/planitshare/adminpage/place.do?distinct=${distinct}&page=${pagination.currentPage - 1}" aria-label="Previous">
			                                <span aria-hidden="true">&laquo;</span>
			                            </a>
			                        </li>
			                    </c:if>
			                    <c:forEach begin="${pagination.beginPage}" end="${pagination.endPage}" var="index">
			                        <li class="page-item"><a class="page-link" href="/planitshare/adminpage/place.do?distinct=${distinct}&page=${index}">${index}</a></li>
			                    </c:forEach>
			                    <c:if test="${pagination.next}">
			                        <li class="page-item">
			                            <a class="page-link" href="/planitshare/adminpage/place.do?distinct=${distinct}&page=${pagination.currentPage + 1}" aria-label="Next">
			                                <span aria-hidden="true">&raquo;</span>
			                            </a>
			                        </li>
			                    </c:if>
			                </ul>
			            </nav>
			            </c:if>
					</td>
				</tr>
			</table>
			
		</section>
	
	</main>


	<script>
		// 서브 메뉴 현재 위치 색상 표시
		$('#admin-submenu li:nth-child(4) a').css('color', '#6DA2DF');
		
		// 장소별로 밑줄 추가
		<c:if test="${distinct == 'lodging'}">
			$('#category span:nth-child(2)').removeClass('selected');
			$('#category span:nth-child(3)').removeClass('selected');
			$('#category span:nth-child(1)').addClass('selected');
		</c:if>
		
		<c:if test="${distinct == 'tour'}">
			$('#category span:nth-child(1)').removeClass('selected');
			$('#category span:nth-child(3)').removeClass('selected');
			$('#category span:nth-child(2)').addClass('selected');
		</c:if>
		
		<c:if test="${distinct == 'food'}">
			$('#category span:nth-child(1)').removeClass('selected');
			$('#category span:nth-child(2)').removeClass('selected');
			$('#category span:nth-child(3)').addClass('selected');
		</c:if>
		
		// 장소 추가
		$('#add-btn').click(function() {
			location.href='/planitshare/adminpage/place/add.do';
		});
		
		// 장소 삭제
		function del(seq) {
			if (confirm('해당 장소를 삭제하시겠습니까?')) {
				location.href='/planitshare/adminpage/place/delete.do?distinct=' + `${distinct}` + '&seq=' + seq;	
			}
		}
		
		// 장소 수정
		function update(seq) {
			location.href='/planitshare/adminpage/place/update.do?distinct=' + `${distinct}` + '&seq=' + seq;
		}
		
	</script>
	
</body>
</html>