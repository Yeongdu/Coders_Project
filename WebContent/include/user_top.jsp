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
	.top {
		color: #2b59c6;
		font-size: 1.05rem;
    	font-weight: bold;
    	text-shadow: -1px 0 white, 0 1px white, 1px 0 white, 0 -1px white;
	}
	
/* 	img {
		width: 3rem;
		height: 3rem;
	} */
	
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
	
	.menu-trigger {
	  margin-right: 10px;
	  margin-bottom: 10px;
	  float: right;
	  top: -50px;
	  right: -30px;
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
	  top: 15px;
	}
	
	.menu-trigger span:nth-of-type(3) {
	  bottom: -10px;
	}
	
	.menu-trigger.active-2 span:nth-of-type(1) {
	  -webkit-transform : translateY(20px) rotate(-315deg);
	  transform : translateY(15px) rotate(-315deg);
	}
	.menu-trigger.active-2 span:nth-of-type(2) {
	  opacity : 0;
	}
	.menu-trigger.active-2 span:nth-of-type(3) {
	  -webkit-transform : translateY(-20px) rotate(315deg);
	  transform : translateY(-13px) rotate(315deg);
	}
	
	/* 햄버거 메뉴 버튼 클릭시 나오는 내비바 css*/
	.ham-con{
  width: 30%;
  height: 1000px;
  background-color: rgba(224, 224, 224, 0.8);
  position: fixed;
  top:70px;
  right:-20%;
  color:#505050;
  z-index: 99;
  opacity: 0;
}

.search-con{
  width: 100%;
  height: 50px;
  position: relative;
  top: 50px;
  margin-bottom: 80px;
  overflow: hidden;
}

.search-con input{
  width: 70%;
  height: 100%;
  float: left;
  line-height: 50px;
  border:1px solid black;
}

.ham-menu ul {
  width: 100%;
  margin: 0;
  padding: 0;
}

.ham-menu ul.ham-top-menu li {
  position: relative;
  float: left;
  width: 100%;
  list-style-type: none;
  font-size: 18px;
}

.ham-menu ul.ham-top-menu li a {
  display: block;
  width: 100%;
  height: 100%;
  line-height: 50px;
  text-indent: 20px;
  color: #000;
  background-color: #fff;
  text-decoration: none;
}

.ham-menu ul.ham-top-menu li a:hover {
  background: #eee;
}

.ham-menu ul.ham-top-menu li .ham-sub-menu a {
  position: relative;
  float: left;
  display: block;
  width: 100%;
  z-index: 99;
  background: #F7F7F7;
}

.ham-menu ul.ham-top-menu li .ham-sub-menu a:hover {
  background: #444;
  color: #fff;
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
		<nav class="navbar navbar-expand-lg bg-light">
	  <div class="container-fluid">
	    <a class="navbar-brand" href="#">
	   	<img src="<%=request.getContextPath() %>/upload/logo.png" style = "width:3rem; height:3rem;">
	   	</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
	      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
	        <li class="nav-item">
	          <a class="nav-link active" aria-current="page" href="#">Home</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="#">Link</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link disabled">Disabled</a>
	        </li>
	      </ul>
	      <form class="d-flex" role="search">
	        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
	        <button class="btn btn-outline-success" type="submit">Search</button>
	      </form>
	    </div>
	  </div>
	</nav>
	
	<div id = "logoTitle" class="top">
		<img src="<%=request.getContextPath() %>/upload/header.png" style = "width:100%; height:200px;"></a>
	</div>


	<%-- <header id="header">
		<div class="logo">
			
				<nav class="navbar navbar-expand-lg" style = "float:right; margin-right:20px;">
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
				<div class="logo_content">
			<ul>
				<li style = "list-style: none; display: inline-block;">
					<a id = "logoTitle" class="top" style="text-decoration: none; display: block;  margin-right: 40px;" href="main.jsp">
						<img src="<%=request.getContextPath() %>/upload/logo.png">
						<span style = "font-size:16px;" class = "logo1">CODE</span>
						<span style = "font-size:16px;" class = "logo2">BOARD</span>
					</a>
				</li>
				<li><a class="top" style="text-decoration: none; display: block; margin-top:5px;" href="<%=request.getContextPath() %>/qna_list.do">Q&A&nbsp;</a></li>
				<li><a class="top" style="text-decoration: none; display: block; margin-top:5px;" href="<%=request.getContextPath() %>/studyBoard_list.do">Study</a></li>
			</ul>
			</div>
		</div>
		
		<div class="view_left">
			<ul>
				<li>
					<span style="color: #2b59c6;" class = "nonespan">|&nbsp;</span>
				</li>
				
				<li>
					
				</li>
				
				<li>
					<span style="color: #2b59c6;" class = "nonespan">|&nbsp;</span>
				</li>
				
				<li>
					
				</li>
				
				<li>
					<span style="color: #2b59c6;" class = "nonespan">|&nbsp;</span>
				</li>
			</ul>
		</div>
		
		<div class="view_right">
			
		</div>
		</header> --%>
