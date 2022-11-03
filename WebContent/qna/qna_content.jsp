
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
	href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/11.5.0/styles/github-dark-dimmed.min.css" />
<script
	src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/11.5.0/highlight.min.js"></script>
<script>
  hljs.highlightAll();
</script>
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
.mb-3 {
	width: 40em;
}

#qna_cont {
	height: 26em;
/* 	resize: none; /* 크기고정 */ */
}


.qnaEditDelete {
	margin-left: 650px;
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
	border: 2px solid #0d6efd;
	background-color: #0d6efd;
	border-radius: 15px;
	width: 400px;
	color: white;
	font-weight:lighter;
}

 .qnaCommentDate{
	 font-size:0.8em;
 }
 
 .qnaCommentwriter{
 	font-weight: 600;
 }
 
 #replylForm{
 	width : 800px;
 }

#codecss{
	background-color: black;
	color: white;
	border: 2px solid;
	border-radius: 15px;
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


/* 버튼 관련 css */

.modify{
	background-color: #0d6efd;
	border: #0d6efd;
	border-radius: 10px;
	color: white;
	width: 55px;
	height: 35px;
}

.del{
	background-color: white;
	border: 1px solid lightgray;
	border-radius: 10px;
	color: gray;
	width: 55px;
	height: 35px;
}

.modify:hover{
	background-color: #0c5dd4;
	border: 1px solid #0c5dd4;
	border-radius: 10px;
	color: white;
}

#del:hover{
	background-color: gray;
	border: 1px solid gray;
	border-radius: 10px;
	color: white;
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
 	padding-top: 0px;
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

	<div align="center">
		<c:set var="dto" value="${Cont }" />

		<h3 id = "qna_title">⦁  &nbsp; &nbsp; &nbsp; &nbsp; Coders Q&A  &nbsp; &nbsp; &nbsp; &nbsp; ⦁</h3>

		<br>

		<div class="align-middle">
			<div class="container col-md-6" style="width: 800px;">
				<div class="card">
					<div class="card-body">

						<div>
							<h4 class="card-title mb-3" align="left">${dto.qna_title }</h4>

							<h6 class="card-subtitle text-muted mb-4" align="left">
								<i class="fa-regular fa-user"></i> &nbsp; ${dto.qna_writer }
							</h6>

							<h6 class="card-subtitle text-muted mb-4" align="left">
								<i class="fa-regular fa-clock"></i> &nbsp; ${dto.qna_date }
								&nbsp; <i class="fa-regular fa-eye"></i> &nbsp; ${dto.qna_hit  } 
							</h6>
							
							
							<span id="qnaEditDelete" class="qnaEditDelete" style="display: none;"><a id="qnaEditIcon" class="qnaEditIcon"
						><i
							class="fa-solid fa-scissors"></i></a>&nbsp; <a id="qnaDeleteIcon"
							class="qnaDeleteIcon"><i
							class="fa-solid fa-trash"></i></a></span>


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
							alt="" />
						</p>
						

					<!-- 	<div class="mb-3 row">
							<label for="exampleFormControlInput1"
								class="col-sm-2 col-form-label">파일 첨부</label>
							<div class="col-sm-10">
								<input class="form-control" type="file" name="qna_file">
							</div>
						</div>
 					-->
 
						<div class="mb-3 row">
							<label for="exampleFormControlInput1"
								class="col-sm-2 col-form-label"> 태그 </label>
							<div class="col-sm-10">
								<input name="qna_tag" class="form-control"
									value="${dto.qna_tag }" readonly="readonly">
							</div>
						</div>
						
						
						<div>
							<input class="btn btn-primary"  type="button"
								value="댓글 작성" id = "commentOn">
							<input class="btn btn-outline-secondary" type="button"
								value="전체 목록" onclick= "location.href='qna_list.do'">
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
										id="co_writer" value=${userId  } size="10" readonly>
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

							<div class="mb-3 row" id = "fileAttach">
								<label for="exampleFormControlInput1"
									class="col-sm-2 col-form-label"><i class="fa-solid fa-laptop-file"></i> 첨부</label>
								<div class="col-sm-10">
									<input class="form-control" type="file" name="co_file"
										id="co_file">
								</div>

								<br> <br> <br>


								<div>
									<input type="button" id="commentBtn" value="댓글 작성"
										class="btn btn-primary">
										<input type="reset"
										id="resetBtn" value="다시 작성" class="btn btn-outline-primary">
										<input type="reset"
										id="cancelBtn" value="취소하기" class="btn btn-outline-secondary">
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
				<h5><i class="fa-regular fa-comment-dots"></i> 댓글 목록</h5>
				<br> 
				<table class="list" cellspacing="0" width = "800">
					
					<tr class="line">
				
					</tr>
					
				</table>
			</div>
			<br> <br>
			
		</div>
		<!-- 전체 div end -->

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
						table += "&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;" + "<button value = '수정' class= 'modify' align = 'right'>" + '수정' + "</button>" + "&nbsp"+					
									
						//삭제 버튼 
						 "<button value = '삭제' align = 'right' class = 'del' num = '" +$(this).find("qcomment_num").text()+"'>" + '삭제' + "</button>";
							
						table += "</td>";
						table += "</tr>";
					
						
						//////////////3행 댓글 번호 + 작성일자 + 추천/비추천 버튼
						table += "<tr>";
						table += "<td id='reNum' style='display: none;'>" + $(this).find("qcomment_num").text() + "</td>";
						table += "<td class='qnaCommentDate'>" + "작성일자: " + $(this).find("qcomment_date").text() + "</td>";
						
						//추천 버튼
						table += "<td id ='tdGoodBad' align = 'left''>" + "&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;" +
								"<input type = 'image' src = './qna_icon/thumbs-up.png' " +
								"id = 'goodUp' num = '" +$(this).find("qcomment_num").text()+"'>" + "&nbsp; &nbsp; &nbsp;" + 
							
						//비추천 버튼
							"<input type = 'image' src = './qna_icon/thumbs-down.png' " +
							"id = 'goodDown' num = '" +$(this).find("qcomment_num").text()+"'></td>"; 
						
						table += "</tr>";
						
						
						///////////////4행 내용 + 추천/비추천 수치 + 코드 내용
						table += "<tr>";
						table += "<td align = 'left' class='commentwrap'><div class='qcomment_content' style='white-space : pre-wrap' >" + $(this).find("qcomment_cont").text() + "</div>";
						
						//추천-비추천 수치
						table +=  "<td align = 'left' class = 'goodBadCount'>" + "&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;" + $(this).find("qcomment_good").text() + 
									"&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;" + $(this).find("qcomment_bad").text() + "&nbsp;" + "</td>"
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
                	 	table += "<textarea  class = 'modifyContArea' type='text' placeholder = '수정 내용을 입력하세요.'>" + "</textarea>" + 
                	 	
                	 				 "<textarea class = 'modifyCodeArea' type='text' placeholder = '수정 코드를 입력하세요.'>" + "</textarea>" + "</td>";
                	 	
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
							
							//입력된 내용을 지워줌.
							$("#co_content").val("");
							
							$("#co_code").val("");
						
						
						}else {
							alert('댓글 등록에 실패했습니다.');
						}
				},
				
				error : function() {
					alert('댓글 삭제 오류입니다.');
				}
			});
			
			
		});  // 댓글 등록하기 end
		
 
