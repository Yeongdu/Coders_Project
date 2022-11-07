<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

<!-- KaKao Login Js -->
<script src = "https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- KaKao Login Js -->

<!-- Naver Login Js -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<!-- Naver Login Js -->

<!-- Google Login Js -->
<script src="https://accounts.google.com/gsi/client" async defer></script>
<!-- Google Login Js -->
<script type="text/javascript">
	Kakao.init('8fa233a3b298fd44817a61f49898727e');
	console.log( Kakao.isInitialized() );
	
	// kakao 로그인
	function kakaoLogin() {
	    Kakao.Auth.login({
	      success: function (response) {
	        Kakao.API.request({
	          url: '/v2/user/me',
	          success: function (response) {
	        	  console.log(response)
	        	  
	        	  var id = response.kakao_account.email;
                  var nickname = response.properties.nickname;
                  
                  location.href="<%=request.getContextPath()%>/social_login_ok.do?id="+id+"&nickname="+nickname+"&token=kakao";
                  
	          },
	          fail: function (error) {
	            console.log(error)
	          },
	        })
	      },
	      fail: function (error) {
	        console.log(error)
	      },
	    })
	    
	  }
	// kakao 로그인 end
	
	
</script>
<style type="text/css">
	@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap')
	;
	
	body {
	cursor: url('<%=request.getContextPath()%>/qna_icon/cusor.png'),auto;
	font-family: 'Noto Sans KR' !important;	
	}

	#container{
		margin-top: 10%;
		width: 35%;
	}
	.text-on-pannel {
	  background: #fff none repeat scroll 0 0;
	  height: auto;
	  margin-left: 20px;
	  padding: 3px 5px;
	  position: absolute;
	  margin-top: -60px;
	  border: 3px solid #2b59c6;
	  border-radius: 8px;
	}
	
	
	#panel {
	      margin-bottom: 20px;
    background-color: #fff;
    border: 3px solid #2b59c6;
    border-radius: 4px;
    -webkit-box-shadow: 0 1px 1px rgb(0 0 0 / 5%);
    box-shadow: 0 1px 1px rgb(0 0 0 / 5%);
	  /* for text on pannel */
	  margin-top: 27px !important;
	}
	
	.panel-body {
	  padding-top: 30px !important;
	}
	
	#text {
		background-color: #2b59c6;
	}
	
	
	.login_sns {
		margin-left: 10%;
		width: 80%;
		padding: 20px;
		display: flex;
		border-bottom: 4px solid #0275d8;
		justify-content: center;
	}

	.login_sns li {
		padding: 0px 15px;
		list-style: none;
	}

	.login_sns a {
	  display: flex;
	  align-items: center;
	  justify-content: center;
	  font-size: 20px;
	}

	.login_input {
	 margin-left: 10%;
	  margin-top: 40px;
	  width: 80%;
	}
	
	.login_input > h5{
		font-size: 2rem;
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

	.login_etc {
	  padding: 10px;
	  width: 80%;
	  font-size: 12px;
	  display: flex;
	  justify-content: space-between;
	  align-items: center;
	  font-weight: bold;
	  margin-left: 10%;
	}

 	.submit {
	  margin-top: 50px;
	  width: 80%;
	  margin-left: 10%;
	}
	.submit input {
	  margin-bottom: 50px;
	  width: 100%;
	  height: 50px;
	  border: 0;
	  outline: none;
	  border-radius: 40px;
	  background: #2b59c6;
	  background: rgb(255, 255, 255);
	  color: black;
	  font-size: 1.2em;
	  letter-spacing: 2px;
	  transition: all 0.4s cubic-bezier(1, 1, 1, 1);
	}
	
	.submit_btn:hover {
	background: #2b59c6;;
	cursor: pointer;
	color: white;
	}
	
	
	b {
		color: red;
	}
	
	.wrap1 {
	  width: 100%;
	  height: 700px;
	  display: flex;
	  align-items: center;
	  justify-content: center;
	}
	
	.form1 {
	  width: 100%;
	  height: 700px;
	  display: flex;
	  align-items: center;
	  justify-content: center;
	}
	
	.wrap2 {
	  width: 100%;
	  height: 500px;
	  display: flex;
	  align-items: center;
	  justify-content: center;
	}
	
	.form2 {
	  width: 100%;
	  height: 500px;
	  display: flex;
	  align-items: center;
	  justify-content: center;
	}

	.login1 {
	  width: 100%;
	  height: 500px;
	  background: white;
	  border-radius: 20px;
	  display: flex;
	  justify-content: center;
	  align-items: center;
	  flex-direction: column;
	}
	
	.login_input1 {
	  margin-left: 200px;
	  margin-top: 20px;
	  width: 500px;
	}

	.login_input1 input {
	  width: 300px;
	  height: 50px;
	  border-radius: 30px;
	  margin-top: 10px;
	  padding: 0px 20px;
	  border: 1px solid lightgray;
	  outline: none;
	}
	
	.submit1 {
	  margin-left: 200px;
	  margin-top: 50px;
	  width: 500px;
	}
	.submit1 input {
	  width: 300px;
	  height: 50px;
	  border: 0;
	  outline: none;
	  border-radius: 40px;
	  background: rgb(255, 255, 255);
	  color: black;
	  font-size: 1.2em;
	  letter-spacing: 2px;
	  transition: all 0.4s cubic-bezier(1, 1, 1, 1);
	}
	
	fieldset.scheduler-border {
    border: 1px groove #ddd !important;
    padding: 0 1.4em 1.4em 1.4em !important;
    margin: 0 0 1.5em 0 !important;
    -webkit-box-shadow:  0px 0px 0px 0px #000;
            box-shadow:  0px 0px 0px 0px #000;
	}
	
	legend.scheduler-border {
	    font-size: 1.2em !important;
	    font-weight: bold !important;
	    text-align: left !important;
	}
	
	.title {
		width: 100%;
		margin-bottom: 25px;
	}
	
	.font {
	  width: 100%;
	  height: 50px;
	  border: 0;
	  outline: none;
	  background-color: #2b59c6;
	  color: white;
	  font-size: 2em;
	  letter-spacing: 2px;
	  text-align: center;
	}
	
	.font p {
		margin-top: 10px;
	}
	
	#modal_body {
		padding: 0px;
	}
