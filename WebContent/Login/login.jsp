<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- KaKao Login Js -->
<script src = "https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- KaKao Login Js -->

<!-- Naver Login Js -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<!-- Naver Login Js -->

<!-- Google Login Js -->
<script src="https://accounts.google.com/gsi/client" async defer></script>
<!-- Google Login Js -->

<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
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
                  
//                   if( id == undefined || id == null) {
// 						alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
// 						/* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
// 						kakaoLogin.reprompt();
// 						return;
// 					}
                  
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

	li {
  		list-style: none;
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
	

	h1 a{
		color: #4B89DC;
		font-size: 4em;
	}
	.login_sns {
		padding: 20px;
		display: flex;
	}

	.login_sns li {
		padding: 0px 15px;
	}

	.login_sns a {
	  display: flex;
	  align-items: center;
	  justify-content: center;
	  font-size: 20px;
	}

	.login_id {
	  margin-top: 20px;
	  width: 80%;
	}

	.login_id input {
	  width: 100%;
	  height: 50px;
	  border-radius: 30px;
	  margin-top: 10px;
	  padding: 0px 20px;
	  border: 1px solid lightgray;
	  outline: none;
	}

	.login_pw {
	  margin-top: 20px;
	  width: 80%;
	}

	.login_pw input {
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
	  font-size: 14px;
	  display: flex;
	  justify-content: space-between;
	  align-items: center;
	  font-weight: bold;
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
	<form class="form" method="post" action="<%=request.getContextPath()%>/user_login_ok.do">
	<input type="hidden" name="token" value="user">
		<div class="login">
		<h1><a href="main.jsp">Coders</a></h1>
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
				
				<div class="login_id">
	                <h4>E-mail</h4>
	                <input type="email" name="id" placeholder="Email" required>
	            </div>
	            
	            <div class="login_pw">
	                <h4>Password</h4>
	                <input type="password" name="pwd" placeholder="Password" required>
	            </div>
	            
	            <div class="login_etc">
	                <div class="sign_up">
	                <a href="Login/signup.jsp">Sigh up</a>
	                </div>
	                
	                <div class="forgot_pw">
	                <a href="">Forgot Password?</a>
	            	</div>
	            </div>
	            
	            <div class="submit">
	                <input class="submit_btn"type="submit" value="Login">
	          	</div>
			</div>
		</form>
	</div>
</body>
</html>