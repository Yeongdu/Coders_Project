
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>


<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/11.5.0/styles/androidstudio.min.css" />
<script
	src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/11.5.0/highlight.min.js"></script>
<script>
  hljs.highlightAll();</script>


<!-- 코드 구현 스타일 -->


<script src="https://kit.fontawesome.com/89d1c95709.js"
	crossorigin="anonymous"></script>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.1.js"></script>
	
	
<script type="text/javascript">

	//댓글창 폼 
	$(document).ready(function(){
		$("#commentOn").click(function(){
			if($("#commentView").is(":visible")){
				$("#commentView").css("display", "none");
				
			}else {
				$("#commentView").css("display", "block");	
			}
		});	
	});

	$(document).ready(function(){
		$("#cancelBtn").click(function(){
			if($("#commentView").is(":visible")){
				$("#commentView").css("display", "none");
				
			}else {
				$("#commentView").css("display", "block");	
			}
		});
	});
	
</script>



	
<style type="text/css">

@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap')
	;

html {
	scroll-behavior: smooth;
	}

body {
	font-family: 'Noto Sans KR' !important;
}

.mb-3 {
	width: 664px;
}

.mb-3.row{
	margin-bottom: 0px !important;
}

#qna_cont {
	height: 26em;
/* 	resize: none; /* 크기고정 */ */
}


.qnaEditDelete a{
	text-decoration: none;
}

.qnaEditIcon {
	color: black;
}

.qnaDeleteIcon {
	color: black;
}

.container col-md-6 {
	margin: auto;
}


#commentView{

	display: none;
}

h6{
	text-align: left;
}

.card-subtitle{
	text-align: right;
    font-size: 0.9rem;
    color: gray;
}

h5{
	margin: auto;
}

#codeCont{
	margin-left: 16px;
}

pre {
	white-space: pre-line;
}

#noBlank {
	padding: 0px;
}

#code{
	padding-top: 0px;
}

#qna_title{
	border: 2px solid #2b59c6;
	background-color: #2b59c6;
	border-radius: 15px;
	width: 400px;
	color: white;
    padding-bottom: 5px;
	box-shadow: 3px 3px 2px -1px rgba(0,0,0,0.48);
	-webkit-box-shadow: 3px 3px 2px -1px rgba(0,0,0,0.48);
	-moz-box-shadow: 3px 3px 2px -1px rgba(0,0,0,0.48);
	font-weight: bold;
}

#qna_title a{
text-decoration: none;
color: white;
}

 .qnaCommentDate{
	 font-size:0.8em;
	 padding-bottom: 10px;
	 color: gray;
 }
 
 .qnaCommentwriter{
 	font-weight: 600;
 }
 
 #replylForm{
 	width : 800px;
 }


  .qwriter{
   
    font-size: 0.8em;
    color: red;
    margin: 0;
    border-style: solid;
    width: 50px;
    text-align: center;
    border-width: 1px;
    border-radius: 10px;
    background-color: #FFE6E6;
}

.commentwrap{
    width: 600px;
    word-break: break-all;
    height: 50px;
    
}

.modifyContArea{
	display : block;
	border: 1px solid lightgray;
	border-radius: 10px;
	margin-top: 20px;
	margin-bottom: 20px;
	width: 600px;
	height: 200px;
}

.modifyCodeArea{
	display : block;
	border: 1px solid lightgray;
	border-radius: 10px;
	width: 600px;
	height: 200px;
	margin-bottom: 20px;
}

.qcomment_content{
	margin-bottom: 50px;
}

.ReCount_wrap {
	display: flex;
	justify-content: center;
}

.ReCount {
text-align: left;
	padding-left: 5px;
	font-size: 20px;
	width: 800px;
	padding-bottom: 9px;
	font-weight: bold;
}


/* 버튼 관련 css */

.btn.btn-primary{
--bs-btn-bg: #2b59c6;
--bs-btn-border-color: #2b59c6;

--bs-btn-hover-color: #2b59c6;
--bs-btn-hover-bg: #ffffff00;
--bs-btn-hover-border-color: #2b59c6;

}

.btn.btn-outline-primary{
--bs-btn-border-color: #2b59c6;
--bs-btn-color: #2b59c6;

--bs-btn-hover-color: white;
--bs-btn-hover-bg: #2b59c6;
--bs-btn-hover-border-color: #2b59c6;
}



