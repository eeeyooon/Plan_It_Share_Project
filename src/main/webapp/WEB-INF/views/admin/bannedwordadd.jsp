<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Plan It Share</title>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<style>
</style>
</head>
<body>
   
   
   <main>
      <%@ include file="/WEB-INF/views/inc/header.jsp" %>
      <section>
         
      </section>
   
   </main>


   <script>
      <c:if test="${res == 1}">
      location.href = '/planitshare/admin/bannedwordlist.do';
      </c:if>
      
      <c:if test="${res == 0}">
      alert('잘못된 입력입니다.');
      history.back();
      </c:if>
   </script>


</body>
</html>