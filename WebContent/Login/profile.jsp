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

	@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap')
	;

	* {
	box-sizing: inherit;
	}

	.main a {
	text-decoration: none;
	}
	body {
	font-family: 'Noto Sans KR' !important;
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
	
	.upload {
    position: absolute;
    width: 15.7142857143rem;
    height: 2.7142857143rem;
    line-height: 2.7142857143rem;
    top: 13.4285714286rem;
    background-color: rgba(0,0,0,0.7);
    color: white;
	text-align: center;
	}
	
	.users-show .info {
	border-bottom: 4px solid #0275d8;
    display: inline-block;
    width: 100%;
    margin-bottom: 2.8571428571rem;
    padding: 1.5rem;
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
    width: 40rem;
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
	
	#container {
	  display: flex;
	  width: 100%;
	  height: 60px;
	  padding-top: 10px;
	  padding-bottom: 10px;
	  margin: auto;
	}
	
	.tab {
		display: flex;
		align-items: stretch;
	}
	
	.qnatab {
		margin-top: 100px;
		margin-bottom: 100px;
		margin-right: 30px;
		flex: 0.6;
	}
	
	.studytab {
		margin-left: 30px;
		margin-top: 100px;
		margin-bottom: 100px;
		flex: 0.6;
	}
	.qna_view_center {
		flex: 3;
		flex-grow: 7;
		text-align: left;
		font-size: 1em;
		align-items: center;
	}
	.qna_view_right {
		flex: 1;
		text-align: right;
		flex-grow: 2;
		display: flex;
		align-items: center;
		justify-content: flex-end;
	}
	
	div {
	  display: block;
	  align-items: center;
	}
	
	.qna_view_center{
		margin: auto;
	}
	
	#qna_center {
		clear: both;
	}
	
	#qna_view_date {
		color: gray;
		font-size: 13px;
		margin-bottom: 0;
	}

	.study_view_aTag{
	  text-decoration: none;
	  line-height: 48px;
	  color: gray;
	}
	
	#studyListContainer {
		display: flex;
		width: 38em;
		padding-bottom: 10px;
		margin: auto;
		align-items: center;
	}
	
	.study_view_left {
	  flex: 1;
	  text-align-last: left;
	  flex-grow: 1;
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
	
	#study_center {
		clear: both;
		display: inline-block;
	}
	
	.btn.btn-outline-primary {
		height: 37px;
		padding-top: 0px;
		padding-bottom: 0px;
	}
	
	#studyListContainer:hover {
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
	