.writeResetBtn1{
	display: flex !important;
    justify-content: flex-end !important;
    text-align: right;
}

.writeResetBtn{
	display: flex !important;
    justify-content: flex-end !important;
    text-align: right;
}

.title_btn_Wrap {
	display: flex;
	justify-content: space-between;
}

.modify{
	background-color: white;
	border: white;
	border-radius: 10px;
	color: black;
	width: 80px;
	height: 35px;
	text-align: right;
}

.del{
	background-color: white;
	border: white;
	border-radius: 10px;
	color: black;
	width: 55px;
	height: 35px;
}

 .modifyOn{
	background-color: #0d6efd;
	border: #0d6efd;
	border-radius: 10px;
	color: white;
	width: 55px;
	height: 35px;
}

.modifyOn:hover{
	background-color: #0c5dd4;
	border: 1px solid #0c5dd4;
	border-radius: 10px;
	color: white;
}

#modifyOff{
	background-color: white;
	border: 1px solid lightgray;
	border-radius: 10px;
	color: gray;
	width: 55px;
	height: 35px;
}

#modifyOff:hover{
	background-color: gray;
	border: 1px solid gray;
	border-radius: 10px;
	color: white;
} 


#commentForm{
	width: 800px;
	margin: auto;

}

 .borderbottom{
 	border-bottom: 1px solid #bdbdbd;
    padding: 10px;
 	
 }
 
 .goodBadCount{
 	vertical-align: top;
 }
 
 

.hljs-line-numbers {
    text-align: right;
    border-right: 1px solid #ccc;
    color: #999;
    -webkit-touch-callout: none;
    -webkit-user-select: none;
    -khtml-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
}


</style>


