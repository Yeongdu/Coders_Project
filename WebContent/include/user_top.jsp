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
    	text-shadow: -1px 0 white, 0 1px white, 1px 0 white, 0 -1px white;
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
		width: 11%;
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
	
	.hidden {
		display:none;
	}
	
	<%-- hiddenMenu의 css --%>
	.menu-trigger {
	  margin-right: 70px;
	  margin-bottom: 50px;
	}
	
	.menu-trigger, 
	.menu-trigger span {
	  display: inline-block;
	  transition: all .4s;
	  box-sizing: border-box;
	}
	
	.menu-trigger {
	  position: relative;
	  width: 30px;
	  height: 22px;
	}
	
	.menu-trigger span {
	  position: absolute;
	  left: 0;
	  width: 100%;
	  height: 4px;
	  background-color: black;
	  border-radius: 4px;
	}
	
	.menu-trigger span:nth-of-type(1) {
	  top: 0;
	}
	
	.menu-trigger span:nth-of-type(2) {
	  top: 20px;
	}
	
	.menu-trigger span:nth-of-type(3) {
	  bottom: 0;
	}
	
	.menu-trigger.active-2 span:nth-of-type(1) {
	  -webkit-transform : translateY(20px) rotate(-315deg);
	  transform : translateY(20px) rotate(-315deg);
	}
	.menu-trigger.active-2 span:nth-of-type(2) {
	  opacity : 0;
	}
	.menu-trigger.active-2 span:nth-of-type(3) {
	  -webkit-transform : translateY(-20px) rotate(315deg);
	  transform : translateY(-20px) rotate(315deg);
	}
	
</style>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
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
					<img src="<%=request.getContextPath() %>/upload/logo.png">
					<span style = "font-size:16px;">CODEBOARD</span>
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
		
		<div class = "hiddenMenu">
			<a class="menu-trigger" href="#">
			  <span></span>
			  <span></span>
			  <span></span>
			</a>
		</div>
	</header>
	
	
	<%-- 창 크기가 일정크기가 되면 nav바 숨기고 햄버거 nav바가 나타나는 이벤트 --%>
	<script>
		$(document).ready(function(){
			$(window).on('resize',function (){
			  var width_size = window.innerWidth;
			  
			  if (width_size <= 1100) {
			    $(".top").css('display','none');
			    $(".hiddenMenu").css('display', 'block');
			    
			  }else {
				$(".top").css('display','block');
			    $(".hiddenMenu").css('display', 'none');
			  }
			});
		});
		
		
		<%-- 햄버거 메뉴 이벤트 --%>
		var burger = $('.menu-trigger');

		burger.each(function(index){
		  var $this = $(this);
		  
		  $this.on('click', function(e){
		    e.preventDefault();
		    $(this).toggleClass('active-' + (index+1));
		  })
		});
	
	</script>