/* 	#StudylistBtn {
		border-color: #dc3545;
		font-weight: bold;
		border-bottom: 7px solid #DC3545;
		padding: 0.2em 0 0 0.2em;
		color: #DC3545;
	} */
	
	.study_view_aTag {
		width: 450px;
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
	}
	
	.btn.btn-outline-primary{
		height: 37px;
		padding-top: 0px;
		padding-bottom: 0px;
	}
	
	.wrap1 {
	  width: 100%;
	  height: 300px;
	  display: flex;
	  align-items: center;
	  justify-content: center;
	}
	
	.form1 {
	  width: 100%;
	  height: 300px;
	  display: flex;
	  align-items: center;
	  justify-content: center;
	}

	.login1 {
	  width: 30%;
	  height: 300px;
	  background: white;
	  border-radius: 20px;
	  display: flex;
	  justify-content: center;
	  align-items: center;
	  flex-direction: column;
	}
	
	.login_input1 {
	  margin-left: 200px;
	  margin-top: 20px;
	  width: 500px;
	}

	.login_input1 input {
	  width: 300px;
	  height: 50px;
	  border-radius: 30px;
	  margin-top: 10px;
	  padding: 0px 20px;
	  border: 1px solid lightgray;
	  outline: none;
	}
	
	.submit1 {
	  margin-left: 200px;
	  margin-top: 50px;
	  width: 500px;
	}
	.submit1 input {
	  width: 300px;
	  height: 50px;
	  border: 0;
	  outline: none;
	  border-radius: 40px;
	  background: rgb(255, 255, 255);
	  color: black;
	  font-size: 1.2em;
	  letter-spacing: 2px;
	  transition: all 0.4s cubic-bezier(1, 1, 1, 1);
	}
	
	.submit_btn:hover {
	background: #2b59c6;;
	cursor: pointer;
	color: white;
	}
	
	
	p{
		text-align: center;
		width: 300px;	
		font-size: 1.5em;
	}
	
	.wrap2 {
	  width: 100%;
	  height: 500px;
	  display: flex;
	  align-items: center;
	  justify-content: center;
	}
	
	.form2 {
	  width: 100%;
	  height: 500px;
	  display: flex;
	  align-items: center;
	  justify-content: center;
	}
	
	.etc {
		text-decoration: none;
		line-height: 48px;
		color: gray;
		width: 400px;
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
	}
	
	.btn.btn-outline-primary {
		height: 37px;
		padding-top: 0px;
		padding-bottom: 0px;
	}
	
	#studyListContainer:hover {
		background-color: #f7f7f7;
	}
	
	button.btn.btn-outline-dark {
		border-color: #ffffff00;
		width: 70px;
		padding-right: 20px;
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
	
	.showbtn {
		width: 80px;
	  	height: 30px;
		background: #0d6efd;;
	  	color: white;
	  	font-size: 1em;
		border: 0;
	  	outline: none;
	  	border-radius: 10px;
		float: right;
		margin-top: 25px;
	}
	
	.modal-backdrop{
		background-color: rgba(0,0,0, .15) !important;
	}
	
	#StudylistBtn {
		padding-left: 6px;
		padding-right: 6px;
		color: #dc3545;
		border-color: #dc3545;
		font-weight: bold;
		width: 80px;
	}
	
	.studyEndTxt {
	font-weight: bold;
	}
	
	.studyIngTxt {
		border-bottom: 7px solid #dcf1fb;
		padding: 0.2em 0 0 0.2em;
		font-weight: bold;
	}
	
	
	