</head>
<body>

	<c:if test="${empty userId }">
		<jsp:include page="../include/none_top.jsp" />
	</c:if>

	<c:if test="${!empty userId }">
		<jsp:include page="../include/user_top.jsp" />
	</c:if>

	<input type="hidden" value="${userId }" id="userId">

	<br>

	<div>
		<c:set var="dto" value="${Cont }" />
		<div align="center">

		<h3 align="center" id = "qna_title">⦁  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a href="<%=request.getContextPath() %>/qna_list.do">Q&A</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ⦁</h3>

		<br>
		<div class="align-middle">
			<div class="container col-md-6" style="width: 800px;">
				<div class="card">
					<div class="card-body">
						
						<div class="qna_view_center">

							<div class="title_btn_Wrap">
							
								<div class="title_btn">
									<c:set var="tag" value="${dto.getQna_tag() }" />
									<c:if test="${tag == 'JAVA'}">
										<span class="badge text-bg-secondary"
											style="padding-top: 10px;">JAVA</span>
									</c:if>
									<c:if test="${tag == 'HTML'}">
										<span class="badge text-bg-primary" style="padding: 10px;">HTML</span>
									</c:if>
									<c:if test="${tag == 'JAVASCRIPT'}">
										<span class="badge text-bg-warning" style="padding: 10px;">JAVASCRIPT</span>
									</c:if>
									<c:if test="${tag == 'CSS'}">
										<span class="badge text-bg-danger" style="padding: 10px;">CSS</span>
									</c:if>
									<c:if test="${tag == 'JQUERY'}">
										<span class="badge text-bg-success" style="padding: 10px;">JQUERY</span>
									</c:if>
									<c:if test="${tag == 'DATABASE'}">
										<span class="badge text-bg-info" style="padding: 10px;">DataBase</span>
									</c:if>
									<c:if test="${tag == 'JSP'}">
										<span class="badge text-bg-dark" style="padding: 10px;">JSP</span>
									</c:if>
									<c:if test="${tag == null}">
										<span class="badge text-bg-light" style="padding: 10px;">ETC</span>
									</c:if>
								</div>
								
								<div id="qnaEditDelete" class="qnaEditDelete"
									style="display: none;">
									<a id="qnaEditIcon" class="qnaEditIcon">수정</a> &nbsp;|&nbsp; <a id="qnaDeleteIcon"
										class="qnaDeleteIcon">삭제</a>
								</div>
							</div>
							&nbsp;
							<h4 class="qna_title" style="text-align: left; font-weight: bold;">${dto.getQna_title() }</h4>
						</div>

							<div style = "margin-left: 15px;">
							<h6 class="card-subtitle">
								<i class="fa-regular fa-user"></i> ${dto.qna_writer }&nbsp;
								<i class="fa-regular fa-clock"></i> ${dto.qna_date }&nbsp;
								&nbsp; <i class="fa-regular fa-eye"></i> ${dto.qna_hit  } 
							</h6>
							
							
							


						</div>

						<br>
						
						<h6 class="card-title mb-3" align="center" id = "codeCont">
							<i class="fa-solid fa-laptop-code"></i> 코드 내용
						</h6>

						<div class="card-body" id = "code">
							<c:if test="${empty dto.qna_code }">
								<label></label>
							</c:if>
							<c:if test="${!empty dto.qna_code }">
									<div class="card-body" align="left" id = "noBlank">
									<pre>					
										<code class="${dto.qna_tag }"><textarea class="form-control" id="qna_code" name="qna_code" readonly>${dto.qna_code }</textarea>
										</code>
									</pre>
								</div>
							</c:if>
						</div>

						

						<div class="card-body">
							<h6 class="card-title mb-3" align="center" id = "textCont">
								<i class="fa-solid fa-angle-right"></i> 본문</h6>
								<p class="card-text"><textarea class="form-control" style="border:white;" id="qna_cont" name="qna_cont" readonly>${dto.getQna_cont() }</textarea></p>
						</div>


						<br> 
						
						<p> 
						<img class="card-img" name="qna_file"
							src="<%=request.getContextPath() %>/qnaBoardWriteFolder/${dto.getQna_file()}"
							alt="" style = "height: auto;"/>
						</p>
						

					<!-- 	<div class="mb-3 row">
							<label for="exampleFormControlInput1"
								class="col-sm-2 col-form-label">파일 첨부</label>
							<div class="col-sm-10">
								<input class="form-control" type="file" name="qna_file">
							</div>
						</div>
 					-->
 
						<div class="writeResetBtn1">
							<input class="btn btn-primary"  type="button"
								value="댓글 작성" id = "commentOn">&nbsp;
							<input class="btn btn-outline-secondary" type="button"
								value="전체 목록" onclick= "location.href='qna_list.do'">
						</div>

					</div>
				</div>
			</div>
			</div>
			
			<br>
			
	<!-- 댓글 폼 영역 -->
	<form method="post" enctype="multipart/form-data">
			<div class="align-middle" id = "commentView" > <!-- 댓글폼 창 아이디 -->
				<div class="container col-md-6" style="width: 800px;">
					<div class="card">
						<div class="card-body">

							<div class="mb-3 row">
								<label for="exampleFormControlInput1"
									class="col-sm-2 col-form-label"><i
									class="fa-regular fa-user
									"></i> 작성자 </label>
								<div class="col-sm-10">
									<input class="form-control" type="text" name="co_writer"
										id="co_writer" readonly placeholder = "로그인이 필요한 기능입니다." value=${userId  }>
								</div>
							</div>

							<br>

							<div>
								<div class="col-sm-10">
									<textarea class="form-control" id="co_content"
										name="co_content" rows="10" cols="40" placeholder="내용을 입력해주세요."></textarea>
								</div>
							</div>
							
							<br> 
							
							<div>
								<div class="col-sm-10">
									<textarea class="form-control" id="co_code"
										name="co_code" rows="10" cols="40" placeholder="코드를 입력해주세요."></textarea>
								</div>
							</div>
							

							<br>

								<br>


								<div class="writeResetBtn">
									<input type="button" id="commentBtn" value="등록"
										class="btn btn-primary">
										&nbsp;
										<input type="reset"
										id="resetBtn" value="리셋" class="btn btn-outline-primary">
										&nbsp;
										<input type="reset"
										id="cancelBtn" value="취소" class="btn btn-outline-danger">
								</div>

							</div>
						</div>
					</div>

			</div>

			</div>
			<!-- 댓글폼 end -->
		</form>

			<br> <br> <br>
			<div id = "commentForm">
			
				<div class="ReCount_wrap">
					<div class="ReCount">${dto.qna_reply}개의 댓글이 있습니다.</div>
				</div>
				
<!-- 				<h5><i class="fa-regular fa-comment-dots"></i> 댓글 목록</h5> -->
				<br> 
				<table class="list" cellspacing="0" width = "800">
					
					<tr class="line">
				
					</tr>
					
				</table>
			</div>
			<br> <br>
			
		</div>
		<!-- 전체 div end -->
