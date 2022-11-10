<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
	
		#top:hover{
		color: #2b59c6;
		transform: scale(1.25);
		transiton-duration: 0.5s;
		text-shadow: none;
		font-weight: bold;
	}
	
	#img{
		position: absolute;
	}
	
	#text{
		position: relative;
		cursor: pointer;
	}
	
</style>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" id="logo" style="text-decoration: none; display: block;" href="main.jsp">
				<img src="<%=request.getContextPath() %>/upload/logo.png">&nbsp;CODE BOARD
			</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item">
						<a class="nav-link" id="top" href="<%=request.getContextPath() %>/qna_list.do">Q&A</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" id="top" href="<%=request.getContextPath() %>/studyBoard_list.do">STUDY</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" id="top" href="<%=request.getContextPath() %>/user_login.do">LOGIN</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	
	<div id = "logoTitle" class="top">
		<img src="<%=request.getContextPath() %>/upload/headerimg.png" style = "width:100%; height:200px;" id = "img">
		<img src="<%=request.getContextPath() %>/upload/headertext.png" style = "width:100%; height:200px;" id = "text"
				onclick= "location.href='main.jsp'">
	</div>
