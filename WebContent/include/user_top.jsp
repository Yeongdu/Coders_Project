<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<body onresize="parent.resizeTo(800,600)" onload="parent.resizeTo(800,600)">
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#top {
		color: white;
		font-size: 1.05rem;
    	font-weight: bold;
    	text-shadow: -1px 0 #2b59c6, 0 1px #2b59c6, 1px 0 #2b59c6, 0 -1px #2b59c6;
	}
	
/* 	img {
		width: 3rem;
		height: 3rem;
	} */
	
	#logo {
		color: #2b59c6;
		font-weight: bold;
		font-size: 1.4rem;
	}
	
	.view_left{
		margin-top: 35px;
		height: 50px;
		float: left;
	}
	
	.view_right{
		margin-top: 35px;
		height: 50px;
		float: right;
	}
	
	ul {
		list-style-type:none;
		margin-left: 20px;
	}
	
	#include > li {
		display: block;
		float: left;
		margin-right: 10px;
		width: 100%;
	}
	
	nav-link {
		color: #2b59c6;
		font-size: 1.05rem;
    	font-weight: bold;
	}
	
	
</style>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script src = "https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script type="text/javascript">
	Kakao.init('8fa233a3b298fd44817a61f49898727e');
	console.log( Kakao.isInitialized() );
	
	//카카오로그아웃  
	function kakaoLogout() {
		
	    if (Kakao.Auth.getAccessToken()) {
	      Kakao.API.request({
	        url: '/v1/user/unlink',
	        success: function (response) {
	        	console.log(response)
	        	location.href="<%=request.getContextPath()%>/user_logout_ok.do";
	        },
	        fail: function (error) {
	          console.log(error)
	        },
	      })
	      Kakao.Auth.setAccessToken(undefined)
	    }
	  }
	
	function userLogout() {
		location.href="<%=request.getContextPath()%>/user_logout_ok.do";			
			
		}
	
</script>

</head>
<body>
	<nav class="navbar navbar-expand-lg bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" id="logo" style="text-decoration: none; display: block;" href="main.jsp">
				<img src="<%=request.getContextPath() %>/upload/logo.png">&nbsp;CODE BOARD&nbsp;&nbsp;
			</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0" id="include">
					<li class="nav-item">
						<a class="nav-link" id="top" href="<%=request.getContextPath() %>/qna_list.do">Q&A</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" id="top" href="<%=request.getContextPath() %>/studyBoard_list.do">STUDY</a>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" id="top" href="#" role="button" data-bs-toggle="dropdown">
							PROFILE ▾
						</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="<%=request.getContextPath()%>/profile.do">프로필 보기</a></li>
								<c:if test="${token == 'kakao' }">
									<li><a class="dropdown-item" href="javascript:kakaoLogout();">로그아웃</a></li>
								</c:if>
								<c:if test="${token == 'user' }">
									<li><a class="dropdown-item" href="javascript:userLogout();">로그아웃</a></li>
								</c:if>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	
	<div id = "logoTitle" class="top">
		<img src="<%=request.getContextPath() %>/upload/header.png" style = "width:100%; height:200px;"></a>
	</div>