</div>
		<br>
		<br>
		

<script type="text/javascript">
		
		var qment = 0;
		
		function adjustHeight() {
			  var textEle = $('textarea');
			  textEle[0].style.height = 'auto';
			  var textEleHeight = textEle.prop('scrollHeight');
			  textEle.css('height', textEleHeight+8);
			};

		adjustHeight();
		
		

	$(function() {
		
		// ajax에서 동일하게 사용되는 속성 설정
		$.ajaxSetup({
			// ajax에서 한글 깨짐 문제 해결
			ContentType : "application/x-www-form-urlencoded;charset=UTF-8",
			type : "post"
		});
		
		
		//qna_comment 테이블의 모든 데이터를 가져오는 함수
		function getList() {
			
			$.ajax({
				async : false,
				url : "/Project/qna/qna_comment.jsp",
				data : { qcomment_num : ${dto.qna_num } },
				datatype : "xml",    // 결과 데이터 타입
				success : function(data) {
					// 테이블 태그의 타이틀태그를 제외한 댓글 목록을 지우는 명령어.
					$(".list tr:gt(0)").remove();
					
					let table = "";
					
					$(data).find("comment").each(function() {
					 	
						////////////1행 작성자 아이콘 띄우기 
						
						"<div class='card-body'>"
						
						table += "<tr>";
						table += "<td";
						if('${dto.qna_writer }' == $(this).find("qcomment_writer").text()){
			                table += " style='display: block;'>";
			               }else {
			                 table += " style='display: none;'>";
			             }
						table += "<p class='qwriter'>"+'작성자' + "</p></td>";
						table += "</tr>";
						
						
						///////////2행 작성자 아이디, 수정+ 삭제 버튼 
						table += "<tr>";
						table += "<td class = 'qnaCommentwriter'> <i class='fa-regular fa-user'>"+ "</i>" + "&nbsp;"+ $(this).find("qcomment_writer").text() +"</td>";
						
						
						//자기가 작성한 글에만 수정.삭제 버튼 띄우기 
						table += "<td class='buttonwrap'colspan='6' align = 'left'";
						
						 if('${userId}' == $(this).find("qcomment_writer").text()){
		                     table += " style='display: block;'>";
		                     }else {
		                     table += " style='display: none;'>";
		                 }
						 
						//수정 버튼     
						table += "&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;" + "<button value = '수정' class= 'modify' align = 'right'>" + '수정' + "</button>" + " &nbsp;|"+					
									
						//삭제 버튼 
						 "<button value = '삭제' align = 'right' class = 'del' num = '" +$(this).find("qcomment_num").text()+"'>" + '삭제' + "</button>";
							
						table += "</td>";
						table += "</tr>";
					
						
						//////////////3행 댓글 번호 + 작성일자 + 추천/비추천 버튼
						table += "<tr>";
						table += "<td id='reNum' style='display: none;'>" + $(this).find("qcomment_num").text() + "</td>";
						table += "<td class='qnaCommentDate'>" + "작성일자: " + $(this).find("qcomment_date").text() + "</td>";
						
						//추천 버튼
						table += "<td id ='tdGoodBad' align = 'left''>" + "&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;" +
								"<input type = 'image' src = './qna_icon/thumbs-up.png' " +
								"id = 'goodUp' num = '" +$(this).find("qcomment_num").text()+"'>" + "&nbsp; &nbsp; &nbsp; &nbsp;" + 
							
						//비추천 버튼
							"<input type = 'image' src = './qna_icon/thumbs-down.png' " +
							"id = 'goodDown' num = '" +$(this).find("qcomment_num").text()+"'></td>"; 
						
						table += "</tr>";
						
						
						///////////////4행 내용 + 추천/비추천 수치 + 코드 내용
						table += "<tr>";
						table += "<td align = 'left' class='commentwrap'><div class='qcomment_content' style='white-space : pre-wrap' >" + $(this).find("qcomment_cont").text() + "</div>";
						
						//추천-비추천 수치
						table +=  "<td align = 'left' class = 'goodBadCount'>" + "&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;" + $(this).find("qcomment_good").text() + 
									"&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;" + $(this).find("qcomment_bad").text() + "&nbsp;" + "</td>"
	                    table += "</tr>";
					
	   					 ////////////////5행 코드 소스 
						table += "<tr id = 'codecss'>";
						table += "<td";
						
						if( "null" != $(this).find("qcomment_code").text()){
								table += " style='display: block;'>";
		                    }else {
		                     	table += " style='display: none;'>";	
						}
						
						
						
						table += "<pre>" +"<code class = '{dto.getQna_tag() }'>" +"<textarea>" + $(this).find("qcomment_code").text() + "</textarea> " + "</code>" + "</pre>" + "</td>";						

						table += "</tr>";
							
						/////////////////6행 수정 폼 창 
						table += "<tr class = 'modifyForm' style='display: none;'>";
				      	table += "<td align = 'left'>";
                	 	table += "<textarea  class = 'modifyContArea' type='text' placeholder = '로그인이 필요한 기능입니다.'>" + $(this).find("qcomment_cont").text() +"</textarea>" + 
                	 	
                	 				 "<textarea class = 'modifyCodeArea' type='text' placeholder = '로그인이  필요한 기능입니다.'>" + $(this).find("qcomment_code").text() + "</textarea>" + "</td>";
                	 	
                	 	table += "</tr>";
						
                	    table += "<tr class='borderbottom'>";
                        table += "<td colspan='2'>&nbsp;</td>";
                        table += "</tr>";
                        
					 	table += "<tr>";
						table += "<td colspan='2'>&nbsp;</td>";
						table += "</tr>";
						
						"</div>"
	                  
					});
					
					$(".list tr:eq(0)").after(table);

				},
				
				error : function() {
					alert('데이터 통신 에러 발생');
				}
			});
			
			// 코드 형식으로 변경하는 메서드
		    $('pre > code').each(function() {
		    	hljs.highlightBlock(this);
			});

			
		}  // getList() 함수 end
		
		
		getList(); 
		
/*
	----------------------------------------------------------------------------------------------------------------------------------------- 
 */
			
	
	// 댓글 작성 버튼을 클릭했을 때 DB에 추가로 저장.
		$("#commentBtn").on("click", function() {
			
			if(${!empty userId}){
			
			$.ajax({
				async : false,
				url : "/Project/qna_comment_insert_ok.do",
				datatype : "text",
				data : {
						qcomment_num : ${dto.qna_num },
						qcomment_writer : $("#co_writer").val(),
						qcomment_cont : $("#co_content").val(),
						qcomment_code : $("#co_code").val()
						},
				success : function(data) {
						if(data > 0) {
							alert('댓글이 등록되었습니다.');

							// 댓글 작성 후 다시 전체 댓글 리스트를 화면에 출력.
							getList();
							refreshPage();
							
							//입력된 내용을 지워줌.
							$("#co_content").val("");
							$("#co_code").val("");
						
						}else {
							alert('내용을 입력해주세요.');
						}
				},
				
				error : function() {
					alert('댓글 등록 오류입니다.');
				}
				
			});
			
			} else{
				alert('로그인이 필요한 기능입니다.');
			}
			
			
		});  // 댓글 등록하기 end
		
 
/*
		----------------------------------------------------------------------------------------------------------------------------------------- 
 */
		
 	 	//수정 버튼 클릭  시 수정 폼 visible
		$("table").on("click", ".modify", function() {
			
			if(this.textContent == '수정'){
			
				this.parentNode.parentNode.nextSibling.nextSibling.nextSibling.nextElementSibling.style.display = 'block';
				
				 //수정 버튼 클릭시 등록으로 변경하는 코드 
		         $(this).html('수정 완료');
				 
				 //수정버튼 클릭 시 삭제버튼을 취소 버튼으로 변경하기 
				 $(this.nextElementSibling).html('취소')
				       
			 return;
			}
			
				if(this.textContent == '수정 완료'){
				
				
				$.ajax({
					url : "/Project/qna_comment_modify_ok.do",
					datatype : "text",
					data : {
						
						qcomment_num : this.parentNode.parentNode.nextSibling.firstChild.textContent,
						qcomment_cont : this.parentNode.parentNode.nextSibling.nextSibling.nextSibling.nextSibling.firstChild.childNodes[0].value,
						qcomment_code : this.parentNode.parentNode.nextSibling.nextSibling.nextSibling.nextSibling.firstChild.childNodes[1].value
						
					}, 
						success : function(data){
							alert('댓글이 수정되었습니다.');
							getList();
						
					}, 
					
						error : function(){
						   alert('데이터 통신 오류가 발생했습니다.');
					   }
			
				}); //ajax end
				
			}//if end
					
		});  
				
		   
/*
	----------------------------------------------------------------------------------------------------------------------------------------- 
 */
						
		 	
		// 댓글 삭제 / 수정 취소 
		$("table").on("click", ".del", function() {
			
			
			if(this.textContent == '취소'){
				this.parentNode.parentNode.nextSibling.nextSibling.nextSibling.nextSibling.style.display = 'none';
				
				 $(this.previousSibling.previousElementSibling).html('수정');
				 
				 getList();
				 
			} //취소 if end
				
			
			if(this.textContent == '삭제'){
				 if(confirm("해당 댓글을 삭제하시겠습니까?")){
			$.ajax({
				async : false,
				url : "/Project/qna_comment_delete_ok.do",
				data : "no="+$(this).attr("num"),
				datatype : "text",
				success : function(data) {
					if(data > 0) {
						alert('댓글이 삭제되었습니다.');
						
						getList();
						refreshPage();
					}else {
						alert('댓글이 삭제되지 않았습니다.');
					}
				},
				
				error : function() {
					alert('데이터 통신 오류입니다.');
				}
			}) //ajax end
			
			}//삭제if문
			    return;
			}
			
		});
		
		
			
/*
	----------------------------------------------------------------------------------------------------------------------------------------- 
 */
		
			 	
	
		//추천 버튼 누르기 
		$(document).on("click", "#goodUp", function(){
			
			if(${!empty userId}){
			
			$.ajax({
				async : false,
				url : "/Project/qna_comment_good_ok.do",
				datatype : "text",
				data : "no="+$(this).attr("num"),
					
				success : function(data){
					if(data>0){
						
							if(${empty userId }) {
								alert('로그인이 필요한 기능입니다.');
								
							}else{
								
								/* alert("좋아요를 누르셨습니다.")
								getList(); */

							}	
					}else {
						
						 getList(); 
					}
				}, 
				
				error : function(){
					alert("데이터 통신 오류입니다.")
				}
				
			})
			
			} else{
				alert('로그인한 이용자만 이용할 수 있습니다.');
			}
			
		});
		
	
		//비추천 버튼 누르기 
		$(document).on("click", "#goodDown", function(){
			
			if(${!empty userId}){
			
			$.ajax({
				async : false,
				url : "/Project/qna_comment_bad_ok.do",
				datatype : "text",
				data : "no="+$(this).attr("num"),
					
				success : function(data){
					if(data>0){
						
							if(${empty userId}) {
								alert('로그인이 필요한 기능입니다.');
								
							}else{
								
								/* alert("좋아요를 누르셨습니다.")
								getList(); */

							}	
					}else {
						
						 getList(); 
					}
				}, 
				
				error : function(){
					alert("데이터 통신 오류입니다.")
				}
				
			})
			
			} else{
				alert('로그인이 필요한 기능입니다.');
			}
			
		});
		
	
/*
	----------------------------------------------------------------------------------------------------------------------------------------- 
 */
	
	
	//// 글쓴 사람만 studyEditDelete studyComplete 보이는 함수, 
	// 글쓴 사람만 수정, 삭제, 모집완료처리 할수 있다. 모집중인 상태에서만 모집완료 버튼 보인다.
    function onlyWriter(){
            if(${userId == dto.qna_writer}){
                $('.qnaEditDelete').show();
                $('#qnaDeleteIcon').on({
                	  click: function () {
                		  if(${userId == dto.qna_writer}){
                	    		 var result = confirm('게시글을 삭제하시겠습니까?');
                	    	        if(result) {
                	    	        	//yes
                	    	        	location.href='qna_delete.do?no=${dto.qna_num }';
                	    	        	} else {
                	    	        		//no
                	    	        		return;
                	    	        		}
                	    	        }
                		  }
                });
                $('#qnaEditIcon').on({
                	click: function () {
                		if(${userId == dto.qna_writer}){
                			location.href='qna_modify.do?no=${dto.qna_num }';}
                		}
                });
                }
            }
    onlyWriter();

	});

	</script>
	
<script type="text/javascript">
		//페이지 새로고침 함수
		function refreshPage() {
	        window.location.reload();
	    }
</script>
	
	
	
		<br> <br> <br>

		<jsp:include page="../include/bottom.jsp" />
</body>