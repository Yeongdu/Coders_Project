<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="euc-kr">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>NaverLoginSDK</title>
<script>
  	/* var naver_id_login = new naver_id_login("QUJaCNWazN945TqXtLvx", "http://localhost:8282/SemiProject/callback.jsp");
  	// 접근 토큰 값 출력
  	let tokken = naver_id_login.oauthParams.access_token;
  	// 네이버 사용자 프로필 조회
  	naver_id_login.get_naver_userprofile("naverSignInCallback()");
  	// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  	
  	function naverSignInCallback() {
  	 let id = naver_id_login.getProfileData('email');
   	 let nickname = naver_id_login.getProfileData('nickname');
   	 
   	 let url = "http://" + window.location.hostname + ( (location.port ==""||location.port==undefined)?"":":" + location.port) + "최종 로그인 url";
  	
  	 post_to_url( url, {'id' : id, 'nickname' : nickname, 'token' : token})
  	} */
  	
</script>
</head>
<body>

	<!-- (1) LoginWithNaverId Javscript SDK -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>


	<!-- (2) LoginWithNaverId Javscript 설정 정보 및 초기화 -->
	<script>
		var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "{QUJaCNWazN945TqXtLvx}",
				callbackUrl: "{http://localhost:8282/SemiProject/callback.jsp}",
				isPopup: false,
				callbackHandle: true
				/* callback 페이지가 분리되었을 경우에 callback 페이지에서는 callback처리를 해줄수 있도록 설정합니다. */
			}
		);

		/* (3) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */
		naverLogin.init();

		/* (4) Callback의 처리. 정상적으로 Callback 처리가 완료될 경우 main page로 redirect(또는 Popup close) */
		window.addEventListener('load', function () {
			naverLogin.getLoginStatus(function (status) {
				if (status) {
					/* (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */
					var id = naverLogin.user.getEmail();
					var nickname = naverLogin.user.getNickName();
					if( id == undefined || id == null) {
						alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
						/* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
						naverLogin.reprompt();
						return;
					}else if( nickname == undefined || nickname == null) {
						alert("닉네임은 필수정보입니다. 정보제공을 동의해주세요.");
						/* (5-2) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
						naverLogin.reprompt();
						return;
					}

					window.location.replace("http://" + window.location.hostname + ( (location.port==""||location.port==undefined)?"":":" + location.port) + "/SemiProject/social_login_ok.do?id="+id+"&nickname="+nickname+"&token=naver");
				} else {
					console.log("callback 처리에 실패하였습니다.");
				}
			});
		});

	</script>
	 <!-- // url로 넘기면서 정보도 같이 담아서 갖고가기
	function post_to_url(path, params, method='post'){
			// body 에 form 태그 추가
			const form = document.createElement('form');
			form.method = method;
			form.action = pate;
			
			// 정보 hidden으로 form태그 안에 추가하기
			for(const key in params){
				if(params.hasOwnProperty(key)){
					const hiddenField = document.createElement('input');
					hiddenField.type = 'hidden';
					hiddenField.name = key;
					hiddenField.value = param[key];
					form.appendChild(hiddenField);
				}
			}
			// form태그 닫기
			document.body.appendChild(from);
			
			// submit으로 전송
			form.submit();
	} -->
</body>
</html>