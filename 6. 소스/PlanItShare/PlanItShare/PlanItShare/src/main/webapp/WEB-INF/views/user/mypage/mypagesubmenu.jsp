<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Plan It Share</title>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<style>
    
     
    nav {
        
        margin-top: 100px;        
        position: relative;
        left: 0;
        top: 0;
       
     }
     
      ul {
        list-style: none;
        font-size: 23px;
        font-weight: bold;
     }
      
     li {
        margin-bottom: 15px;
     }
     

</style>
</head>
<body>
   

   <nav>
         <ul>
           <li><a href="/planitshare/mypage.do" id="myinfo">내 정보 관리</a></li>
           <li><a href="/planitshare/mypage/myreview.do" id="myreview">작성 리뷰 보기</a></li>
           <li><a href="/planitshare/mypage/mycomment.do" id="mycomment">작성 댓글 보기</a></li>
           <li><a href="/planitshare/mypage/mylikeplace.do" id="mylikeplace">관심 여행 장소</a></li>
           <li><a href="/planitshare/mypage/mylikeplan.do" id="mylikeplan">관심 여행 일정</a></li>
           <li><a href="/planitshare/mypage/myplan.do" id="myplan">내 일정 보기</a></li>
           <li><a href="/planitshare/mypage/myinvitation.do" id="myinvitation">일정 초대 목록</a></li>
       </ul>
        </nav>
         


   <script>
   
   </script>


</body>
</html>