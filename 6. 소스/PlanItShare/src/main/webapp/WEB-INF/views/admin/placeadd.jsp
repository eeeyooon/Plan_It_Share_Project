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
			<%@ include file="/WEB-INF/views/inc/adminsubmenu.jsp" %>
			
			<form method="post" action="/planitshare/adminpage/place/add.do" enctype="multipart/form-data">
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
							</select>
						</td>
					</tr>
					<tr id="time">
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
						<th>이미지 업로드</th>
						<td colspan="3">
							<input type="file" name="image" id="image" class="form-control-file"/>
						</td>
					</tr>
					<tr>
						<td colspan="4">
							<button class="btn btn-primary" id="submit-btn">등록하기</button>
						</td>
					</tr>
				</table>
			</form>
		</section>
	
	</main>


	<script>
		// 서브 메뉴 현재 위치 색상 표시
		$('#admin-submenu li:nth-child(4) a').css('color', '#6DA2DF');
		
		$('#distinct').change(function() {
			
			$.ajax({
				type: 'GET',
				url: '/planitshare/adminpage/place/add/distinct.do',
				data: 'distinct=' + $('#distinct').val(),
				dataType: 'json',
				success: function(result) {
					
					$('#time').html('');
					
					if($('#distinct').val() == 'lodging') {
						
						let temp = '';
						
						temp += '<th>체크인 시각</th>';
						temp += '<td>';
						temp += '<input type="time" name="checkin" id="checkin" class="form-control" required/>';
						temp += '</td>';
						temp += '<th>체크아웃 시각</th>';
						temp += '<td>';
						temp += '<input type="time" name="checkout" id="checkout" class="form-control" required/>';
						temp += '</td>';
						
						$('#time').append(temp);
						
					} else {
						
						let temp = '';
						
						temp += '<th>영업시작시각</th>';
						temp += '<td>';
						temp += '<input type="time" name="open" id="checkin" class="form-control" required/>';
						temp += '</td>';
						temp += '<th>영업종료시각</th>';
						temp += '<td>';
						temp += '<input type="time" name="close" id="checkout" class="form-control" required/>';
						temp += '</td>';
						
						$('#time').append(temp);
					}
					
					$('#category').html('');
					$('#category').append('<option value="" selected disabled>카테고리를 선택해주세요.</option>');
					
					$.each(result, function(index, item) {
						$('#category').append('<option value="' + item.seq + '">' + item.category + '</option>');
					});
					
				},
				error: function(a, b, c) {
					console.log(a, b, c)
				}
			});
		});
		
		$('#distrinct').change(function() {
			
			$.ajax({
				type: 'GET',
				url: '/planitshare/adminpage/place/add/distrinct.do',
				data: 'distrinct=' + $('#distrinct').val(),
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
		});
	</script>


</body>
</html>