</style>
<script type="text/javascript">
	
	$(function(){
		
		var id = '<%=(String)session.getAttribute("userId")%>';
		
		$.ajaxSetup({
			ContentType : "application/x-www-form-urlencoded;charset=UTF-8",
			type : "post"
		});
		
		// qna 게시판에 유저가 작성한 최근 5개의 게시물을 불러오는 ajax
		$.ajax({
			type : "post",
			async: false,
			url : "<%=request.getContextPath()%>/Login/profileqnaboardlist.jsp",
			data : {userId : id},
			datatype : "xml",
			success : function(data){
				
				let table = "";
				
				let count = 0;
				
				let user_count = 0;				
					
				$(data).find("main").each(function(){
					
					if(count < 5) {
						
						table += "<div id='container' class='border-bottom'>"
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
						table += "<div id ='qna_view_date'>"
						if($(this).find("update").text() == 'null'){
							table += "<i class='fa-regular fa-clock'></i>&nbsp;"+$(this).find("date").text().substr(0,10)+"</div></div></div>"
						}else {
							table += "<i class='fa-regular fa-clock'></i>&nbsp;"+$(this).find("update").text().substr(0,10)+"</div></div></div>"
						}
						count += 1;
						
					}
				});
				
				$(data).find("maincount").each(function(){
					
					user_count = $(this).find("count").text()
					
				});
				
				if (user_count > 5){
					table += "<button class='showbtn' id='qnabopenlist' type='button' >더 보기</button>"
					
				}
				
				
				$("#qnacontent").append(table);
				
			},
			
			error : function(data){
				alert("데이터 통신 오류입니다.");
			}
		});
		
		
		// 더보기 버튼을 눌렀을 때 qna 게시판에 유저가 작성한 모든 게시물을 불러오는 ajax
		$(document).on("click", "#qnabopenlist", function(){
			
			$.ajax({
				type : "post",
				async: false,
				url : "<%=request.getContextPath()%>/Login/profileqnaboardlist.jsp",
				data : {userId : id},
				datatype : "xml",
				success : function(data){
					
					let table = "";
					
					$("#qnacontent").empty();
					
					$(data).find("main").each(function(){
							
							table += "<div id='container' class='border-bottom'>"
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
							table += "<div id ='qna_view_date'>"
							if($(this).find("update").text() == 'null'){
								table += "<i class='fa-regular fa-clock'></i>&nbsp;"+$(this).find("date").text().substr(0,10)+"</div></div></div>"
							}else {
								table += "<i class='fa-regular fa-clock'></i>&nbsp;"+$(this).find("update").text().substr(0,10)+"</div></div></div>"
							}
							
					});
					table += "<button class='showbtn' id='qnabcloselist' type='button' >닫 기</button>"
					
					$("#qnacontent").append(table);
					
				},
				
				error : function(data){
					alert("데이터 통신 오류입니다.");
				}
			});
			
		});
		
		// 닫기 버튼을 눌렀을 때 qna 게시판에 유저가 작성한 최근 5개의 게시물을 불러오는 ajax
		$(document).on("click", "#qnabcloselist", function(){
			
			$.ajax({
				type : "post",
				async: false,
				url : "<%=request.getContextPath()%>/Login/profileqnaboardlist.jsp",
				data : {userId : id},
				datatype : "xml",
				success : function(data){
					
					let table = "";
					
					let count = 0;
					
					let user_count = 0;	
					
					$("#qnacontent").empty();
						
					$(data).find("main").each(function(){
						
						if(count < 5) {
							
							table += "<div id='container' class='border-bottom'>"
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
							table += "<div id ='qna_view_date'>"
							if($(this).find("update").text() == 'null'){
								table += "<i class='fa-regular fa-clock'></i>&nbsp;"+$(this).find("date").text().substr(0,10)+"</div></div></div>"
							}else {
								table += "<i class='fa-regular fa-clock'></i>&nbsp;"+$(this).find("update").text().substr(0,10)+"</div></div></div>"
							}
							count += 1;
							
						}
					});
					
					$(data).find("maincount").each(function(){
						
						user_count = $(this).find("count").text()
						
					});
					
					if (user_count > 5){
						table += "<button class='showbtn' id='qnabopenlist' type='button' >더 보기</button>"
						
					}
					
					
					$("#qnacontent").append(table);
					
				},
				
				error : function(data){
					alert("데이터 통신 오류입니다.");
				}
			});
			
		});

/*------------------------------------------------------------------------------------------------------------------------------------------------- */
		
		// qna 게시판에 유저가 댓글을 단 최근 5개의 게시물을 불러오는 ajax
		$.ajax({
			type : "post",
			async: false,
			url : "<%=request.getContextPath()%>/Login/profileqnacommentlist.jsp",
			data : {userId : id},
			datatype : "xml",
			success : function(data){
				
				let table = "";
					
				let count = 0;
				
				let user_count = 0;
				
				$(data).find("main").each(function(){
					
					if(count < 5) {
						
						table += "<div id='container' class='border-bottom'>"
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
						table += "<div id ='qna_view_date'>"
						if($(this).find("update").text() == 'null'){
							table += "<i class='fa-regular fa-clock'></i>&nbsp;"+$(this).find("date").text().substr(0,10)+"</div></div></div>"
						}else {
							table += "<i class='fa-regular fa-clock'></i>&nbsp;"+$(this).find("update").text().substr(0,10)+"</div></div></div>"
						}
						count += 1;
						
					}
				});
				
				$(data).find("maincount").each(function(){
					
					user_count = $(this).find("count").text()
					
				});
				
				if (user_count > 5){
					table += "<button class='showbtn' id='cqnaopenlist' type='button' >더 보기</button>"
					
				}
				
				$("#qnacomment").append(table);
				
			},
			
			error : function(data){
				alert("데이터 통신 오류입니다.");
			}
		});
		
		// 더보기 버튼을 눌렀을 때 qna 게시판에 유저가 댓글을 단 모든 게시물을 불러오는 ajax
		$(document).on("click", "#cqnaopenlist", function(){
			
			$.ajax({
				type : "post",
				async: false,
				url : "<%=request.getContextPath()%>/Login/profileqnacommentlist.jsp",
				data : {userId : id},
				datatype : "xml",
				success : function(data){
					
					let table = "";
					
					$("#qnacomment").empty();
					
					$(data).find("main").each(function(){
							
							table += "<div id='container' class='border-bottom'>"
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
							table += "<div id ='qna_view_date'>"
							if($(this).find("update").text() == 'null'){
								table += "<i class='fa-regular fa-clock'></i>&nbsp;"+$(this).find("date").text().substr(0,10)+"</div></div></div>"
							}else {
								table += "<i class='fa-regular fa-clock'></i>&nbsp;"+$(this).find("update").text().substr(0,10)+"</div></div></div>"
							}
							
					});
					table += "<button class='showbtn' id='cqnacloselist' type='button' >닫 기</button>"
					
					$("#qnacomment").append(table);
					
				},
				
				error : function(data){
					alert("데이터 통신 오류입니다.");
				}
			});
			
		});
		
		// 닫기 버튼을 눌렀을 때 qna 게시판에 유저가 댓글을 단 최근 5개의 게시물을 불러오는 ajax
		$(document).on("click", "#cqnacloselist", function(){
			
			$.ajax({
				type : "post",
				async: false,
				url : "<%=request.getContextPath()%>/Login/profileqnacommentlist.jsp",
				data : {userId : id},
				datatype : "xml",
				success : function(data){
					
					let table = "";
					
					let count = 0;
					
					let user_count = 0;
					
					$("#qnacomment").empty();
					
					$(data).find("main").each(function(){
						
						if(count < 5) {
							
							table += "<div id='container' class='border-bottom'>"
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
							table += "<div id ='qna_view_date'>"
							if($(this).find("update").text() == 'null'){
								table += "<i class='fa-regular fa-clock'></i>&nbsp;"+$(this).find("date").text().substr(0,10)+"</div></div></div>"
							}else {
								table += "<i class='fa-regular fa-clock'></i>&nbsp;"+$(this).find("update").text().substr(0,10)+"</div></div></div>"
							}
							count += 1;
							
						}
					});
					
					$(data).find("maincount").each(function(){
						
						user_count = $(this).find("count").text()
						
					});
					
					if (user_count > 5){
						table += "<button class='showbtn' id='cqnaopenlist' type='button' >더 보기</button>"
						
					}
					
					
					$("#qnacomment").append(table);
					
				},
				
				error : function(data){
					alert("데이터 통신 오류입니다.");
				}
			});
			
		});
		
/*------------------------------------------------------------------------------------------------------------------------------------------------- */
		
		// study 게시판에 유저가 작성한 최근 5개의 게시물을 불러오는 ajax
		$.ajax({
			type : "post",
			async: false,
			url : "<%=request.getContextPath()%>/Login/profilestudyboardlist.jsp",
			data : {userId : id},
			datatype : "xml",
			success : function(data){
				
				let table = "";
				
				let count = 0;
				
				let user_count = 0;
				
				$(data).find("main").each(function(){
					
					let today = new Date().getTime();
					let today_n = Math.floor(today / (1000*60*60*24));
					
					let endDate = new Date($(this).find("date").text()).getTime();
					let endDate_n = Math.floor(endDate / (1000*60*60*24));
					
					let day = endDate_n - today_n + 1;
					
					if(count < 5) {
						
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
									table += "<button class='btn btn-outline-primary' id='StudylistBtn' disabled>D - DAY</button>"
								}
									
							}else if(day < 0){
								table += "<span class='studyEndTxt'>마 감</span>"
							}
						}
						table += "<button type='button' class='btn btn-outline-dark' disabled>"
						table += "<i class='fa-solid fa-person'></i> "+ $(this).find("people").text() +"</button></div></div></div>"
						
						count += 1;
					}
				});
				
				$(data).find("maincount").each(function(){
				
					user_count = $(this).find("count").text()
					
				});
				
				if (user_count > 5){
					table += "<button class='showbtn' id='bstudyopenlist' type='button' >더 보기</button>"
					
				}
				
				$("#studycontent").append(table);
			},
			
			error : function(data){
				alert("데이터 통신 오류입니다.");
			}
		});
		
		// 더보기 버튼을 눌렀을 때 study 게시판에 유저가 작성한 모든 게시물을 불러오는 ajax
		$(document).on("click", "#bstudyopenlist", function(){
			
			$.ajax({
				type : "post",
				async: false,
				url : "<%=request.getContextPath()%>/Login/profilestudyboardlist.jsp",
				data : {userId : id},
				datatype : "xml",
				success : function(data){
					
					let table = "";
					
					$("#studycontent").empty();
					
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
									table += "<span class='studyEndTxt'>마 감감</span>"
								}else if($(this).find("type").text() == "모집중"){
									table += "<span class='studyIngTxt'>D - "+day+"</span>"
								}
									
							}else if(day == 0){
								if($(this).find("type").text() == "모집완료"){
									table += "<span class='studyEndTxt'>마 감</span>"
								}else if($(this).find("type").text() == "모집중"){
									table += "<button class='btn btn-outline-primary' id='StudylistBtn' disabled>D - DAY</button>"
								}
									
							}else if(day < 0){
								table += "<span class='studyEndTxt'>마 감</span>"
							}
						}
						table += "<button type='button' class='btn btn-outline-dark' disabled>"
						table += "<i class='fa-solid fa-person'></i> "+ $(this).find("people").text() +"</button></div></div></div>"
							
					});
					table += "<button class='showbtn' id='bstudycloselist' type='button' >닫 기</button>"
					
					$("#studycontent").append(table);
					
				},
				
				error : function(data){
					alert("데이터 통신 오류입니다.");
				}
			});
			
		});
		
		// 닫기 버튼을 눌렀을 때 study 게시판에 유저가 작성한 최근 5개의 게시물을 불러오는 ajax
		$(document).on("click", "#bstudycloselist", function(){
			
			$.ajax({
				type : "post",
				async: false,
				url : "<%=request.getContextPath()%>/Login/profilestudyboardlist.jsp",
				data : {userId : id},
				datatype : "xml",
				success : function(data){
					
					let table = "";
					
					let count = 0;
					
					let user_count = 0;
					
					$("#studycontent").empty();
					
					$(data).find("main").each(function(){
						
						let today = new Date().getTime();
						let today_n = Math.floor(today / (1000*60*60*24));
						
						let endDate = new Date($(this).find("date").text()).getTime();
						let endDate_n = Math.floor(endDate / (1000*60*60*24));
						
						let day = endDate_n - today_n + 1;
						
						if(count < 5) {
							
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
										table += "<span class='studyEndTxt'>마 감감</span>"
									}else if($(this).find("type").text() == "모집중"){
										table += "<span class='studyIngTxt'>D - "+day+"</span>"
									}
										
								}else if(day == 0){
									if($(this).find("type").text() == "모집완료"){
										table += "<span class='studyEndTxt'>마 감</span>"
									}else if($(this).find("type").text() == "모집중"){
										table += "<button class='btn btn-outline-primary' id='StudylistBtn' disabled>D - DAY</button>"
									}
										
								}else if(day < 0){
									table += "<span class='studyEndTxt'>마 감</span>"
								}
							}
							table += "<button type='button' class='btn btn-outline-dark' disabled>"
							table += "<i class='fa-solid fa-person'></i> "+ $(this).find("people").text() +"</button></div></div></div>"
							
							count += 1;
						}
					});
					
					$(data).find("maincount").each(function(){
					
						user_count = $(this).find("count").text()
						
					});
					
					if (user_count > 5){
						table += "<button class='showbtn' id='bstudyopenlist' type='button' >더 보기</button>"
						
					}
					
					$("#studycontent").append(table);
				},
				
				error : function(data){
					alert("데이터 통신 오류입니다.");
				}
			});
			
		});
		