</style>
</head>
<body>

<div class="container" id="container">
  <div class="panel" id="panel">
    <div class="panel-body">
			<form class="form" method="post" action="<%=request.getContextPath()%>/user_login_ok.do">
			<input type="hidden" name="token" value="user">
				<div class="login">
					  <h3 class="text-on-pannel text-primary" id="text"><strong class="text-uppercase"><p><a style="text-decoration: none; color: white;" href="<%=request.getContextPath() %>/main.jsp">CODE BOARD</a></p> </strong></h3>
					<div class="login_sns">
						<li>
						<!-- kakao 로그인 버튼 노출 영역 -->
							<a href="javascript:kakaoLogin();">
								<img src="<%=request.getContextPath() %>/upload/kakaoicon.png">
							</a>
						<!-- kakao 로그인 버튼 노출 영역 -->
						</li>
									
						<li>
						<!-- naver 로그인 버튼 노출 영역 -->
							<div id="naverIdLogin" style="display: none;"></div>
							<!-- 커스텀 버튼 -->
								<a href="#" class="naver-login" id="naverLogin">
									<img src="<%=request.getContextPath() %>/upload/navericon.png">
								</a> 
							<!-- 커스텀 버튼 -->
						<!-- naver 로그인 버튼 노출 영역 -->
						
						<!-- naver 로그인 -->
							<script type="text/javascript">
								var naverLogin = new naver.LoginWithNaverId(
									{
									clientId: "QUJaCNWazN945TqXtLvx",
									callbackUrl: "http://localhost:8282/Project/Login/callback.jsp",
									isPopup: false, /* 팝업을 통한 연동처리 여부 */
									loginButton: {color: "green", type: 3, height: 60} /* 로그인 버튼의 타입을 지정 */
									}
								);
							
								/* 설정정보를 초기화하고 연동을 준비 */
								naverLogin.init();
														
								const handleClick = () => {
									naverRef.current.children[0].click();
								}
												
								/* 이미지 버튼 클릭시 dispaly: none; 이 된 div id=naverIdLogin 실행*/
								$(document).on("click", "#naverLogin", function(){
									var naverLogin = document.getElementById("naverIdLogin").firstChild;
									naverLogin.click();
								});
							</script>
							<!-- naver 로그인 end -->
						</li>
									
						<li>
						<!-- google 로그인 버튼 노출 영역 -->
							<div id="g_id_onload"
								data-client_id="245672184873-e9t0u3q9anovb5il16eb6dkthv0r8go4.apps.googleusercontent.com"
								data-callback="handleCredentialResponse">
							</div>
							<div class="g_id_signin" id="googleIdLogin" data-type="icon" data-shape="circle"></div>
						<!-- google 로그인 버튼 노출 영역 -->
											
						<!-- goolge 로그인 -->
							<script>
								function handleCredentialResponse(response) {
																        	
									console.log("Encoded JWT ID token: " + response.credential);
																          
									const responsePayload = parseJwt(response.credential);
																          
									var nickname = responsePayload.name;
									var id = responsePayload.email;
																          
									location.href="<%=request.getContextPath()%>/social_login_ok.do?id="+id+"&nickname="+nickname+"&token=user";
								}
																        
								function parseJwt (token) {
									var base64Url = token.split('.')[1];
									var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
									var jsonPayload = decodeURIComponent(atob(base64).split('').map(function(c) {
									return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
								}).join(''));
																
								return JSON.parse(jsonPayload);
								};
										        
							</script>
						<!-- google 로그인 end -->
						</li>
					</div>
								
					<div class="login_input">
						<h5><b>*</b> E-mail</h5>
						<input type="email" class="form-control" name="id" placeholder="Email" required>
					</div>
					            
					<div class="login_input">
						<h5><b>*</b> Password</h5>
						<input type="password" class="form-control" name="pwd" placeholder="Password" required>
					</div>
					            
					<div class="login_etc">
						<div class="sign_up">
							<a class="nav-link" href="#myModal2" data-bs-toggle="modal">Sigh up</a>
						</div>
					                
						<div class="forgot_pw">
							<a class="nav-link" href="#myModal3" data-bs-toggle="modal">Forgot Password?</a>
						</div>
					</div>
					            
					<div class="submit">
						<input class="submit_btn"type="submit" value="Login">
					</div>
				</div>
			</form>
		</div>
		</div>
  </div>
