<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">
	$(function(){
		
		// 여러 ajax에서 동일하게 사용되는 속성 설정.
		$.ajaxSetup({
			ContentType : "application/x-www-form-urlencoded;charset=UTF-8",
			type : "post"
		});
		
		$("#id_input").blur(function() {
			
			var userId = $("#id_input").val();
			
			// 아이디 중복 여부 확인 - Ajax 기술
			$.ajax({
				type : "post",
				url : "idCheck.jsp",
				data : {paramId : userId},
				datatype : "jsp",
				success : function(data){
					if(data == -1){		// DB에 아이디가 존재하는 경우
						let warningTxt = '<font color="red">중복된 이메일입니다.</font>';
							
						$("#idcheck").text('');		// span 태그 영역 초기화
							
						$("#idcheck").append(warningTxt);
							
						$("#id_input").val('').focus();
						
				 	}else if(data == 1){
						let warningTxt = '<font color="red">이메일을 제대로 입력하세요.</font>';
						
						$("#idcheck").text('');		// span 태그 영역 초기화
						
						$("#idcheck").append(warningTxt);
						
						$("#id_input").val('').focus();
						
					}else {
						let warningTxt = '<font color="blue">사용 가능한 아이디입니다.</font>';
						
						$("#idcheck").text('');		// span 태그 영역 초기화
						
						$("#idcheck").append(warningTxt);
						
						$("pwd_input").val('').focus();
						
					}
				},
				
				error : function(data){
					alert("데이터 통신 오류입니다.");
				}
			});
			
		});
		
		$("#pwd_input").blur(function(){
			
			var pwd = $("#pwd_input").val();
			
			var num = pwd.search(/[0-9]/g);
			var eng = pwd.search(/[a-zA-Z]/ig);
			var spe = pwd.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

			if(pwd.length < 8 || pwd.length > 20){

				let warningTxt = '<font color="red">8자리 ~ 20자리 이내로 입력해주세요.</font>';
				
				$("#pwdcheck").text('');		// span 태그 영역 초기화
				
				$("#pwdcheck").append(warningTxt);
				
				$("#pwd_input").val('').focus();
				
			 }else if(num < 0 || eng < 0 || spe < 0 ){
				 
			  	let warningTxt = '<font color="red">영문, 숫자, 특수문자를 혼합하여 입력해주세요.</font>';
				
				$("#pwdcheck").text('');		// span 태그 영역 초기화
				
				$("#pwdcheck").append(warningTxt);
				
				$("#pwd_input").val('').focus();
				
			 }else {
				 
				let warningTxt = '<font color="blue">사용 가능한 비밀번호 입니다.</font>';
					
				$("#pwdcheck").text('');		// span 태그 영역 초기화
					
				$("#pwdcheck").append(warningTxt);
					
			 }
		});
		
		$("#pwd_ck_input").blur(function(){
			
			var pwd = $("#pwd_input").val();
			var pwdck = $("#pwd_ck_input").val();
			
			if(pwd == pwdck){
				
				let warningTxt = '<font color="blue">비밀번호가 일치합니다.</font>';
				
				$("#pwdcheck_ck").text('');		// span 태그 영역 초기화
				
				$("#pwdcheck_ck").append(warningTxt);
				
			}else {
				
				let warningTxt = '<font color="red">비밀번호가 일치하지 않습니다.</font>';
				
				$("#pwdcheck_ck").text('');		// span 태그 영역 초기화
				
				$("#pwdcheck_ck").append(warningTxt);
				
				$("#pwd_ck_input").val('').focus();
			}
		});
		
	});
</script>
<style type="text/css">
	<style type="text/css">
	* {
	 	 margin: 0;
	 	 padding: 0;
	 	 box-sizing: border-box;
	 	 font-family: "Noto Sans KR", sans-serif;
	}

	a {
  		text-decoration: none;
  		color: black;
	}
	
	b {
		color: red;
	}

	.wrap {
	  width: 100%;
	  height: 100vh;
	  display: flex;
	  align-items: center;
	  justify-content: center;
	}
	
	.form {
	  width: 100%;
	  height: 100vh;
	  display: flex;
	  align-items: center;
	  justify-content: center;
	}

	.login {
	  width: 30%;
	  height: 600px;
	  background: white;
	  border-radius: 20px;
	  display: flex;
	  justify-content: center;
	  align-items: center;
	  flex-direction: column;
	}
	

	h1 {
		color: #4B89DC;
		font-size: 6em;
	}

	.login_input {
	  margin-top: 20px;
	  width: 80%;
	}

	.login_input input {
	  width: 100%;
	  height: 50px;
	  border-radius: 30px;
	  margin-top: 10px;
	  padding: 0px 20px;
	  border: 1px solid lightgray;
	  outline: none;
	}


	.submit {
	  margin-top: 50px;
	  width: 80%;
	}
	.submit input {
	  width: 100%;
	  height: 50px;
	  border: 0;
	  outline: none;
	  border-radius: 40px;
	  background: linear-gradient(to left, rgb(137, 178, 233), rgb(131, 201, 231));
	  color: white;
	  font-size: 1.2em;
	  letter-spacing: 2px;
	}
	
	.submit_btn:hover {
	cursor: pointer;
	filter: brightness(0.85);
}
</style>
</head>
<body>
	<div class="wrap">
		<form class="form" method="post" action="<%=request.getContextPath()%>user_signup_ok.do">
			<div class="login">
			<h1>Coders</h1>
				<div class="login_input">
					<h4><b>*</b> E-mail&nbsp;&nbsp;<span id="idcheck"></span></h4>
					<input type="email" id="id_input" name="id" placeholder="Email" required>
				</div>
		            
				<div class="login_input">
					<h4><b>*</b> Password&nbsp;&nbsp;<span id="pwdcheck"></span></h4>
					<input type="password" id="pwd_input" name="pwd" placeholder="Password" required>
				</div>
				
				<div class="login_input">
					<h4><b>*</b> Password Check&nbsp;&nbsp;<span id="pwdcheck_ck"></span></h4>
					<input type="password" id="pwd_ck_input" placeholder="Password Check" required>
				</div>
				
				<div class="login_input">
					<h4><b>*</b> Name&nbsp;&nbsp;</h4>
					<input type="text" name="pwd" placeholder="Name" required>
				</div>
		            
		            
				<div class="submit">
					<input class="submit_btn"type="submit" value="Signup">
				</div>
			</div>
		</form>
	</div>
</body>
</html>