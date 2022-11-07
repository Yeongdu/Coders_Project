<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	#header{
		width: 100%;
		height : 200px;
		background-image: url('./upload/header.png');
		background-size: cover; 
		background-repeat: no-repeat;
		background-position: center;
	}
	
	.top {
		color: #2b59c6;
		font-size: 1.05rem;
    	font-weight: bold;
	}
	
	img {
		width: 3rem;
		height: 3rem;
	}
	
	.logo {
		display: table;
		align-items: center;
		text-align: left;
		width: 100%;
		height: 40%;
		margin-left: 20px;
	}
	
	.logo_content {
		display: table-cell;
		vertical-align: middle;
		height: 50px;
	}
	
	.logo_content > a {
		width: 15.5%;
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
	
	ul > li {
		display: block;
		float: left;
		margin-right: 10px;
	}
	
	nav-link {
		color: #2b59c6;
		font-size: 1.05rem;
    	font-weight: bold;
	}
	
	.navbar-nav .dropdown-menu li{
	    width: 100%;
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
	<header id="header">
		<div class="logo">
			<div class="logo_content">
				<a class="top" style="text-decoration: none; display: block;" href="main.jsp">
					<img src="<%=request.getContextPath() %>/upload/logo.png">&nbsp;CODE BOARD
				</a>
			</div>
		</div>
		
		<div class="view_left">
			<ul>
				<li>
					<span style="color: #2b59c6;">|&nbsp;</span>
				</li>
				
				<li>
					<a class="top" style="text-decoration: none; display: block;" href="<%=request.getContextPath() %>/qna_list.do">Q&A&nbsp;</a>
				</li>
				
				<li>
					<span style="color: #2b59c6;">|&nbsp;</span>
				</li>
				
				<li>
					<a class="top" style="text-decoration: none; display: block;" href="<%=request.getContextPath() %>/studyBoard_list.do">Study</a>
				</li>
				
				<li>
					<span style="color: #2b59c6;">|&nbsp;</span>
				</li>
			</ul>
		</div>
		
		<div class="view_right">
			<nav class="navbar navbar-expand-lg">
				<div class="container-fluid text-white">
					<div class="collapse navbar-collapse" id="navbarNavDropdown">
						<ul class="navbar-nav">
							<li class="nav-item dropdown">
								<a class="top" style="text-decoration: none; display: block;" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
									${userId }▾
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
		</div>
	</header>
