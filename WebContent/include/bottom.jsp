<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<style type="text/css">
	
	footer {
		margin-top: 100px;
		background-color: rgb(13,110,253);
	}
	.footer-main {
		align-items: center;
		height: 8rem;
		width: 85.7142857143rem;
	    margin: 0 auto;
	    padding-left: 3.5714285714rem;
	    padding-right: 3.5714285714rem;
	    line-height: 13.3571428571rem;
	    display: flex;
	}
	
	.container-left {
		justify-content: center;
		align-items: center;
	}
	
	.container-left h4 {
		font-size: 1.5rem;
		line-height: 5rem;
		color: #90CAF9;
	}
	
	.container-center{
		margin-left: 650px;
		justify-content: center;
		align-items: center;
	}
	
	.container-center h6 {
		color: #90CAF9;
	}
	
	.container-left a {
		color: #90CAF9;
		text-decoration: none;
	}
	
	
</style>
</head>
<body>
	<footer>
		<div class="footer-main">
			<div class="container-left">
				<h4>
					<a href="<%=request.getContextPath() %>/main.jsp">Coders</a>
				</h4>
			</div>
			
			<div class="container-center">
				<h6>
					SemiProject 6조<br>
					조장 : 이현지 | 팀원 : 전영주 정영훈 김예지 최은지<br>
					주소 : 서울특별시 중구 남대문로 120 대일빌딩 2F, 3F
				</h6>
			</div>
		</div>
	</footer>

</body>
</html>