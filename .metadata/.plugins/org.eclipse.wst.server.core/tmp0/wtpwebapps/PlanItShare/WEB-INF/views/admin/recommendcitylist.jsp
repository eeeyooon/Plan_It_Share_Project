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
      display: inline-block;
      width: 2500px;
   }
	
	
	h2 {
		text-align: center;
		margin-bottom: 30px;
		margin-top: 30px;
	}
			
	#img1 {
		margin:0;
		width: 350px;
		height: 200px;
	}
	
	.imgtd {
		position: relative;
		width: 200px;
		height: 200px;
		border: none;
	}

	
	.list {
        float:left;
        margin-bottom: 10px;
        margin-right: 20px;
    
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
    	float:left;
    	text-align: center;
    	width: 1190px;
    	margin-top: 50px;
    	margin-right: 150px;
    	border-collapse: collapse;
    	padding: 0;
    	margin-bottom: 80px;

    }
    
    tr, td {
    	padding: 0px;
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
   		width: 1000px;
    	margin-top: 100px;
    }
    #subcity {
    	float:left;
    	margin-left: 100px;
    }
    
    #sub{
    	float:left;
    
    }
    
    .table td {
    	border: none;
    
    }
    
    .sub {
    	margin-left: 150px;
    }
    #admin-submenu {
      display:inline-block;
      width: 200px;
      margin-right: 130px;
      margin-top: 100px;
      margin-left: 130px;
   }
   
   #admin-submenu li {
      list-style: none;
      margin-bottom: 15px;
      font-size: 23px;
      font-weight: bold;
   }
   
   h1{
   		display: inline;
   		width: 1000px;
   		background-color: #CCC;
   		float:left;
   }
   
   #each {
   	  width:1000px;
   	  float: left;
   }
   
   #sub {
   	  float:left;
   }
   
   #head {
   	  display: block;
   	  text-align:center;
   
   }
   
   #all {
   	  width: 1900px;
   }
   
   #delbtn {
   	  position: absolute;
   	  top: 20px;
   	  right: 15px;
   
   }
   
   #search-box {
		hint
		margin-top: 50px;
		text-align: right;
		padding-right: 270px;
		
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
	#search-error {
    	color: red;
    	margin-top: 10px;
    	text-align: center;
    }
   
</style>
</head>
<body>
	
	
	<main>
		<%@ include file="/WEB-INF/views/inc/header.jsp" %>
		<section>
		
		
		<div id="head"><h2>추천 여행지 관리</h2></div>
		
		
		<div id="sub">
			<%@ include file="/WEB-INF/views/inc/adminsubmenu.jsp" %>
         	</div>
		
		
			<div>
				<div>
				<form method= "GET" action="/planitshare/recommendcityadd.do">
				<div id="search-box">
				
				<input type="text" name="city" id="" class="form-control" placeholder="등록할 추천도시명을 입력해주세요."/>
				<button class="btn btn-secondary"><i class="fa-solid fa-magnifying-glass"></i></button>
            
				
				
				</div>
				</form>
				</div>
				<table class="table">
						<c:forEach items="${rlist}" var="rdto">
							<tr class="list">
								<td class="imgtd">
									<form method = "GET" action="/planitshare/recommendcitylist.do">
									<img src="/planitshare/asset/image/${rdto.image}" id="img1">
									<button class="btn btn-secondary" id="delbtn">X</button>
									<span>${rdto.name}</span>
									<input type="hidden" name="cityseq" value="${rdto.cseq}"/>
									</form>
								</td>
							</tr>
						</c:forEach>
				</table>
				</div>
			

			
			
		</section>
	</main>


	<script>
	
	</script>


</body>
</html>