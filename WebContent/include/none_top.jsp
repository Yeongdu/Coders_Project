<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		margin-right: 70px;
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
</style>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
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
			<ul>
				<li>
					<span style="color: #2b59c6;">|&nbsp;</span>
				</li>
				
				<li>
					<a class="top" style="text-decoration: none; display: block;" href="<%=request.getContextPath() %>/user_login.do">로그인</a>
				</li>
				
				<li>
					<span style="color: #2b59c6;">|&nbsp;</span>
				</li>
			</ul>
		</div>
	</header> 
</body>
</html>