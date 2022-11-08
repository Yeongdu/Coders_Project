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

@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap')
	;

	body {
		font-family: 'Noto Sans KR' !important;
		cursor: url('./qna_icon/cusor.png'),auto;
	}
	
	html, body {
		width: 100%;
		height: 100vh;
	}

	a {
	text-decoration: none;
	}
	
	#container {
	  display: flex;
	  width: 38em;
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
	  flex-grow: 4;
	}
	.qna_view_right {
	  flex: 1;
	  text-align: right;
	  flex-grow: 3;
	}
	
	.qna_view_center{
		margin: auto;
	}
	
	#qna_center {
		clear: both;
		display: block;
	}
	
	#qna_view_writer { 
		color : skyblue;
		font-size: 14px;
		margin-bottom: 5px;
	}
	
	#qna_view_date {
		color: gray;
		font-size: 13px;
		margin-bottom: 0;
	}
	
	#studyListContainer {
		display: flex;
		width: 40em;
		padding-bottom: 10px;
		margin: auto;
		align-items: center;
	}
	
	.study_view_left {
		flex: 1;
		text-align-last: left;
		flex-grow: 1;
		padding-left: 15px;
	}
	
	.study_view_center {
		flex: 3;
		flex-grow: 7;
		text-align: left;
		font-size: 1em;
		align-items: center;
	}
	
	.study_view_right {
		flex: 1;
		text-align: right;
		flex-grow: 2;
		display: flex;
		align-items: center;
		justify-content: flex-end;
	}
	
	
	#studyListContainer_top:hover {
		background-color: #f7f7f7;
	}
	
	button.btn.btn-outline-dark {
		border-color: #ffffff00;
		width: 70px;
		padding-right: 20px;
		font-weight: bold;
	}
	
	.studyEndTxt {
		font-weight: bold;
		border-bottom: 7px solid #e8e8e8;
		padding: 0.2em 0 0 0.2em;
		color: gray;
	}
	
	.studyIngTxt {
		border-bottom: 7px solid #dcf1fb;
		padding: 0.2em 0 0 0.2em;
		font-weight: bold;
	}
	
	.btn.btn-outline-secondary {
		width: 86px;
		padding-left: 5px;
		padding-right: 5px;
		
	}
	
	.btn.btn-primary {
		width: 86px;
		padding-left: 5px;
		padding-right: 5px;
		background-color: DarkCyan;
		padding-bottom: 7px;
		border: 0px;
	}
	
	#StudylistBtn {
		border-color: #dc3545;
		font-weight: bold;
		border-bottom: 7px solid #DC3545;
		padding: 0.2em 0 0 0.2em;
		color: #DC3545;
	}
	
	.study_view_aTag {
		width: 460px;
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
		text-decoration: none;
		line-height: 48px;
		color: gray;
	}
	
	#main{
		width : 68%;
		display: flex;
		margin: auto;
		flex-grow: 3;
	}
	
	h1 {
		width : 50%;
		display: inline-block;
	}
	
	
</style>
<script type="text/javascript">

