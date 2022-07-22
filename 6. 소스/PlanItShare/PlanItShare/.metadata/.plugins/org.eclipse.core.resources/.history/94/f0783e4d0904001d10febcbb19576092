<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Plan It Share</title>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<style>

h2, #labels > span {
     text-align: center;
 }
 
 h2 {
     margin-bottom: 30px;
 }
 
 #box {
     width: 500px;
     margin: 0 auto;
 }
 
 #login-box > input, h2 {
     margin-bottom: 20px;
 }
 
 #login-box > input, #login-btn {
     height: 40px;
 }
 
 #login-btn {
     margin: 10px auto;
     
 }
 
 #labels {
     margin: 5px auto;
 }
 
 #labels span a {
     margin-top: 40px;
     margin-left: 40px;
     margin-right: 30px;
     color: black;
 }
 
 
 #login-error {
     margin: 10px 0;
     color: red;
     text-align: center;
 }


</style>
</head>
<body>
   
   <main>
      <%@ include file="/WEB-INF/views/inc/header.jsp" %>
       <section>
        <div id="box">
            <h2>로그인</h2>
            <form action="/planitshare/login.do" method="post">
            <div id="login-box">
                <c:if test="${not empty loginError}">
                    <div id="login-error">
                        아이디 또는 비밀번호가 일치하지 않습니다.
                    </div>
                </c:if>
                <input type="text" name="id" id="id" class="form-control" placeholder="아이디를 입력해주세요." required>
                <input type="password" name="pw" id="pw" class="form-control" placeholder="비밀번호를 입력해주세요." required>
                <input type="submit" value="로그인" id="login-btn" class="btn btn-primary btn-block">
            </div>
            </form>
            <div id="labels">
                <span><a href="/planitshare/idsearch.do">비밀번호 찾기</a></span>
                <span><a href="/planitshare/pwsearch.do">아이디 찾기</a></span>
                <span><a href="/planitshare/register.do">회원가입</a></span>
            </div>
        </div>
    </section>
   
   </main>


   <script>
   
   </script>


</body>
</html>