/*
		----------------------------------------------------------------------------------------------------------------------------------------- 
 */
		
 	 	//수정 버튼 클릭  시 수정 폼 visible
		$("table").on("click", ".modify", function() {
			
			if(this.textContent == '수정'){
			
				this.parentNode.parentNode.nextSibling.nextSibling.nextSibling.nextElementSibling.style.display = 'block';
				
				 //수정 버튼 클릭시 등록으로 변경하는 코드 
		         $(this).html('등록');
				 
				 //수정버튼 클릭 시 삭제버튼을 취소 버튼으로 변경하기 
				 $(this.nextElementSibling).html('취소')
				       
			 return;
			}
			
				if(this.textContent == '등록'){
				
				
				$.ajax({
					url : "/Project/qna_comment_modify_ok.do",
					datatype : "text",
					data : {
						
						qcomment_num : this.parentNode.parentNode.nextSibling.firstChild.textContent,
						qcomment_cont : this.parentNode.parentNode.nextSibling.nextSibling.nextSibling.nextSibling.firstChild.childNodes[0].value,
						qcomment_code : this.parentNode.parentNode.nextSibling.nextSibling.nextSibling.nextSibling.firstChild.childNodes[1].value
						
					}, 
						success : function(data){
							alert('대박 성공했습니다~');
							getList();
						
					}, 
					
						error : function(){
						   alert('데이터통신오류');
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
				
			$.ajax({
				async : false,
				url : "/Project/qna_comment_delete_ok.do",
				data : "no="+$(this).attr("num"),
				datatype : "text",
				success : function(data) {
					if(data > 0) {
						alert('댓글이 삭제되었습니다.');
						
						getList();
					}else {
						alert('댓글이 삭제되지 않았습니다.');
					}
				},
				
				error : function() {
					alert('데이터 통신 오류입니다.~~~');
				}
			}); //ajax end
			
			}//삭제 if end
			
		});
		
		
			
/*
	----------------------------------------------------------------------------------------------------------------------------------------- 
 */
		
			 	
	
		//추천 버튼 누르기 
		$(document).on("click", "#goodUp", function(){
			
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
			
		});
		
	
		//비추천 버튼 누르기 
		$(document).on("click", "#goodDown", function(){
			
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
		<br> <br> <br>

		<jsp:include page="../include/bottom.jsp" />
</body>