<!-- 로그인 end -->


<!-- 회원가입 start -->
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
				url : "<%=request.getContextPath()%>/Login/idCheck.jsp",
				data : {paramId : userId},
				datatype : "jsp",
				success : function(data){
					if(data == -1){		// DB에 아이디가 존재하는 경우
						let warningTxt = '<font color="red" size="1.5em">중복된 이메일입니다.</font>';
						
						$("#idcheck").text('');		// span 태그 영역 초기화
							
						$("#idcheck").append(warningTxt);
						
						$("#id_input").val('');
							
						
				 	}else if(data == 1){
						let warningTxt = '<font color="red" size="1.5em">이메일을 제대로 입력하세요.</font>';
						
						$("#idcheck").text('');		// span 태그 영역 초기화
						
						$("#idcheck").append(warningTxt);
						
						$("#id_input").val('');
						
						
					}else {
						let warningTxt = '<font color="blue" size="1.5em">사용 가능한 아이디입니다.</font>';
						
						$("#idcheck").text('');		// span 태그 영역 초기화
						
						$("#idcheck").append(warningTxt);
						
						
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

				let warningTxt = '<font color="red" size="1.5em">8자리 ~ 20자리 이내로 입력해주세요.</font>';
				
				$("#pwdcheck").text('');		// span 태그 영역 초기화
				
				$("#pwdcheck").append(warningTxt);
				
				$("#pwd_input").val('');
				
				
			 }else if(num < 0 || eng < 0 || spe < 0 ){
				 
			  	let warningTxt = '<font color="red" size="1.5em">영문, 숫자, 특수문자를 혼합하여 입력해주세요.</font>';
				
				$("#pwdcheck").text('');		// span 태그 영역 초기화
				
				$("#pwdcheck").append(warningTxt);
				
				$("#pwd_input").val('');
				
				
			 }else {
				 
				let warningTxt = '<font color="blue" size="1.5em">사용 가능한 비밀번호 입니다.</font>';
					
				$("#pwdcheck").text('');		// span 태그 영역 초기화
					
				$("#pwdcheck").append(warningTxt);
				
			 }
		});
		
		$("#pwd_ck_input").blur(function(){
			
			var pwd = $("#pwd_input").val();
			var pwdck = $("#pwd_ck_input").val();
			
			if(pwd == pwdck){
				
				let warningTxt = '<font color="blue" size="1.5em">비밀번호가 일치합니다.</font>';
				
				$("#pwdcheck_ck").text('');		// span 태그 영역 초기화
				
				$("#pwdcheck_ck").append(warningTxt);
				
				
				
			}else {
				
				let warningTxt = '<font color="red" size="1.5em">비밀번호가 일치하지 않습니다.</font>';
				
				$("#pwdcheck_ck").text('');		// span 태그 영역 초기화
				
				$("#pwdcheck_ck").append(warningTxt);
				
				$("#pwd_ck_input").val('');
				
			}
		});
		
	});