/*------------------------------------------------------------------------------------------------------------------------------------------------- */
		
		// study 게시판에 유저가 댓글을 단 최근 5개의 게시물을 불러오는 ajax
		$.ajax({
			type : "post",
			async: false,
			url : "<%=request.getContextPath()%>/Login/profilestudycommentlist.jsp",
			data : {userId : id},
			datatype : "xml",
			success : function(data){
				
				let table = "";
				
				let count = 0;
				
				let user_count = 0;
				
				$(data).find("main").each(function(){
					
					if(count < 5) {
						
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
									table += "<span class='studyEndTxt'>마 감감</span>"
								}else if($(this).find("type").text() == "모집중"){
									table += "<span class='studyIngTxt'>D - "+day+"</span>"
								}
									
							}else if(day == 0){
								if($(this).find("type").text() == "모집완료"){
									table += "<span class='studyEndTxt'>마 감</span>"
								}else if($(this).find("type").text() == "모집중"){
									table += "<button class='btn btn-outline-primary' id='StudylistBtn' disabled>D - DAY</button>"
								}
									
							}else if(day < 0){
								table += "<span class='studyEndTxt'>마 감</span>"
							}
						}
						table += "<button type='button' class='btn btn-outline-dark' disabled>"
						table += "<i class='fa-solid fa-person'></i> "+ $(this).find("people").text() +"</button></div></div></div>"
						
						count += 1;
					}
				});
				
				$(data).find("maincount").each(function(){
					
					user_count = $(this).find("count").text()
					
				});
				
				if (user_count > 5){
					table += "<button class='showbtn' id='cstudyopenlist' type='button' >더 보기</button>"
					
				}
				
				$("#studycomment").append(table);
			},
			
			error : function(data){
				alert("데이터 통신 오류입니다.");
			}
		});
		
		// 더보기 버튼을 눌렀을 때 study 게시판에 유저가 댓글을 단 모든 게시물을 불러오는 ajax
		$(document).on("click", "#cstudyopenlist", function(){
			
			$.ajax({
				type : "post",
				async: false,
				url : "<%=request.getContextPath()%>/Login/profilestudycommentlist.jsp",
				data : {userId : id},
				datatype : "xml",
				success : function(data){
					
					let table = "";
					
					$("#studycomment").empty();
					
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
									table += "<span class='studyEndTxt'>마 감감</span>"
								}else if($(this).find("type").text() == "모집중"){
									table += "<span class='studyIngTxt'>D - "+day+"</span>"
								}
									
							}else if(day == 0){
								if($(this).find("type").text() == "모집완료"){
									table += "<span class='studyEndTxt'>마 감</span>"
								}else if($(this).find("type").text() == "모집중"){
									table += "<button class='btn btn-outline-primary' id='StudylistBtn' disabled>D - DAY</button>"
								}
									
							}else if(day < 0){
								table += "<span class='studyEndTxt'>마 감</span>"
							}
						}
						table += "<button type='button' class='btn btn-outline-dark' disabled>"
						table += "<i class='fa-solid fa-person'></i> "+ $(this).find("people").text() +"</button></div></div></div>"
						
					});
					table += "<button class='showbtn' id='cstudycloselist' type='button' >닫 기</button>"
					
					$("#studycomment").append(table);
					
				},
				
				error : function(data){
					alert("데이터 통신 오류입니다.");
				}
			});
			
		});
		
		// 닫기 버튼을 눌렀을 때 study 게시판에 유저가 댓글을 단 최근 5개의 게시물을 불러오는 ajax
		$(document).on("click", "#cstudycloselist", function(){
			
			$.ajax({
				type : "post",
				async: false,
				url : "<%=request.getContextPath()%>/Login/profilestudycommentlist.jsp",
				data : {userId : id},
				datatype : "xml",
				success : function(data){
					
					let table = "";
					
					let count = 0;
					
					let user_count = 0;
					
					$("#studycomment").empty();
					
					$(data).find("main").each(function(){
						
						let today = new Date().getTime();
						let today_n = Math.floor(today / (1000*60*60*24));
						
						let endDate = new Date($(this).find("date").text()).getTime();
						let endDate_n = Math.floor(endDate / (1000*60*60*24));
						
						let day = endDate_n - today_n + 1;
						
						if(count < 5) {
							
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
										table += "<span class='studyEndTxt'>마 감감</span>"
									}else if($(this).find("type").text() == "모집중"){
										table += "<span class='studyIngTxt'>D - "+day+"</span>"
									}
										
								}else if(day == 0){
									if($(this).find("type").text() == "모집완료"){
										table += "<span class='studyEndTxt'>마 감</span>"
									}else if($(this).find("type").text() == "모집중"){
										table += "<button class='btn btn-outline-primary' id='StudylistBtn' disabled>D - DAY</button>"
									}
										
								}else if(day < 0){
									table += "<span class='studyEndTxt'>마 감</span>"
								}
							}
							table += "<button type='button' class='btn btn-outline-dark' disabled>"
							table += "<i class='fa-solid fa-person'></i> "+ $(this).find("people").text() +"</button></div></div></div>"
							
							count += 1;
						}
					});
					
					$(data).find("maincount").each(function(){
						
						user_count = $(this).find("count").text()
						
					});
					
					if (user_count > 5){
						table += "<button class='showbtn' id='cstudyopenlist' type='button' >더 보기</button>"
						
					}
					
					$("#studycomment").append(table);
				},
				
				error : function(data){
					alert("데이터 통신 오류입니다.");
				}
			});
			
		});
		
		$("#input-file").on("change", function(){
			
			var form = document.getElementById("form");
			var formData = new FormData(form);
			
			formData.append("file", $("#input-file"));
			
			$.ajax({
				
				type : "post",
				async: false,
				url : "<%=request.getContextPath()%>/profile_file_upload.do",
				processData: false,
				contentType: false,
				data : formData,
				datatype : "xml",
				success : function(data){
					
					test();
					
				},
				
				error : function(data){
					alert("데이터 통신 오류입니다.");
				}
			});
			
		});		
		
		function test() {    
			LoadingWithMask();
			setTimeout(closeLoadingWithMask, 3000);
		} 
		
		function LoadingWithMask() {    
			//화면의 높이와 너비를 구합니다.    
			var maskHeight = $(document).height();    
			var maskWidth  = window.document.body.clientWidth;         
			
			//화면에 출력할 마스크를 설정해줍니다.    
			var mask       = "<div id='mask' style='position:absolute; z-index:9000; background-color:#000000; display:none; left:0; top:0;'></div>";    
			var loadingImg = "<div id='loadingImg' class='spinner-border text-primary' role='status'><span class='visually-hidden'>Loading...</span></div>>";  
			
			//화면에 레이어 추가    
			$("body").append(mask)     
			$("#mask").append(loadingImg)     
			
			//마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채웁니다.    
			$("#mask").css({            
				"width" : maskWidth,            
				"height": maskHeight,            
				"opacity" : "0.3"    
			});
			
			$("#loadingImg").css({
				"margin-left" : "950px",
				"margin-top" : "500px",
			});
			
			
			//마스크 표시    
			$("#mask").show();      
			
			//로딩중 이미지 표시    
			$("#loadingImg").show();
			
		} 
			
		function closeLoadingWithMask() {    
				$("#mask, #loadingImg").hide();    
				$("#mask, #loadingImg").empty();
				window.location.reload();  
		}
			
		
	});
