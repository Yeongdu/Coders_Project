<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="245672184873-e9t0u3q9anovb5il16eb6dkthv0r8go4.apps.googleusercontent.com">
<title>Insert title here</title>
<script src = "https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
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
                  
				  location.href="<%=request.getContextPath()%>/user_login_ok.do?id="+id+"&nickname="+nickname+"&token=kakao";
                  
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
	// kako 로그인 end
	
	// google 로그인
	function googleLogin() {
        // Useful data for your client-side scripts:
        var profile = googleUser.getBasicProfile();
        console.log("ID: " + profile.getId()); // Don't send this directly to your server!
        console.log('Full Name: ' + profile.getName());
        console.log('Given Name: ' + profile.getGivenName());
        console.log('Family Name: ' + profile.getFamilyName());
        console.log("Image URL: " + profile.getImageUrl());
        console.log("Email: " + profile.getEmail());
        // The ID token you need to pass to your backend:
        var id_token = googleUser.getAuthResponse().id_token;
        console.log("ID Token: " + id_token);
      }
	
</script>
</head>
<body>

	<div align="center">
		<h2>Coders 에 오신것을 환영합니다 !</h2>
		
		<form method="post" action="">
		<table>
			<tr>
				<td>
					<!-- kakao 로그인 버튼 노출 영역 -->
					<a href="javascript:kakaoLogin();">
						<img src="./upload/kakao_login_medium_narrow.png">
					</a>
					<!-- kakao 로그인 버튼 노출 영역 -->
				</td>
				
				
				
				
				<td>
					<!-- naver 로그인 버튼 노출 영역 -->
					<div id="naverIdLogin"></div>
					<!-- naver 로그인 버튼 노출 영역 -->

					<!-- naver 로그인 -->
					<script type="text/javascript">
						var naverLogin = new naver.LoginWithNaverId(
							{
								clientId: "QUJaCNWazN945TqXtLvx",
								callbackUrl: "http://localhost:8282/SemiProject/callback.jsp",
								isPopup: false, /* 팝업을 통한 연동처리 여부 */
								loginButton: {color: "green", type: 3, height: 60} /* 로그인 버튼의 타입을 지정 */
							}
						);
	
						/* 설정정보를 초기화하고 연동을 준비 */
						naverLogin.init();
					</script>
					<!-- naver 로그인 end -->
				</td>
				
				
				
				
				<td>
					<!-- google 로그인 버튼 노출 영역 -->
					<div class="g-signin2" data-onsuccess="googleLogin"></div>
					<!-- google 로그인 버튼 노출 영역 -->
				</td>
			</tr>
			
			<tr>
				<th>Kakao 로그인</th>
				<th>Naver 로그인</th>
				<th>Google 로그인</th>
			</tr>
		</table>
		</form>
	</div>

</body>
</html>