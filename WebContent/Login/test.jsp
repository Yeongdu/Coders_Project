<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="Login/style.css" rel="stylesheet" type="text/css">
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
</head>
<body>

	<div class="container">
		<div class="wrap">
			<form class="form" method="post" action="<%=request.getContextPath()%>/user_login_ok.do">
			<input type="hidden" name="token" value="user">
				<div class="login">
					<p><a href="<%=request.getContextPath() %>/main.jsp">Coders</a></p>
					<div class="login_sns">
						<li>
						<!-- kakao 로그인 버튼 노출 영역 -->
							<a href="javascript:kakaoLogin();">
								<img src="upload/kakaoicon.png">
							</a>
						<!-- kakao 로그인 버튼 노출 영역 -->
						</li>
									
						<li>
						<!-- naver 로그인 버튼 노출 영역 -->
							<div id="naverIdLogin" style="display: none;"></div>
							<!-- 커스텀 버튼 -->
								<a href="#" class="naver-login" id="naverLogin">
									<img src="upload/navericon.png">
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
	        <div class="modal-body">
	          <div class="wrap1">
				<form class="form1" method="post" action="<%=request.getContextPath()%>/user_signup_ok.do">
					<div class="login1">
					<p class="font">SignUp</p>
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
							<input class="submit_btn"type="submit" value="Signup">
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
	        <div class="modal-body">
	          <div class="wrap2">
				<form class="form2" method="post" action="<%=request.getContextPath()%>/user_search_ok.do">
				<input type="hidden" name="token" value="user">
					<div class="login1">
					<p class="font">Search</p>
						<div class="login_input1">
							<h5><b>*</b> E-mail</h5>
							<input type="email" id="id_input" name="id" class="form-control" placeholder="Email" required>
						</div>
								            
						<div class="login_input1">
							<h5><b>*</b> Name</h5>
							<input type="text" name="name" class="form-control" placeholder="Name" required>
						</div>
								            
						<div class="submit1">
							<input class="submit_btn"type="submit" value="Password Search">
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