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
	     margin: 0 30px;
	  }
		
	  nav {
	     width: 300px;
	     float: left;
	  }
	   
	
	  ul {
	     list-style: none;
	     font-size: 23px;
	     font-weight: bold;
	  }
	   
	  li {
	     margin: 15px;
	  }
	   
	
	  h1 {
	     margin: 0 auto;
	     text-align: center;
	     height: 160px;
	  }
	   
	  section {
	     width: 1200px;
	     margin: 150px auto;
	  }
	   

	  .container {
	    width: 700px;
	    margin: 0 300px;
	    text-align: center;
	    height: 480px;
	    border-radius: 10px;
	  }
	  
	  h2 {
	  	padding-top: 10px;
	  	text-align: left;
	  	font-size: 22px;
	  }
	  
	  input[type=text], input[type=password] {
	  	width: 300px;
	  	margin: 0 auto;
	  	margin-bottom: 20px;
	  }
	  
	  input[type=file] {
	  	width: 300px;
	    margin: 0 auto;
	  }
	  
	  .btn {
	  	width: 300px;
	  	margin-top: 10px;
	  
	  }
	  
	  .container div:nth-child(1), .container div:nth-child(3), .container div:nth-child(5), .container div:nth-child(7){
	  	font-size: 25px;
	  	width: 130px;
	  	text-align: left;
	  	margin-left: 195px;
	  }
	  
	  #image_container {
	   
	   overflow: hidden;
	   display: inline-block;
	   object-fit: cover;
      }
	  
      #image-container > img {
	    	margin-top: 20px;
	    	width: 150px;
	    	height: 150px;
       }
    
	  #file {
	  	width: 300px;
	  	margin: 0 auto;
	  	text-align: left;
		padding-left: 15px;
	  }
	  
	 .error_message {
        color : red;
      }
      
      nav li:nth-child(1) > a {
		color: #6DA2DF;
	  }
    
</style>
</head>
<body>
	
	
	<main>
		<%@ include file="/WEB-INF/views/inc/header.jsp" %>
		<section>
			 <h1>마이페이지</h1>
	         <nav>
	            <ul>
	               <li><a href="/planitshare/mypage/mypage.do">내 정보 관리</a></li>
	               <li><a href="/planitshare/mypage/myreview.do">작성 리뷰 보기</a></li>
	               <li><a href="/planitshare/mypage/mycomment.do">작성 댓글 보기</a></li>
	               <li><a href="/planitshare/mypage/mylikeplace.do">관심 여행 장소</a></li>
	               <li><a href="/planitshare/mypage/mylikeplan.do">관심 여행 일정</a></li>
	               <li><a href="/planitshare/mypage/myplan.do">내 일정 보기</a></li>         
	               <li><a href="/planitshare/mypage/myinvitation.do">일정 초대 목록</a></li>         
	            </ul>
	        </nav>
	        <div class="container">
		        <h2>내 정보 수정하기</h2>
				<form method="post" action="/planitshare/mypage/myinfoedit.do" enctype="multipart/form-data">
					<div>이름</div>
					<div>
						<input type="text" id="name" name="name"value="${dto.name}" class="form-control" required>
						<div id="namecheck-result" class="error_message"></div>
					</div>
					
					<div>전화번호</div>
					<div>
						<input type="text" id="tel" name="tel" value="${dto.tel}" class="form-control" required>
						<div id="telcheck-result" class="error_message"></div>
					</div>
					
					<div>비밀번호</div>
					<div><input type="password" name="pw" placeholder="비밀번호를 입력해주세요" class="form-control" required></div>
					
					<div>프로필사진</div>
					<div>
						<input type="file" name="profile" class="form-control" accept="image/*"  onchange="setThumbnail(event);">
						<div id="image-container"></div>
					</div>
					
					<!-- 파일명이 기본이 아닐경우 파일명이름을 보여주고 삭제할 수 있도록함 -->
					<c:if test="${dto.profile ne 'user.png'}">
					<div id="file">파일명: <span id="filename">${dto.profile}</span><span onclick="delfile();" style="cursor:pointer;">&times;</span></div>
					</c:if>
					
					<div><input type="submit" id="register-btn" class="btn btn-primary" value="수정하기"></div>
					<div><input type="button" class="btn btn-secondary" value="취소하기" onclick="history.back()"></div>
					
					<input type="hidden" name="delfile" value="n">
				</form>
			</div>
			
		</section>
	
	</main>


	<script>

		<c:if test="${result == 1}">
	    location.href="/planitshare/mypage.do?id=${dto.id}"
		</c:if>
	    
	    
		<c:if test="${result == 0}">
		    alert('정보 변경에 실패했습니다.');
		    history.back();
		</c:if> 
	
		//프로필 사진 수정할때 이미지 보여주기..(근데 적용이 안됨>아직 해결 x)
		function setThumbnail(event) {
			var reader = new FileReader(); 
			
			reader.onload = function(e) {
				var img = document.createElement("img");
				img.setAttribute("src", e.target.result); 
				document.querySelector("div#image-container").appendChild(img);
			};
			
			reader.readAsDataURL(event.target.files[0]); 
		
		}
		
		//프로필 사진 수정
		function delfile() {
			if ($('#filename').css('text-decoration').indexOf('line-through') == -1) {
			$('#filename').css('text-decoration', 'line-through');
			$('input[name=delfile]').val('y');
		} else {
			$('#filename').css('text-decoration', 'none');
			$('input[name=delfile]').val('n');
			}
		}
		
	</script>


</body>
</html>