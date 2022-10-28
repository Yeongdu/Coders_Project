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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script src="https://kit.fontawesome.com/c85ddd0cc6.js" crossorigin="anonymous"></script>
<style>

	* {
	box-sizing: inherit;
	}

	.main a {
	text-decoration: none;
	}
	body {
    min-width: 85.7142857143rem;
    width: 100%;
    margin: 0;
    background-color: #FBFBFC;
    color: #202A2F;
	}
	
	div {
	display: block;
	}
	
	.m-b-10 {
    margin-bottom: 0.7142857143rem !important;
    position: relative;
    width: 15.7142857143rem;
	}
	
	img {
    vertical-align: middle;
    border-style: none;
	}
	
	.users-show .info img {
    width: 15.7142857143rem;
    height: 15.7142857143rem;
    margin-right: 2.8571428571rem;
    margin-top: 0.4285714286rem;
    float: left;
}
		
	.users-show .content {
    padding-top: 1.7142857143rem;
	}
	
	.main>.content>.content-wrap {
    max-width: 85.7142857143rem;
    width: 85.7142857143rem;
    margin: 0 auto;
    padding-left: 3.5714285714rem;
    padding-right: 3.5714285714rem;
	}
	
	.users-show .content-wrap {
    z-index: 2;
    box-shadow: 4px 4px 8px -2px rgb(50 50 100 / 16%), 16px 16px 24px rgb(50 50 100 / 8%), 24px 24px 56px rgb(50 50 100 / 12%);
    background-color: white;
    padding-top: 3.1428571429rem;
    padding-bottom: 3.5714285714rem;
    min-height: 64.2857142857rem;
    min-width: 85.7142857143rem;
    border-radius: 0.2142857143rem;
	}

	.users-show .info {
    display: inline-block;
    width: 100%;
    margin-bottom: 2.8571428571rem;
    color: #90A4AE;
}
	
	.users-show .info {
    display: inline-block;
    width: 100%;
    margin-bottom: 2.8571428571rem;
    color: #90A4AE;
	}
	
	.users-show .info .name-edit .name {
    font-family: 'Roboto', 'Spoqa Han Sans', 'Helvetica Neue', Helvetica, verdana, Arial, sans-serif;
    margin-bottom: 0.7142857143rem;
    margin-left: 0.1428571429rem;
    color: #202A2F;
    letter-spacing: -1px;
    word-spacing: -1px;
    font-size: 4.2857142857rem;
    display: inline;
	}

	.users-show .info .detail-info {
    float: left;
    flex-direction: column;
    font-weight: 400;
    font-size: 0.9285714286rem;
    line-height: 1.4285714286rem;
    word-spacing: -0.0142857143rem;
    width: 60rem;
	}
	
	.users-show .info .name-edit a {
    position: absolute;
	}
	
	.users-show .nav-pills {
    flex: 2;
	}
	
	.nav-pills {
    font-weight: 400;
    font-size: 1.0714285714rem;
    line-height: 1.6428571429rem;
    margin-top: 1.7142857143rem;
    border-color: #E1E7EB;
    border-bottom: 1px solid #ddd;
	}
	
	.nav {
    padding-left: 0;
    margin-bottom: 0;
    list-style: none;
	}
	
	.tab-content>.active {
    display: block;
	}
	
	.qnatab {
	margin-top: 100px;
	margin-bottom: 100px;
	}
	
	.studytab {
	margin-top: 100px;
	margin-bottom: 100px;
	}
	
	#container {
	  display: flex;
	  width: 100%;
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
	
	
</style>
<script type="text/javascript">
	
	$(function(){
		
		var id = '<%=(String)session.getAttribute("userId")%>';
		
		$.ajaxSetup({
			ContentType : "application/x-www-form-urlencoded;charset=UTF-8",
			type : "post"
		});
		
		console.log('id 값 >>> ' + id);
		
		$.ajax({
			type : "post",
			url : "<%=request.getContextPath()%>/Login/profileqnaboardlist.jsp",
			data : {userId : id},
			datatype : "xml",
			success : function(data){
				
				let table = "";
				if(data){
					$(data).find("main").each(function(){
						table += "<div id='container' class='border-bottom' >"
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
				}else {
					table = "<h3>등록한 질문이 없습니다.</h3>"
				}
				
				$("#qnacontent").append(table);
				
			},
			
			error : function(data){
				alert("데이터 통신 오류입니다.");
			}
		});
		
		<%-- $.ajax({
			type : "post",
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
			},
			
			error : function(data){
				alert("데이터 통신 오류입니다.");
			}
		}); --%>
	});
</script>
</head>
<body class="users users-show bg-primary" >

	<jsp:include page="../include/user_top.jsp" />
	
	<c:set var="dto" value="${content }"/>
	<div class="main">
		<div class="content clearfix">
			<div class="content-wrap clearfix">
				<!-- 유저 인포 -->
				<div class="info">
					<div id="preview" class="preview m-b-10 car">
						<img class="profile-iamge" src="upload/userprofileicon.png">
					</div>
					<div class="name-edit">
						<h1 class="name">정영훈</h1>
						<a data-remote="true" href="#">수정</a>
					</div>
				
					<div class="detail-info">
						<div id="inroduction" class="user-information">
							<i class="bi bi-quote"></i>
							<c:if test="${empty dto.user_profile}">
								<span class="hc-icons-introduction hc-icons"></span>
							</c:if>
							<c:if test="${!empty dto.user_profile}">
								<span class="hc-icons-introduction hc-icons">${dto.user_profile}</span>
							</c:if>
							<span>
								<a data-remote="true" href="#">등록</a>
							</span>
						</div>
					
						<div id="homepage" class="user-information">
							<i class="bi bi-house-fill"></i>
							<c:if test="${empty dto.user_homepage}">
								<span class="hc-icons-homepage hc-icons"></span>
							</c:if>
							
							<c:if test="${!empty dto.user_homepage}">
								<span class="hc-icons-homepage hc-icons">${dto.getUser_homepage() }</span>
							</c:if>
							<span>
								<a data-remote="true" href="#">등록</a>
							</span>
						</div>
					</div>
				</div>
				<!-- 유저 인포 -->
				
				<!-- qna 탭 -->
				<div class="qnatab">
					<header>
						<h1>Q&A</h1>
					</header>
					<!-- 탭 타이틀 -->
					<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
					  	<li class="nav-item" role="presentation">
					   		<a class="nav-link active" id="pills-qna-questions-tab" data-bs-toggle="pill" data-bs-target="#pills-qna-questions" type="button" role="tab" aria-controls="pills-qna-questions" aria-selected="true">질문</a>
					 	</li>
					  	<li class="nav-item" role="presentation">
					    	<a class="nav-link" id="pills-qna-answers-tab" data-bs-toggle="pill" data-bs-target="#pills-qna-answers" type="button" role="tab" aria-controls="pills-qna-answers" aria-selected="false">답변</a>
					  	</li>
					</ul>
			
					<!-- 탭 타이틀 -->
				
				
					<!-- 탭 내용 -->
					<div class="tab-content" id="pills-tabContent">
						<div id="pills-qna-questions" class="tab-pane fade show active" role="tabpanel" aria-labelledby="pills-qna-questions-tab" tabindex="0">
							<ul class="question-list questions" id="qnacontent" style="padding-left: 0px">
							</ul>
						</div>
						
						<div id="pills-qna-answers" class="tab-pane fade" role="tabpanel" aria-labelledby="pills-qna-answers-tab" tabindex="0">
							<ul class="question-list answers">
								<h3>qna답변</h3>
							</ul>
						</div>
					</div>
					<!-- 탭 내용 -->
				</div>
				<!-- qna 탭 -->
				
				<!-- study 탭 -->
				<div class="studytab">
					<!-- 탭 타이틀 -->
					<header>
						<h1>Study</h1>
					</header>
					<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
					  	<li class="nav-item" role="presentation">
					   		<a class="nav-link active" id="pills-study-questions-tab" data-bs-toggle="pill" data-bs-target="#pills-study-questions" type="button" role="tab" aria-controls="pills-study-questions" aria-selected="true">질문</a>
					 	</li>
					  	<li class="nav-item" role="presentation">
					    	<a class="nav-link" id="pills-study-answers-tab" data-bs-toggle="pill" data-bs-target="#pills-study-answers" type="button" role="tab" aria-controls="pills-study-answers" aria-selected="false">답변</a>
					  	</li>
					</ul>
					<!-- 탭 타이틀 -->
					
					<!-- 탭 내용 -->
					<div class="tab-content" id="pills-tabContent">
						<div id="pills-study-questions" class="tab-pane fade show active" role="tabpanel" aria-labelledby="pills-study-questions-tab" tabindex="0">
							<ul class="question-list">
								<h3>study질문</h3>
							</ul>
						</div>
						
						<div id="pills-study-answers" class="tab-pane fade" role="tabpanel" aria-labelledby="pills-study-answers-tab" tabindex="0">
							<ul class="question-list">
								<h3>study답변</h3>
							</ul>
						</div>
					</div>
					<!-- 탭 내용 -->
				<div>
				<!-- study 탭 -->
				<!-- 탭 내용 -->
			</div>
		</div>
	</div>
	
	
	
	<jsp:include page="../include/bottom.jsp" />
	
	
	
</body>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
</html>