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
			
			
			<table class="table table-bordered vertical">
				<tr>
					<th>제목</th>
					<td>${dto.subject}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td style="height: 300px; vertical-align: middle;">${dto.content}</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${dto.name}(${dto.id})</td>
				</tr>
				<tr>
					<th>날짜</th>
					<td>${dto.regdate}</td>
				</tr>
				<tr>
					<th>읽음</th>
					<td>${dto.readcount}</td>
				</tr>
				<tr>
					<th>번호</th>
					<td>${dto.seq}</td>
				</tr>
			</table>
			
			<div class="btns">
			
				<input type="button" value="돌아가기" class="btn btn-secondary"
					onclick="location.href='/toy/board/list.do';">
					
				<c:if test="${not empty auth}">
				
				<c:if test="${dto.id == auth || auth == 'admin'}">
				<button class="btn btn-primary"
					onclick="location.href='/toy/board/edit.do?seq=${dto.seq}';">
					<i class="fas fa-pen"></i>
					수정하기
				</button>
				
				<button class="btn btn-primary"
					onclick="location.href='/toy/board/del.do?seq=${dto.seq}';">
					<i class="fas fa-pen"></i>
					삭제하기
				</button>
				</c:if>
				
				<button class="btn btn-primary">
					<i class="fas fa-pen"></i>
					답변쓰기
				</button>
				</c:if>
				
			</div>
			
			
		</section>
	</main>
	
	<script>
		
	</script>

</body>
</html>


