/* 
	$('left').click(function(){
		$('left').reoveClass('active')
		$(this).addClass('active')
	}) */

	
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
					
					let writer = $(this).find("writer").text();
					
					let text = writer.split('@');
					
					table += "<div id='container' class='border-top' class='border-bottom'>"
					table += "<div class='qna_view_left'>"
					table += "<div><i class='fa-regular fa-eye'></i> &nbsp;"+$(this).find("hit").text()+"</div>"
					table += "<div><i class='fa-regular fa-pen-to-square'></i> &nbsp;"+$(this).find("reply").text()+"</div></div>"
					
					table += "<div class='qna_view_center'>"
					table += "<a href='<%=request.getContextPath()%>/qna_content.do?no="+$(this).find("num").text()+"' style='text-decoration: none; display: block;' class='etc'>"
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
					table += "<div id = 'qna_view_writer'>"
					table += "<i class='fa-regular fa-user'></i>&nbsp;"+text[0]+"</div>"
					table += "<div id ='qna_view_date'>"
					if($(this).find("update").text() == 'null'){
						table += "<i class='fa-regular fa-clock'></i>&nbsp;"+$(this).find("date").text()+"</div></div></div>"
					}else {
						table += "<i class='fa-regular fa-clock'></i>&nbsp;"+$(this).find("update").text()+"</div></div></div>"
					}
					
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
					let today = new Date().getTime();
					let today_n = Math.floor(today / (1000*60*60*24));
					
					let endDate = new Date($(this).find("date").text()).getTime();
					let endDate_n = Math.floor(endDate / (1000*60*60*24));
					
					let day = endDate_n - today_n + 1;
					
					table += "<div id='studyListContainer_top' class='border-bottom' align='center' style='width: 38em; height: 7em;'><br>"
					table += "<div class='study_view_top' align='left' style='margin-left: 5px; color: gray; font-size: 0.7em;'><div>"
					table += "<i class='fa-regular fa-user'></i> &nbsp;"+$(this).find("writer").text()
					table += "&nbsp;&nbsp; <i class='fa-regular fa-eye'></i>&nbsp;"+$(this).find("hit").text()
					table += "&nbsp;&nbsp; <i calss='fa-regular fa-pen-to-square'></i>&nbsp;"+$(this).find("reply").text()+"</div></div>"
						
					table += "<div id='studyListContainer'>"
					table += "<div class='study_view_center'>"
					table += "<a class='study_view_aTag' href='<%=request.getContextPath()%>/studyBoard_content.do?no="+$(this).find("num").text()+"' style='display: block;'>"
					if($(this).find("type").text() == "모집중"){
						table += "<button type='button' class='btn btn-primary'>"+$(this).find("type").text() +"</button>"	
					}else if($(this).find("type").text() == "모집완료"){
						table += "<button type='button' class='btn btn-outline-secondary' disabled>"+$(this).find("type").text() +"</button>"
					}
					if($(this).find("type").text() == "모집중"){
						table += "&nbsp;<sapn style='font-size: 1.2em; color: black;'>"+$(this).find("title").text()+"</span></a></div>"	
					}else if($(this).find("type").text() == "모집완료"){
						table += "&nbsp;<sapn style='font-size: 1.2em; color: gray;'>"+$(this).find("title").text()+"</span></a></div>"
					}
					table += "<div class='study_view_right'>"
					if($(this).find("date").text() == 'null'){
						table += "<span></span>"
					}else {
						if(day > 0){
							if($(this).find("type").text() == "모집완료"){
								table += "<span class='studyEndTxt'>마 감</span>"
							}else if($(this).find("type").text() == "모집중"){
								table += "<span class='studyIngTxt'>D - "+day+"</span>"
							}
								
						}else if(day == 0){
							if($(this).find("type").text() == "모집완료"){
								table += "<span class='studyEndTxt'>마 감</span>"
							}else if($(this).find("type").text() == "모집중"){
								table += "<span class='studyTodayEnd' id='StudylistBtn'>D - DAY</span>"
							}
								
						}else if(day < 0){
							table += "<span class='studyEndTxt'>마 감</span>"
						}
					}
					table += "<button type='button' class='btn btn-outline-dark' disabled>"
					table += "<i class='fa-solid fa-person'></i> "+ $(this).find("people").text() +"</button></div></div></div>"
						
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
		margin-top: 0px;
		margin-bottom: 20px;
	} 
	
 	#qna_head{
		margin-top: 20px;
		margin-bottom: 20px;
	}
	
	#study_head{
		margin-top: 20px;
		margin-bottom: 20px;
	}
	
	#banner{
		display: flex; 
	    flex-grow : 2.5;
	    left : 16%;
	    width: 68%;
		margin-bottom: 40px;
		position: relative;
		justify-content: center;
		background-size: cover; 
		background-repeat: no-repeat;
		background-position: center;
			
	}
	
	
	  .carousel-inner{
        width:auto;
        height:300px; /* 이미지 높이 변경 */
      }
      .carousel-item{
        width: auto;
        height:100%;
      }
      .d-block {
        display:block;
        width: auto;
        height: 100%;
      }
	
	#blank{
		display : inline-block;
		width: 5em;
	}

	
	.inner{
    	display: flex;
    	h4{}
	}	
	
	
	.name {
		border: 2px solid #2b59c6;
		background-color: #2b59c6;
		border-radius: 15px;
		font-weight: bold;
		width: 400px;
		height : 40px;
		color: white;
    	padding-bottom: 5px;
 		box-shadow: 3px 3px 2px -1px rgba(0,0,0,0.48);
		-webkit-box-shadow: 3px 3px 2px -1px rgba(0,0,0,0.48);
		-moz-box-shadow: 3px 3px 2px -1px rgba(0,0,0,0.48); 
		font-weight: bold;
	}
	
	#QnAGo:hover{
		background-color :white;
		border-radius: 15px;
		color : #2b59c6;
		border: 2px solid white;
	 	box-shadow: 3px 3px 2px -1px rgba(0,0,0,0.48);
		-webkit-box-shadow: 3px 3px 2px -1px rgba(0,0,0,0.48);
		-moz-box-shadow: 3px 3px 2px -1px rgba(0,0,0,0.48);
		cursor: pointer;
	}
	
	#studyGo:hover{
		background-color :white;
		color : #2b59c6; 
		border: white;
		cursor: pointer;
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
	
	<!-- <div id = "left" align="left"></div> -->
	
	<div id = "banner" align = "center">
	
	<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
		  <div class="carousel-indicators">
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
		  </div>
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <img src="./upload/mainbanner1.png" class="d-block w-100" alt="...">
		    </div>
		    <div class="carousel-item">
		      <img src="./upload/mainbanner2.png" class="d-block w-100" alt="...">
		    </div>
		    <div class="carousel-item">
		      <img src="./upload/mainbanner3.png" class="d-block w-100" alt="...">
		    </div>
		  </div>
		  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Next</span>
		  </button>
		</div>

	</div>
	
	
	
	<div align="center" id ="main">
		
		    <div class="inner">
            <div class="QnA" onclick= "location.href='qna_list.do'">
                <div class="name" id = "QnAGo"> <h3><b>⦁  &nbsp; &nbsp;Q&A &nbsp; &nbsp; ⦁</b></h3></div>
                <div class="box">
                	<br>
                    <div id ="qna_center"></div>
                </div>
            </div>
            
            <div id ="blank"> </div>
            
            <div class="STUDY" onclick= "location.href='studyBoard_list.do'">
                <div class="name" id = "studyGo"><h3><b>⦁  &nbsp;STUDY&nbsp;  ⦁</b></h3></div>
                <div class="box">
                	<br>
                    <div id ="study_center"></div>
                </div>
            </div>
        </div>
		
		
			
		<!-- <div id="study_head">
			<h3>Study Board</h3>
		</div> -->
		
	</div>

	<!-- <div id = "right" align="right"></div> -->
	
	<jsp:include page="./include/bottom.jsp" />
	
</body>
</html>
