<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Plan It Share</title>
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<style>

	h2 {
	
	text-align: center;
	margin-bottom: 40px;
	
	}
	
	
	form > div {
		margin-bottom: 50px;
	}
	
	
	
	#id-div > input {
		display: inline;
	}
	
	
	#idcheck {
	
		margin-top: 20px;
	}
	
	
	#gender-div > div {
		display: inline;
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
    
    
    #id-check-result {
        margin-top: 10px;
    }
    
    
     .error_message {
        color : red;
    }
    
    
    

</style>
</head>
<body>
	
	
	<main>
		<%@ include file="/WEB-INF/views/inc/header.jsp" %>

		<section>
		
			<div id="box">
			       
		        <h2>회원가입</h2>
		            <form action="/planitshare/register.do" method="post" enctype="multipart/form-data">
		
					
				<div id="id-div">	
					<h4>아이디</h4>
					<input type="text" class= "form-control" id="id" name="id" placeholder="아이디를 입력해주세요." required>
					<input type="button" class= "btn btn-dark" id="idcheck" value="아이디 중복검사" >
					 <div id="idcheck-result" class="error_message"></div>
				</div>	
				
				<div id="pw-div">	
					<h4>비밀번호</h4>
					<input type="password" class= "form-control" id="pw" name="pw" placeholder="영어 대소문자 + 숫자 + 특수문자 8~16자 이내" required>
					<div id="pwcheck-result" class="error_message"></div>
				</div>		
				
				<div id="pwcheck-div">	
					<h4>비밀번호 확인</h4>
					<input type="password" class= "form-control" id="pwcheck" name="pwcheck" placeholder="비밀번호를 입력해주세요." required>
					<div id="samePw" class="error_message"></div>
				</div>
				
				<div id="name-div">	
					<h4>이름</h4>
					<input type="text" class= "form-control" id="name" name="name" placeholder="이름을 입력해주세요." required>
					<div id="namecheck-result" class="error_message"></div>
				</div>
			
				<div id="tel-div">	
					<h4>전화번호</h4>
					<input type="text" class= "form-control" id="tel" name="tel" placeholder="전화번호를 입력해주세요." required>
					<div id="telcheck-result" class="error_message"></div>
				</div>
				
				<div id="gender-div">
					<h4>성별</h4>
					 <div>
				      <input type="radio" id="male" name="gender" value="m" checked>
				      <label for="male">남자</label>
				    </div>
				    <div>
				      <input type="radio" id="female" name="gender" value="f">
				      <label for="female">여자</label>
				    </div>
		
				</div>
				
				<div id="file-div">
					<h4>프로필 사진</h4>
					<div>
						<input type="file" name="profile" class="form-control" accept="image/*" onchange="setThumbnail(event);">
						<div id="image-container"></div>
						 
					</div>
				</div>
				
				 <div class="d-grid gap-2">
		         <input type="submit" value="회원 가입" id="register-btn" class="btn btn-primary">
		         </div>
	         
	         
	
				</form>
			
			</div>
			
		</section>
	
	</main>


	<script>
		
		
		//아이디 중복검사
		
		let isValidId = false;
		
		$('#idcheck').click(function() {
            $.ajax({
                url: '/planitshare/idcheck.do',
                type: 'POST',
                data: "id=" + $('#id').val(),
                dataType: 'json',
                success: function(result) {
                	
                    if (result.result == "1") {
                        $('#idcheck-result').text('이미 존재하는 아이디입니다.');
                        $('#idcheck-result').css('color', 'red');
                        isValidId = false;
                    } else {
                        $('#idcheck-result').text('사용 가능한 아이디입니다.');
                        $('#idcheck-result').css('color','cornflowerblue');
                        isValidId = true;
                    }
                    if (isValidId) {
                        $('#register-btn').removeAttr('disabled');
                    } else {
                        $('#register-btn').attr('disabled', true);
                    }
                },
                error: function(a, b, c) {
                    console.log(a, b, c);
                }	
            });
        });
	
		
		//유효성 검사
		 $('form').submit(function() {
	            let pw = $('#pw').val();
	            let pwCheck = $('#pwcheck').val();
	            let name = $('#name').val();
	            let tel = $('#tel').val();
	            
	            if (!/^[A-Za-z]{1}[A-Za-z0-9]{3,15}$/.test($('#id').val())) {
	                $('#idcheck-result').css('color', 'red');
	                $('#idcheck-result').text("아이디는 영대소문자, 숫자를 포함한 4 ~ 16자로 입력해주세요.");
	                return false;
	            }
	            if (!/^[A-Za-z0-9]{7,15}$/.test(pw)) {
	                $('#pwcheck-result').text("비밀번호는 영대소문자, 숫자를 포함한 8 ~ 16자로 입력해주세요.");
	                return false;
	            }
	            if (pw != pwCheck) {
	                $('#samePw').text('입력하신 비밀번호와 일치하지 않습니다.');
	                return false;
	            }
	            if (!/^[가-힣]{2,6}$/.test(name)) {
	                $('#namecheck-result').text('이름은 2~6자 이내 한글로 입력해주세요.');
	                return false;
	            }
	            if (!/^[0-9]{2,3}[0-9]{3,4}[0-9]{4}$/.test(tel)) {
	                $('#telcheck-result').text('전화번호는 숫자 11자리로 입력해주세요.');
	                return false;
	            }
	            $("#register-btn").submit();
	        });
	
		//파일 업로드 미리보기
		function setThumbnail(event) {
				var reader = new FileReader(); 
				
				reader.onload = function(e) {
					var img = document.createElement("img");
					img.setAttribute("src", e.target.result); 
					document.querySelector("div#image-container").appendChild(img);
				};
				
			reader.readAsDataURL(event.target.files[0]); 
			
		}
		
		
		
	</script>


</body>
</html>