</script>
	
	<!-- 회원가입 start -->
	<div class="container">
	  <div class="modal fade" id="myModal2">
	    <div class="modal-dialog">
	      <div class="modal-content">
	        <div class="modal-body" id="modal_body">
	          <div class="wrap1">
				<form class="form1" method="post" action="<%=request.getContextPath()%>/user_signup_ok.do">
					<div class="login1">
					<div class="title">
						<div class="font">
							<p>SIGN UP</p>
						</div>
					</div>
						<div class="login_input1">
							<h5><b>*</b> E-mail&nbsp;&nbsp;<span id="idcheck"></span></h5>
							<input type="email" id="id_input" class="form-control" name="id" placeholder="Email" required>
						</div>
				            
						<div class="login_input1">
							<h5><b>*</b> Password&nbsp;&nbsp;<span id="pwdcheck"></span></h5>
							<input type="password" id="pwd_input" class="form-control" name="pwd" placeholder="Password" required>
						</div>
						
						<div class="login_input1">
							<h5><b>*</b> Password Check&nbsp;&nbsp;<span id="pwdcheck_ck"></span></h5>
							<input type="password" id="pwd_ck_input" class="form-control" placeholder="Password Check" required>
						</div>
						
						<div class="login_input1">
							<h5><b>*</b> Name&nbsp;&nbsp;</h5>
							<input type="text" name="name" class="form-control" placeholder="Name" required>
						</div>
				            
				            
						<div class="submit1">
							<input class="submit_btn"type="submit" value="SignUp">
						</div>
					</div>
				</form>
			 </div>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 회원가입 end -->
	
	<!-- 아이디찾기 start -->
	<div class="container">
	  <div class="modal fade" id="myModal3">
	    <div class="modal-dialog">
	      <div class="modal-content">
	        <div class="modal-body" id="modal_body">
	          <div class="wrap2">
				<form class="form2" method="post" action="<%=request.getContextPath()%>/user_search_ok.do">
				<input type="hidden" name="token" value="user">
					<div class="login1">
					<div class="title">
						<p class="font">SEARCH</p>
					</div>
						<div class="login_input1">
							<h5><b>*</b> E-mail</h5>
							<input type="email" id="id_input" name="id" class="form-control" placeholder="Email" required>
						</div>
								            
						<div class="login_input1">
							<h5><b>*</b> Name</h5>
							<input type="text" name="name" class="form-control" placeholder="Name" required>
						</div>
								            
						<div class="submit1">
							<input class="submit_btn"type="submit" value="Search">
						</div>
					</div>
				</form>
			  </div>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 아이디찾기 end -->
</body>
</html>