</script>
</head>
<body class="users users-show" style="background-color: #2b59c6;" >

	<jsp:include page="../include/user_top.jsp" />
	
	<c:set var="dto" value="${content }"/>
	<div class="main">
		<div class="content clearfix">
			<div class="content-wrap clearfix">
				<!-- 유저 인포 -->
				<div class="info">
					<div id="preview" class="preview m-b-10 car">
						<c:if test="${empty dto.user_file }">
							<img class="profile-image" src="upload/userprofileicon.png">
						</c:if>
						
						<c:if test="${!empty dto.user_file }">
							<img class="profile-image" src="<%=request.getContextPath() %>/upload/${dto.user_file}">
						</c:if>
						<form id="form" method="post" enctype="multipart/form-data" action="">
							<h5 class="upload">
								<label class="uploadbtn" for="input-file"><i class="bi bi-camera"></i> 사진 업로드</label>
								<input type="file" id="input-file" name="file" style="display: none;"/>
							</h5>
						</form>
					</div>
					<div class="name-edit">
						<h1 class="name">${dto.user_name }</h1>
						<a href="#myModal1" data-bs-toggle="modal">&nbsp;&nbsp;&nbsp;수정</a>
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
								<a href="#myModal2" data-bs-toggle="modal">&nbsp;&nbsp;&nbsp;등록</a>
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
								<a href="#myModal3" data-bs-toggle="modal">&nbsp;&nbsp;&nbsp;등록</a>
							</span>
						</div>
					</div>
				</div>
				<!-- 유저 인포 -->
				
				
				<div class="tab">
					<!-- qna 탭 -->
					<div class="qnatab">
						<header>
							<h1>Q&A</h1>
						</header>
						<!-- 탭 타이틀 -->
						<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
						  	<li class="nav-item" role="presentation">
						   		<a class="nav-link active" id="pills-qna-questions-tab" data-bs-toggle="pill" data-bs-target="#pills-qna-questions" type="button" role="tab" aria-controls="pills-qna-questions" aria-selected="true">질문 ${qnaboardcount }</a>
						 	</li>
						  	<li class="nav-item" role="presentation">
						    	<a class="nav-link" id="pills-qna-answers-tab" data-bs-toggle="pill" data-bs-target="#pills-qna-answers" type="button" role="tab" aria-controls="pills-qna-answers" aria-selected="false">답변 ${qnacommentcount }</a>
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
								<ul class="question-list answers" id="qnacomment" style="padding-left: 0px">
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
						   		<a class="nav-link active" id="pills-study-questions-tab" data-bs-toggle="pill" data-bs-target="#pills-study-questions" type="button" role="tab" aria-controls="pills-study-questions" aria-selected="true">질문 ${studyboardcount }</a>
						 	</li>
						  	<li class="nav-item" role="presentation">
						    	<a class="nav-link" id="pills-study-answers-tab" data-bs-toggle="pill" data-bs-target="#pills-study-answers" type="button" role="tab" aria-controls="pills-study-answers" aria-selected="false">답변 ${studycomment }</a>
						  	</li>
						</ul>
						<!-- 탭 타이틀 -->
						
						<!-- 탭 내용 -->
						<div class="tab-content" id="pills-tabContent">
							<div id="pills-study-questions" class="tab-pane fade show active" role="tabpanel" aria-labelledby="pills-study-questions-tab" tabindex="0">
								<ul class="question-list" id="studycontent" style="padding-left: 0px">
								</ul>
							</div>
							
							<div id="pills-study-answers" class="tab-pane fade" role="tabpanel" aria-labelledby="pills-study-answers-tab" tabindex="0">
								<ul class="question-list" id="studycomment" style="padding-left: 0px">
								</ul>
							</div>
						</div>
						<!-- 탭 내용 -->
					<div>
					<!-- study 탭 -->
				</div>
			</div>
		</div>
	</div>
	
	<!-- 이름 수정 start -->
	<div class="container">
	  <div class="modal fade" id="myModal1">
	    <div class="modal-dialog">
	      <div class="modal-content">
	        <div class="modal-body">
	          <div class="wrap1">
				<form class="form1" method="post" action="<%=request.getContextPath()%>/name_modify_ok.do">
				<input type="hidden" name="token" value="user">
					<div class="login1">
					<p class="font">이름을 등록해주세요.</p>
						<div class="login_input1">
							<input type="text" id="id_input" name="name" class="form-control" placeholder="${dto.user_name }" required>
						</div>
								            
						<div class="submit1">
							<input class="submit_btn"type="submit" value="입력">
						</div>
					</div>
				</form>
			  </div>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 이름 수정 end -->
	
	<!-- 자기소개 수정 start -->
	<div class="container">
	  <div class="modal fade" id="myModal2">
	    <div class="modal-dialog">
	      <div class="modal-content">
	        <div class="modal-body">
	          <div class="wrap2">
				<form class="form2" method="post" action="<%=request.getContextPath()%>/profile_modify_ok.do">
				<input type="hidden" name="token" value="user">
					<div class="login1">
					<p class="font">자기소개를 등록해주세요.</p>
						<div class="login_input1">
							<textarea name="profile" cols="37" rows="10" placeholder="${dto.user_profile }" required></textarea>
						</div>
								            
						<div class="submit1">
							<input class="submit_btn"type="submit" value="입력">
						</div>
					</div>
				</form>
			  </div>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 자기소개 수정 end -->
	
	<!-- 홈페이지 수정 start -->
	<div class="container">
	  <div class="modal fade" id="myModal3">
	    <div class="modal-dialog">
	      <div class="modal-content">
	        <div class="modal-body">
	          <div class="wrap1">
				<form class="form1" method="post" action="<%=request.getContextPath()%>/homepage_modify_ok.do">
				<input type="hidden" name="token" value="user">
					<div class="login1">
					<p class="font">홈페이지를 등록해주세요.</p>
						<div class="login_input1">
							<input type="text" id="id_input" name="homepage" class="form-control" placeholder="${dto.user_homepage }" required>
						</div>
								            
						<div class="submit1">
							<input class="submit_btn"type="submit" value="입력">
						</div>
					</div>
				</form>
			  </div>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
	</div>
	</div>
	<!-- 홈페이지 수정 end -->
	
	
	
	<jsp:include page="../include/bottom.jsp" />
	
	
	
</body>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
</html>