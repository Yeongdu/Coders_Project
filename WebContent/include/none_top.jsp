<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-lg bg-primary">
			<div class="container-fluid text-white">
				<a class="navbar-brand" href="main.jsp" style="color: light">Coders</a>
					<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
				<div class="collapse navbar-collapse" id="navbarNavDropdown">
					<ul class="navbar-nav">
						<li class="nav-item">
							<a class="nav-link" href="<%=request.getContextPath() %>/qna_list.do">Q&A</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="<%=request.getContextPath() %>/studyBoard_list.do">Study</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="<%=request.getContextPath() %>/user_login.do">로그인</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
</body>
</html>