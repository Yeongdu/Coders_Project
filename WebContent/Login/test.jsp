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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.js"></script>
</head>
<body>
	<div id="qnacontent">
		<button class="btn btn-primary" id="qnaopenlist" type="button" >더 보기</button>
	</div>

</body>
<script type="text/javascript">

$(function(){
	
	var id = "qjqtkwns1@naver.com";
	
	
	
	$("#qnaopenlist").off("click").on("click", function(){
		
		console.log("오픈 클릭");
		
		let table = "";
				
		$("#qnacontent").empty();
			
		table += "<button class='btn btn-primary' id='qnacloselist' type='button' >닫 기</button>"
				
		$("#qnacontent").append(table);
				
	});
	
	
	$("#qnacloselist").off("click").on("click", function(){
		
		console.log("클로즈 클릭");
		
	});
});

</script>
</html>