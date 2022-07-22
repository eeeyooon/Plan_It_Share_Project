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
		margin-left: 150px;
	}
	#city-submenu {
		box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
		width: 1400px;
		height: 50px;
		display: flex;
		justify-content: space-around;
		align-items : center;
		font-size: 1.2rem;
	}
	
	h2 {
		text-align: center;
		margin-bottom: 50px;
		margin-top: 100px;
	}
	
	#search-box {
		hint
		margin: 50px 0;
		text-align: center;
		
	}
	
	#search-box > * {
		display: inline-block;
		margin-right: 10px;
	}
	
	#search-box select {
		width: 100px;
	}
	
	#search-box input[type=text] {
		width: 300px;
	}
	
	#search-box input[type=button] { 
		width: 80px;
	}
	
	#img1 {
		margin:0;
		width: 350px;
		height: 200px;
	}
	
	.imgtd {
		width: 200px;
		border: none;
	}
	
	.list {
        float:left;
        margin-bottom: 10px;
        margin-right: 20px;
    
    }
    
    .table td {
    	border: none;
    }
    
    .list:::after {
        content: '';
        display: block;
        clear: both;
    }
    
    .list > img {
        width: 100%;
        height: 100%;
    }

    .list > div:nth-child(2) {
        margin: 0;
    }
    
    .table {
    	text-align: center;
    	width: 1190px;
    	margin-top: 80px;
    	margin-right: 150px;
    	padding: 0;
    	margin-bottom: 80px;
    	border: none;

    }
    
    tr, td {
    	padding: 0px;
    	border: none;
    }
    
    #li1 {
    	display: inline;
    	margin-left: 90px;
    	font-size: 20px;
    }
    
    #search-error {
    	color: red;
    	margin-top: 10px;
    	text-align: center;
    }
    
     #subbox {
    	margin-top: 100px;
    }
    
    .control {
    	margin-left:250px;
    }
    
    .sub {
    	width: 300px;
    	display: inline-block;
    	padding-left: 100px;
    	height: 240px;
    	vertical-align: top;
    }
    
    #subbox {
  		width: 1200px;
  		margin-left:350px;
    }
    
    .cityr{
    	display: inline;
    }
    
    .cityr {
        float:left;
        margin-bottom: 10px;
        margin-right: 20px;
    
    }
    
    .cityr:::after {
        content: '';
        display: block;
        clear: both;
    }
    
    #cityn{
    	font-size: 1.5em;
    }
    
    
</style>
</head>
<body>
	<main>
		<%@ include file="/WEB-INF/views/inc/header.jsp" %>
		<section>
		
			<h2>어디로 여행가시나요?</h2>
			
			<form method= "POST" action="/planitshare/city.do">
			<div id="search-box">
				
				<input type="text" name="city" id="" class="form-control" placeholder="도시명을 입력해주세요."/>
				<button class="btn btn-secondary"><i class="fa-solid fa-magnifying-glass"></i></button>
				
			</div>
			<c:if test="${not empty searchError}">
                    <div id="search-error">
                        <span>올바른 도시명이 아닙니다.</span>
                    </div>
            </c:if>
			</form>
			
			<h2>인기 여행지</h2>
			
			<div>
				<table class="table control">
						<c:forEach items="${rlist}" var="rdto">
							<tr class="list">
								<td class="imgtd">
									<a href="/planitshare/city.do?cseq=${rdto.cseq}">
									<img src="/planitshare/asset/image/${rdto.image}" id="img1">
									</a>
									<span>${rdto.name}</span>
								</td>
							</tr>
						</c:forEach>
				</table>
			</div>
			
			
				<ul class="control">
					<c:forEach var="dto" items="${list}">
						<li id="li1"><a href="/planitshare/city.do?cseq=${dto.seq}">${dto.name}</a></li>
					</c:forEach>
				</ul>
			

				<div id="subbox" class="control">
					<c:forEach items="${dlist}" var="dto">	
						<div class="sub">
								<div id="cityn">
								${dto.distrinct}
								</div>
								<ul>
									<c:forEach items="${dto.clist}" var="cdto">
									
									<li class="cityr"><a href="/planitshare/city.do?cseq=${cdto.seq}">${cdto.name}</td>
									</c:forEach>
								
								</li>
						
							
						</div>
					
					</c:forEach>
					</div>
					
					
			
		</section>
	</main>

</body>
</html>