<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href = "css/qna_board_main.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script src="https://kit.fontawesome.com/c85ddd0cc6.js" crossorigin="anonymous"></script>
<script type="text/javascript">
	
	$(function(){
		$.ajaxSetup({
			ContentType : "application/x-www-form-urlencoded;charset=UTF-8",
			type : "post"
		});
		
		$.ajax({
			type : "post",
			url : "mainqna.jsp",
			datatype : "xml",
			success : function(data){
				
				let table = "";
				
				$(data).find("main").each(function(){
					table += "<div id='container' class='border-top' class='border-bottom'>"
					table += "<div class='qna_view_left'>"
					table += "<div><i class='fa-solid fa-eye'></i>"+$(this).find("hit").text()+"</div>"
					table += "<div><i class='fa-solid fa-pen-to-square'></i>"+$(this).find("reply").text()+"</div></div>"
					
					table += "<div class='qna_view_center'>"
					table += "<a href='<%=request.getContextPath()%>/qna_content.do?no="+$(this).find("num").text()+"' display='block;' style='text-decoration: none;'>"
					if($(this).find("tag").text() == "HTML"){
						table += "<span class='badge text-bg-primary'>HTML</span>"
					}else if($(this).find("tag").text() == "JAVASCRIPT"){
						table += "<span class='badge text-bg-warning'>JAVASCRIPT</span>"
					}else if($(this).find("tag").text() == "CSS"){
						table += "<span class='badge text-bg-danger'>CSS</span>"
					}else if($(this).find("tag").text() == "PYTHON"){
						table += "<span class='badge text-bg-secondary'>PYTHON</span>"
					}else if($(this).find("tag").text() == "JQUERY"){
						table += "<span class='badge text-bg-success'>JQUERY</span>"
					}else if($(this).find("tag").text() == "DATEBASE"){
						table += "<span class='badge text-bg-info'>DATABASE</span>"
					}else if($(this).find("tag").text() == "JSP"){
						table += "<span class='badge text-bg-dark'>JSP</span>"
					}else if($(this).find("tag").text() == "ETC"){
						table += "<span class='badge text-bg-dark'>ETC</span>"
					}else if($(this).find("tag").text() == "JAVA"){
						table += "<span class='badge text-bg-warning'>JAVA</span>"
					}
					table += "&nbsp;&nbsp;&nbsp;" + $(this).find("title").text() + "</a></div>"
					
					table += "<div class='qna_view_right'>"
					table += "<div>"+$(this).find("writer").text()+"</div>"
					table += "<div>"+$(this).find("date").text()+"</div></div></div>"
					
				});
				
				$("#main_center").append(table);
			},
			
			error : function(data){
				alert("데이터 통신 오류입니다.");
			}
		});
	});
</script>
</head>
<body>
	<c:if test="${empty userId }">
	<jsp:include page="./include/none_top.jsp" />
	</c:if>
	
	<c:if test="${!empty userId }">
	<jsp:include page="./include/user_top.jsp" />
	</c:if>
	
	<br>
	<br>
	<br>
	
	<div align="center" id ="main">
		<div id="head">
		<h1>Q&A Board</h1>
		</div>
		
		<br>
		<br>
		<br>
		
		<div id ="main_center">
		</div>
	</div>
	
	<br>
	<br>
	<br>
	
	<div class="studylist">
	
	</div>
	
	<jsp:include page="./include/bottom.jsp" />
</body>
</html>