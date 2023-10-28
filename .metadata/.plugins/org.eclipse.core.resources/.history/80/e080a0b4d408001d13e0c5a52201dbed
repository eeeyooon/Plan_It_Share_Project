<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Plan It Share</title>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<style>
	section {
      display: flex;
   }

   #admin-submenu {
      width: 200px;
      height: 300px;
      margin-right: 70px;
      margin-top: 100px;
   }
   
   #admin-submenu li {
      list-style: none;
      margin-bottom: 15px;
      font-size: 23px;
      font-weight: bold;
   }
   
   .table {
   		width: 900px;
   }
   
   .table th {
   		width: 120px;
   		vertical-align: middle;
   }
   
   .table tr:nth-child(1) > td:nth-child(2) {
   		width: 350px;
   }
   
   #submit-btn {
   		float: right;
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
			
			<form method="post" action="/planitshare/adminpage/place/update.do">
				<table class="table table-borderless">
					<tr>
						<th>장소 분류</th>
						<td>
							<select class="form-control" name="distinct" id="distinct" required>
								<option value="" selected disabled>장소 분류를 선택해주세요.</option>
								<option value="food">음식점</option>
								<option value="tour">관광명소</option>
								<option value="lodging">숙소</option>
							</select>
						</td>
						<th>카테고리</th>
						<td>
							<select class="form-control" name="category" id="category" required>
								<option value="" selected disabled>카테고리를 선택해주세요.</option>
								<c:forEach var="category" items="${categories}">
								<option value="${category.seq}">${category.category}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th>지역 분류</th>
						<td>
							<select class="form-control" name="distrinct" id="distrinct" required>
								<option value="" selected disabled>지역 분류를 선택해주세요.</option>
								<c:forEach var="distrincts" items="${distrincts}">
								<option value="${distrincts}">${distrincts}</option>
								</c:forEach>
							</select>
						</td>
						<th>지역</th>
						<td>
							<select class="form-control" name="city" id="city" required>
								<option value="" selected disabled>지역을 선택해주세요.</option>
								<c:forEach var="city" items="${cities}">
								<option value="${city.seq}">${city.name}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<c:if test="${distinct == 'lodging'}">
						<th>체크인 시각</th>
						<td>
							<input type="time" name="checkin" id="checkin" value="${ldto.checkin}" class="form-control" required/>
						</td>
						<th>체크아웃 시각</th>
						<td>
							<input type="time" name="checkout" id="checkout" value="${ldto.checkout}" class="form-control" required/>
						</td>
						</c:if>
						
						<c:if test="${distinct == 'tour'}">
						<th>영업시작시각</th>
						<td>
							<input type="time" name="open" id="open" value="${tdto.open}" class="form-control" required/>
						</td>
						<th>영업종료시각</th>
						<td>
							<input type="time" name="close" id="close" value="${tdto.close}" class="form-control" required/>
						</td>
						</c:if>
						
						<c:if test="${distinct == 'food'}">
						<th>영업시작시각</th>
						<td>
							<input type="time" name="open" id="open" value="${fdto.open}" class="form-control" required/>
						</td>
						<th>영업종료시각</th>
						<td>
							<input type="time" name="close" id="close" value="${fdto.close}" class="form-control" required/>
						</td>
						</c:if>
					</tr>
					<tr>
						<th>여행 장소명</th>
						<td colspan="3">
							<input type="text" name="name" id="name" class="form-control" placeholder="장소명을 입력해주세요." required/>
						</td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan="3">
							<input type="text" name="address" id="address" class="form-control" placeholder="주소를 입력해주세요." required/>
						</td>
					</tr>
					<tr>
						<td colspan="4">
							<input type="hidden" name="distinct" value="${distinct}" />
							<input type="hidden" name="seq" id="seq" />
							<button class="btn btn-primary" id="submit-btn">수정 완료</button>
						</td>
					</tr>
				</table>
			</form>
		</section>
	
	</main>


	<script>
		// 서브 메뉴 현재 위치 색상 표시
		$('#admin-submenu li:nth-child(4) a').css('color', '#6DA2DF');
		
		let distinct = '<c:out value="${distinct}" />';
		let address = '';
		let cseq = '';
		let category = '';
		let name = '';
		let distrinct = '';
		let seq = '';
		
		if (distinct == 'lodging') {
			address = '<c:out value="${ldto.address}" />';
			cseq = '<c:out value="${ldto.cseq}" />';
			category = '<c:out value="${ldto.lcseq}" />';
			name = '<c:out value="${ldto.name}" />';
			distrinct = '<c:out value="${ldto.distrinct}" />';
			seq = '<c:out value="${ldto.seq}" />';
			
		} else if (distinct == 'tour') {
			address = '<c:out value="${tdto.address}" />';
			cseq = '<c:out value="${tdto.cseq}" />';
			category = '<c:out value="${tdto.tcseq}" />';
			name = '<c:out value="${tdto.placeName}" />';
			distrinct = '<c:out value="${tdto.distrinct}" />';
			seq = '<c:out value="${tdto.seq}" />';

		} else {
			address = '<c:out value="${fdto.address}" />';
			cseq = '<c:out value="${fdto.cseq}" />';
			category = '<c:out value="${fdto.fcseq}" />';
			name = '<c:out value="${fdto.name}" />';
			distrinct = '<c:out value="${fdto.distrinct}" />';
			seq = '<c:out value="${fdto.seq}" />';
		}
		
		// 장소 분류 선택
		$('#distinct').val(distinct).prop("selected", true);
		$('#distinct').prop("disabled", true);
		
		// 카테고리 선택
		$('#category').val(category).prop("selected", true);
		
		// 지역 분류 선택
		$('#distrinct').val(distrinct).prop("selected", true);

		// 지역 선택
		$('#city').val(cseq).prop("selected", true);
		
		// 시퀀스
		$('#seq').val(seq);
		
		// 여행 장소명 선택
		$('#name').val(name);
		
		// 주소 입력
		$('#address').val(address);
		
		function selectDistrinct(distrinct) {
			
			$.ajax({
				type: 'GET',
				url: '/planitshare/adminpage/place/add/distrinct.do',
				data: 'distrinct=' + distrinct,
				dataType: 'json',
				success: function(result) {
					
					$('#city').html('');
					$('#city').append('<option value="" selected disabled>지역을 선택해주세요.</option>');
					
					$.each(result, function(index, item) {
						$('#city').append('<option value="' + item.seq + '">' + item.name + '</option>');
					});
					
				},
				error: function(a, b, c) {
					console.log(a, b, c)
				}
			});
		}
	</script>

</body>
</html>