<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:if test="${fn:length(list) == 0}">
	EMPTY
</c:if>



	<c:forEach items="${list}" var="cdto">
	<tr id="lcomment">
		<td>
			<div class="rateit" data-rateit-resetable="false" data-rateit-readonly="true" data-rateit-value="${cdto.star}"></div>
			<div id="info">
				<span>${cdto.id}</span>
				<span>${cdto.regdate}</span>
			</div>
			<c:if test="${not empty cdto.image}">
			<div><img src="/planitshare/userimage/lodgingreview/${cdto.image}"></div>
			</c:if>
			<div>${cdto.content}</div>
			<div>
			<c:if test="${auth.id == cdto.id}"> 
				<span class="badge badge-secondary"><a href="#!" onclick="delComment(${cdto.seq});">삭제</a></span>
				<span class="badge badge-secondary"><a href="#!" onclick="editcomment(${cdto.seq});">수정</a></span>
			</c:if>
			</div>
		</td>
	</tr>
	</c:forEach> 


<script src="/planitshare/asset/js/jquery.rateit.js"></script>	