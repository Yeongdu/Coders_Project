<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script src="https://kit.fontawesome.com/c85ddd0cc6.js" crossorigin="anonymous"></script>
<style type="text/css">
	body {
	font-family: 'Noto Sans KR' !important;
	}

	a {
	text-decoration: none;
	}
	
	#container {
	  display: flex;
	  width: 50em;
	  padding-top: 10px;
	  padding-bottom: 10px;
	  margin: auto;
	}
	.qna_view_left {
	  flex: 1;
	  text-align-last: left;
	  flex-grow: 1;
	}
	
	.qna_view_center {
	  align-items: center;
	  flex: 3;
	  text-align: left;
	  font-size: 1.2em;
	  flex-grow: 5;
	}
	.qna_view_right {
	  flex: 1;
	  text-align: right;
	  flex-grow: 2;
	}
	
	.qna_view_center{
		margin: auto;
	}
	
	#qna_center {
		clear: both;
	}
	
	.study_view_aTag{
	  text-decoration: none;
	  line-height: 48px;
	  color: gray;
	}
	
	#studyListContainer {
	  display: flex;
	  width: 50em;
	  padding-top: 10px;
	  padding-bottom: 10px;
	  margin: auto;
	}
	.study_view_left {
	  flex: 1;
	  text-align-last: left;
	  flex-grow: 1;
	}
	
	.study_view_center {
	  align-items: center;
	  flex: 3;
	  text-align: left;
	  font-size: 1.2em;
	  flex-grow: 5;
	}
	.study_view_right {
	  flex: 1;
	  text-align: right;
	  flex-grow: 2;
	}
	
	.study_view_center {
		margin: auto;
	}
	
	#study_center {
		clear: both;
	}
	
	.btn.btn-outline-primary{
		height: 37px;
		padding-top: 0px;
		padding-bottom: 0px;
	}
	
</style>
<script type="text/javascript">
	
	$(function(){
		$.ajaxSetup({
			ContentType : "application/x-www-form-urlencoded;charset=UTF-8",
			type : "post"
		});
		
		$.ajax({
			type : "post",
			async: false,
			url : "mainqna.jsp",
			datatype : "xml",
			success : function(data){
				
				let table = "";
				
				$(data).find("main").each(function(){
					table += "<div id='container' class='border-top' class='border-bottom'>"
					table += "<div class='qna_view_left'>"
					table += "<div><i class='fa-regular fa-eye'></i> &nbsp;"+$(this).find("hit").text()+"</div>"
					table += "<div><i class='fa-regular fa-pen-to-square'></i> &nbsp;"+$(this).find("reply").text()+"</div></div>"
					
					table += "<div class='qna_view_center'>"
					table += "<a href='<%=request.getContextPath()%>/qna_content.do?no="+$(this).find("num").text()+"' display='block;' style='text-decoration: none;'>"
					if($(this).find("tag").text() == "HTML"){
						table += "<span class='badge text-bg-primary'>HTML</span>"
					}else if($(this).find("tag").text() == "JAVASCRIPT"){
						table += "<span class='badge text-bg-warning'>JAVASCRIPT</span>"
					}else if($(this).find("tag").text() == "CSS"){
						table += "<span class='badge text-bg-danger'>CSS</span>"
					}else if($(this).find("tag").text() == "JQUERY"){
						table += "<span class='badge text-bg-success'>JQUERY</span>"
					}else if($(this).find("tag").text() == "DATEBASE"){
						table += "<span class='badge text-bg-info'>DATABASE</span>"
					}else if($(this).find("tag").text() == "JSP"){
						table += "<span class='badge text-bg-dark'>JSP</span>"
					}else if($(this).find("tag").text() == "ETC"){
						table += "<span class='badge text-bg-light'>ETC</span>"
					}else if($(this).find("tag").text() == "JAVA"){
						table += "<span class='badge text-bg-secondary'>JAVA</span>"
					}
					table += "&nbsp;&nbsp;&nbsp;" + $(this).find("title").text() + "</a></div>"
					
					table += "<div class='qna_view_right'>"
					table += "<div>"+$(this).find("writer").text()+"</div>"
					table += "<div>"+$(this).find("date").text()+"</div></div></div>"
					
				});
				
				$("#qna_center").append(table);
			},
			
			error : function(data){
				alert("데이터 통신 오류입니다.");
			}
		});
		
		$.ajax({
			type : "post",
			async: false,
			url : "mainstudy.jsp",
			datatype : "xml",
			success : function(data){
				
				let table = "";
				
				$(data).find("main").each(function(){
					table += "<div id='studyListContainer' class='border-top' class='border-bottom'>"
					table += "<div class='study_view_left'>"
					table += "<div><i class='fa-regular fa-eye'></i> &nbsp;"+$(this).find("hit").text()+"</div>"
					table += "<div><i class='fa-regular fa-pen-to-square'></i> &nbsp;"+$(this).find("reply").text()+"</div></div>"
					table += "<div class='study_view_center'>"
					table += "<a href='<%=request.getContextPath()%>/studyBoard_content.do?no="+$(this).find("num").text()+"' display='block;' style='text-decoration: none;'>"
					if($(this).find("type").text() == "모집중"){
						table += "<button class='btn btn-outline-primary' style='background-color: #3468b7; bs-btn-color:white; color:white; border-color:#3468b7;' disabled>"+$(this).find("type").text() +"</button>"	
					}else if($(this).find("type").text() == "모집완료"){
						table += "<button class='btn btn-outline-primary' disabled>"+$(this).find("type").text() +"</button>"
					}
					table += "&nbsp;"+$(this).find("title").text()+"</a></div>"
					table += "<div class='study_title_right'>"
					table += "<div class='studyViewWriter'>"+$(this).find("writer").text()+"</div>"
					table += "<div class='studyViewData'>"+$(this).find("date").text()+"</div></div></div>"
					
				});				
				$("#study_center").append(table);
			},
			
			error : function(data){
				alert("데이터 통신 오류입니다.");
			}
		});
	});
</script>
<style type="text/css">
	#main{
		margin-top: 3rem;
		margin-bottom: 3rem;
	}
	
	#qna_head{
		margin-top: 6rem;
		margin-bottom: 6rem;
	}
	
	#study_head{
		margin-top: 6rem;
		margin-bottom: 6rem;
	}
</style>
</head>
<body>
	<c:if test="${empty userId }">
	<jsp:include page="./include/none_top.jsp" />
	</c:if>
	
	<c:if test="${!empty userId }">
	<jsp:include page="./include/user_top.jsp" />
	</c:if>
	
	<div align="center" id ="main">
		<div id="qna_head">
			<h1>Q&A Board</h1>
		</div>
		
		<div id ="qna_center">
		</div>
		
		<div id="study_head">
			<h1>Study Board</h1>
		</div>
		
		<div id ="study_center">
		</div>
	</div>
	
	
	
	
</body>
</html>

