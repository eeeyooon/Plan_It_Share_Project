<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Toy Project</title>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<style>

</style>
</head>
<body>

	<main>
		<%@ include file="/WEB-INF/views/inc/header.jsp" %>
		<section>
			
			<h2>Board</h2>
			
			<table class="table table-bordered horizontal">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>이름</th>
					<th>날짜</th>
					<th>읽음</th>
				</tr>
				<c:forEach items="${list}" var="dto">
				<tr>
					<td>${dto.seq}</td>
					<td>
						<a href="/toy/board/view.do?seq=${dto.seq}">${dto.subject}</a>
					</td>
					<td>${dto.name}</td>
					<td>${dto.regdate}</td>
					<td>${dto.readcount}</td>
				</tr>
				</c:forEach>
			</table>
			
			
			<c:if test="${not empty auth}">
			<div class="btns">
				<button type="button" class="btn btn-primary"
					onclick="location.href='/toy/board/add.do';">
					<i class="fas fa-pen"></i>
					쓰기
				</button>
			</div>
			</c:if>
			
			
			
		</section>
	</main>
	
	<script>
		
	</script>

</body>
</html>


















