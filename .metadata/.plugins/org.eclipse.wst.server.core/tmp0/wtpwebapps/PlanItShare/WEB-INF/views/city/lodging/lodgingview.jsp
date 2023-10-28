<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Plan It Share</title>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<link rel="stylesheet" href="/planitshare/asset/css/rateit.css"/>

<style>
	#header-menu li:nth-child(2) > a{
		color: #6DA2DF;
	}

	.fa-solid.fa-heart {
   		color:tomato;
   	}
   	
   	.container img {  
   		width: 500px;
   		heigth: 500px;
   		background-size: contain;	
   		float: left;
   		margin-right: 20px;
   	}
   
   	.container {
   		width: 900px;
   		margin-bottom: 10px;
   		padding: 10px;
   		margin-bottom: 70px;
   		
   	}
   
   	.container::after {
   		content: '';
   		display: block;
   		clear: both;
   		
  	 }

	ul {
   		list-style: none;
   		margin-top: 70px;
   	}
   	
   	.tblAddComment textarea {
		resize: none;
		height: 100px;
		width: 800px;
		margin-right: 14px;
		float: right;
	}
	
	textarea[name=content] {
		margin-bottom: 20px;
	}
		
	

   	ul > li:first-child {
		font-size: 25px;
	}
   	
   	.badge {
   		width: 40px;
   		height: 20px;
   		margin-right: 5px;
   		float: right;
   	}
   	
   	.badge a {
   		color: white;
   		
   	}
   	
   	.comment img {
  	    width: auto; 
  		height: auto;
   		max-width: 200px;
   		max-height: 200px;
   		margin-bottom: 10px;
   	}
   	
   	#info {
   		color: gray;
   	
   	}
   	
   	.fa-solid.fa-star {
   		color: gold;
   		margin-left: 10px;
   	}
   	
   	#like {
      outline: none;
      border: none;
      background-color: white;
      display: inline-block;
      margin-bottom: 50px;
      float: right;
    }
   
    #like i {
      color: black;
      font-size: 2rem;
    }
	   
    #like i.liked {
      color: tomato;
      font-size: 2rem;
    }
    
    

</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/inc/header.jsp" %>
	
	<main>
		<section>
			<div class="container">
	         <img src="/planitshare/asset/image/${dto.image}">
		         <ul>
		         	<li>${dto.name}</li>
					<li>${dto.address}</li>
		         	<li>체크인시간: ${dto.checkin} 체크아웃시간: ${dto.checkout}
		         	<li>${dto.category}</li>
		         	<li>
			         	<i class="fa-solid fa-heart"></i>
			         	<span id="likeCnt">${dto.likecnt}</span>
			         	<i class="fa-solid fa-star"></i>${dto.reviewavg}
		         	</li>
		         	
		         </ul>

		         <button id="like"><i class="fa-solid fa-heart"></i></button>

         	</div>
         	
         	<!-- 댓글쓰기 -->
         	<form action="/planitshare/city/lodgingreview.do" method="post" enctype="multipart/form-data">
			<table class="tblAddComment">
				<tr>
					<td>
						<div class="rateit" data-rateit-resetable="false" data-rateit-mode="font" style="font-size:35px"></div>
						<input type="file" name="image"> 
					</td>
				</tr>
				<tr>
					<td>
						<textarea class="form-control" name="content" required></textarea>
					</td>
					<td>
						<button class="btn btn-secondary" type="submit" >
							리뷰등록하기
						</button>
					</td>
				</tr>
				
			</table>
         	
         	<input type="hidden" name="lseq" value="${dto.seq}">
			<input type="hidden" name="star">
         	
			</form>
			
			<!-- 댓글 목록  -->
			<table class="table table-bordered comment">
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
						<div class="content">${cdto.content}</div>
						<div class="btn-box">
						<c:if test="${auth.id == cdto.id}"> 
							<span class="badge badge-secondary"><a href="#!" onclick="delComment(${cdto.seq});">삭제</a></span>
							<span class="badge badge-secondary"><a href="#!" onclick="editcomment(this, ${cdto.seq});">수정</a></span>
						</c:if>
						</div>
					</td>
				</tr>
				</c:forEach> 
				
			</table>
			
			<c:if test="${list.size() >= 10}">
			<div>
				<a href="javascript:;" id="review-more" onclick="reviewMore(${dto.seq})"><i class="fa-solid fa-plus"></i> 댓글 10개씩 더보기</a>
			</div>
			</c:if>
			
			
			 
		</section>
	</main>
<script src="/planitshare/asset/js/jquery.rateit.js"></script>	
<script>

	 	$('.rateit').bind('rated', function (event, value) {
		  	$('input[name=star]').val(value);

		});
	  
	     //댓글 삭제 
	     
	     
	     function delComment(seq) {
			
	    	 let tr = $(event.target).parents('tr');
	    	 
	    	 if(confirm('삭제하시겠습니까?'))
	            $.ajax({
	               type: 'POST',
	               url: '/planitshare/city/lodgingreviewdel.do',
	               data: 'seq=' + seq,
	               dataType: 'json',
	               success: function(result){
	                  
	                  if (result.result == "1"){

	                    tr.remove();
	                     
	                  } else {
	                     alert('faild');                     
	                  }
	                  
	               },
	               error: function(a,b,c){
	                  console.log(a,b,c);
	               }
	               
	                   
	            });
	            
	      }
	         
 		
	     
	     
	     //찜하기(좋아요)
	 	 $(document).on("click", '#like', function() {
	 		 
			      $.ajax({
			         type: 'GET',
			         url: '/planitshare/city/lodginglike.do',
			         dataType: 'json',
			         data: 'seq=' + ${dto.seq},
			         success: function(result) {
			            if (result.status == 'insertLike') {
			               $('#like i').addClass('liked');
			               let likeCnt = $('#likeCnt').html();
			               $('#likeCnt').html(parseInt(likeCnt) + 1);
			            } else {
			               $('#like i').removeClass('liked');
			               let likeCnt = $('#likeCnt').html();
			               $('#likeCnt').html(parseInt(likeCnt) - 1);
			            }
			         },
			         error: function(a, b, c) {
			            console.log(a, b, c);
			         }
			      });
			   });
	     
		<c:if test="${like == 'y'}">
		  $('#like i').addClass('liked');
		 </c:if>
	     
	     //변수 선언 
	     let first = 1
	     let last = 10
	   
	     // 리뷰 더보기
	     function reviewMore(seq) {
	    	 
	    	 // 
	    	 first += 10
	    	 last += 10
	    	 
	    	 $.ajax({
				 url:'/planitshare/city/lodgingreviewmore.do',
				 type: 'POST',
				 dataType: 'html',
				 
				 data: {
					 'lseq'  	: seq,
					 'first' 	: first,
					 'last' 	: last,
				 },
				 success:
					function(result) {
					 console.log(result)
					 
					 if( result.includes("EMPTY") ){
						 alert('더이상 댓글이 없습니다.')
						 return
					 }
					 
					 $('.comment tbody').append(result)
				 },
			 	 error:
					function(a,b,c){
					
				 }
	
		 	 });
	    	 
	     }
	     
	     

	 		

</script>

</body>
</html>



