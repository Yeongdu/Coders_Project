<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
	crossorigin="anonymous"></script>
	


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
	crossorigin="anonymous">

<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap')
	;

body {
	font-family: 'Noto Sans KR' !important;
}

#study_title_1 {
	border: 2px solid #2b59c6;
	background-color: #2b59c6;
	border-radius: 15px;
	width: 400px;
	color: white;
	padding-bottom: 5px;
	box-shadow: 3px 3px 2px -1px rgba(0, 0, 0, 0.48);
	-webkit-box-shadow: 3px 3px 2px -1px rgba(0, 0, 0, 0.48);
	-moz-box-shadow: 3px 3px 2px -1px rgba(0, 0, 0, 0.48);
	font-weight: bold;
}

#study_title_1 a {
	text-decoration: none;
	color: white;
}

.container col-md-6 {
	margin: auto;
}

.study_title {
	font-weight: bold;
}

.title_btn_Wrap {
	display: flex;
	justify-content: space-between;
}

.study_subtitle {
	text-align: right;
	font-size: 0.9rem;
	color: gray;
}

.studyEditDelete a {
	text-decoration: none;
}

.studyEditIcon {
	color: black;
}

.studyDeleteIcon {
	color: black;
}

.commentwrap {
	width: 800px;
	word-break: break-all;
}

.swriter {
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

.scomment_cont1 {
	font-size: 18px;
}

.modifyOK {
	display: block;
	width: 100%;
	line-height: 32px;
	border: 1px solid #d2d2d2;
	padding-left: 10px;
	padding-right: 10px;
	border-radius: 8px;
	white-space: pre-wrap;
}

.borderbottom {
	border-bottom: 1px solid #bdbdbd;
	padding: 10px;
}

.ReCount_wrap {
	display: flex;
	justify-content: center;
}

.ReCount {
	padding-left: 5px;
	font-size: 20px;
	width: 800px;
	padding-bottom: 9px;
	font-weight: bold;
}

.replyRap1 {
	display: flex;
	justify-content: center;
}

.replyRap {
	width: 800px;
	align-items: center;
}

.replyRap textarea {
	font-family: inherit;
	padding: 1rem;
	outline: none;
	border: 0;
	border-radius: 16px;
	width: 780px;
	min-height: 35px;
	resize: none;
	background-color: #ffffff00;
}

#re_content {
	width: 800px;
}

.button {
	outline: none;
	border: none;
	background-color: #fff;
	cursor: pointer;
}

.btn.btn-outline-secondary {
	font-size: 1em;
	padding-left: 10px;
	padding-right: 10px;
}

.commentInput_buttonWrapper {
	display: flex;
	justify-content: center;
}

.commentInput_button {
	text-align: right;
	width: 800px;
	padding-top: 7px;
	padding-bottom: 30px;
}

.modifyBtn {
	color: black;
	background-color: transparent;
	border: 0;
}

.deleteBtn {
	color: black;
	background-color: transparent;
	border: 0;
}

.contBottomWrab {
	display: flex;
	justify-content: space-between;
}

.scommentDate {
	font-size: 0.8em;
	padding-bottom: 10px;
	color: gray;
}

.scommentwriter {
	font-weight: 600;
	width: 200px;
}

.swriterwrap {
	width: 50px;
}

button.btn.btn-outline-dark {
	border-color: #b5b5b5;
}

.btn.btn-outline-secondary {
	width: 86px;
	padding-left: 5px;
	padding-right: 5px;
	margin-bottom: 9px;
}

.btn.btn-primary {
	width: 86px;
	padding-left: 5px;
	padding-right: 5px;
	background-color: DarkCyan;
	padding-bottom: 7px;
	border: 0px;
}

.card-dody_reply {
	height: 80px;
}

.card {
	position: absolute;
	min-width: 800px !important;
}

.card_mainWrap {
	display: flex;
	justify-content: center;
	margin: 0 auto;
}

/* .hr-sect { */
/* 	display: flex; */
/* 	flex-basis: 100%; */
/* 	align-items: center; */
/* 	color: rgba(0, 0, 0, 0.35); */
/* 	font-size: 1rem; */
/* 	margin: 0 auto; */
/* 	width: 800px; */
/* } */

/* .hr-sect a { */
/* 	text-decoration: none; */
/* 	color: gray; */
/* } */

/* .hr-sect::before, .hr-sect::after { */
/* 	content: ""; */
/* 	flex-grow: 1; */
/* 	background: rgba(0, 0, 0, 0.35); */
/* 	height: 1px; */
/* 	font-size: 0px; */
/* 	line-height: 0px; */
/* 	margin: 0px 16px; */
/* } */

.btn.btn-primary_rank{
	font-size:0.6em;
	width: 50px;
	padding-left: 5px;
	padding-right: 5px;
	padding-bottom: 7px;
	margin-bottom: 2px;
}

.btn.btn-outline-secondary_rank{
	font-size:0.6em;
	width: 50px;
	padding-left: 5px;
	padding-right: 5px;
	margin-bottom: 2px;
	--bs-btn-disabled-border-color: gray;
	--bs-btn-disabled-color: gray;

}


.sideBanner {
	position: absolute;
	width: 280px;
	height: 266px;
	top: 250px;
	background-color: none;
	color: #fffffff;

	padding: 5px;
}

.sideBanner_study{
	padding: 5px;
	margin: 5px;
	border: 1px dashed gray;
}
.sideBanner_qna{
	padding: 5px;
	margin: 5px;
	border: 1px dashed gray;
}

.sideBanner a{
text-decoration: none;
font-size: 1em;
}

@media screen and (max-width: 1400px) {
	.sideBanner {
		display: none;
	}
}

body .badge {
	font-size:0.6em;
	width: 50px;
	height: 29px;
	padding-left: 5px;
	padding-right: 5px;
	margin-bottom: 2px;
	--bs-badge-padding-y: 1em;
	
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
	
	<br>

	<c:set var="dto" value="${Cont }" />
	
	<input type="hidden" value="${dto.getStudy_writer() }" name="study_writer">
	<input type="hidden" value="${userId }" name="session_id">
	<div align="center">
		<h3 align="center" id = "study_title_1">⦁  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a href="<%=request.getContextPath() %>/studyBoard_list.do">Study</a> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ⦁</h3>
	</div>
<%-- 	<div class="hr-sect">모여서 공부해볼까용?&nbsp;/&nbsp;<a href="<%=request.getContextPath() %>/studyBoard_list.do">Study</a></div> --%>
	<br>

	<div class="card_mainWrap" style="width: 800px;">
		<div class="card">
			<div class="card-body">
				<div class="card-title mb-3">
					<div class="title_btn_Wrap">
						<div class="title_btn">
							<c:if test="${dto.study_status eq '모집중' }">
								<button type="button" class="btn btn-primary">${dto.study_status }</button>
							</c:if>

							<c:if test="${dto.study_status eq '모집완료' }">
								<button type="button" class="btn btn-outline-secondary" disabled>${dto.study_status }</button>
							</c:if>
						</div>
						<div id="studyEditDelete" class="studyEditDelete"
							style="display: none;">
							<a id="studyEditIcon" class="studyEditIcon">수정</a>
							&nbsp;|&nbsp; <a id="studyDeleteIcon" class="studyDeleteIcon">삭제</a>
						</div>
					</div>

					&nbsp;
					<h4 class="study_title" style="text-align: left;">${dto.getStudy_title() }</h4>
				</div>
				<h6 class="study_subtitle">

					<i class="fa-regular fa-user"></i> ${dto.getStudy_writer() } &nbsp;
					<i class="fa-regular fa-clock"></i> ${dto.getStudy_date()} &nbsp; <i
						class="fa-regular fa-eye"></i> ${dto.getStudy_hit() }

				</h6>
				<br> <br>
				<p>
				<c:if test="${!empty dto.getStudy_file()}">
					<img class="card-img"
						src="<%=request.getContextPath()%>/study_upload/${dto.getStudy_file()}"
						alt="" style="height: auto;"/>
				</c:if>
				<c:if test="${empty dto.getStudy_file()}"></c:if>
				</p>
				<p class="card-text">
					<textarea class="form-control" style="border: white;"
						id="study_cont" readonly>${dto.getStudy_cont() }</textarea>
				</p>
				<br>
				<div class="contBottomWrab">
					<div>
						<button class="btn btn-outline-dark" disabled>
							<i class="fa-regular fa-calendar-days"></i> 
							${dto.study_start.substring(0, 10)} ~
							${dto.study_end.substring(0, 10) }
						</button>
						&nbsp;
						<button class="btn btn-outline-dark" disabled>
							<i class="fa-solid fa-person"></i> ${dto.study_people }
						</button>
					</div>
					<div>
						<span id="studyComplete" class="btn btn-outline-success"
							style="display: none;"><i
							class="fa-solid fa-check"></i>&nbsp;모집완료</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	

	<br>
	
<!-- 	구분선 -->
<!-- 	<div align="center"> -->
<!-- 		<hr width="800px" align="center"> -->
<!-- 	</div> -->

	<br>
	
	
		<div class="sideBanner" align="left">
			<div class="sideBanner_study">
				<p align="center"
					style="margin-bottom: 5px; border-bottom: 3px double #8080804f;">STUDY
					게시판 인기글</p>
				<c:set var="rlist" value="${rList }" />
				<c:if test="${!empty rlist }">
					<c:forEach items="${rlist }" var="rdto">
						<div>

							<a class="text-truncate"
								href="<%=request.getContextPath()%>/studyBoard_content.do?no=${rdto.study_num }"
								style="display: block;"> <c:if
									test="${rdto.study_status eq '모집중' }">
									<button type="button" class="btn btn-primary_rank" disabled>${rdto.study_status }</button>
								</c:if> <c:if test="${rdto.study_status eq '모집완료' }">
									<button type="button" class="btn btn-outline-secondary_rank"
										disabled>${rdto.study_status }</button>
								</c:if> <c:if test="${rdto.study_status eq '모집중' }">
							&nbsp;<span style="font-size: 0.9em; color: black;">${rdto.getStudy_title() }</span>
								</c:if> <c:if test="${rdto.study_status eq '모집완료' }">
							&nbsp;<span style="font-size: 0.9em; color: gray;">${rdto.getStudy_title() }</span>
								</c:if>
							</a>

						</div>
					</c:forEach>
				</c:if>
				<c:if test="${empty rlist }">
					<h3>인기 게시글이 없음</h3>
				</c:if>
			</div>

			<br>

			<div class="sideBanner_qna">
				<p align="center"
					style="margin-bottom: 5px; border-bottom: 3px double #8080804f;">Q&A
					게시판 인기글</p>

				<c:set var="qrlist" value="${qrList }" />
				<c:if test="${!empty qrlist }">
					<c:forEach items="${qrlist }" var="qrdto">

						<div class="qna_view_center">
							<a class="text-truncate"
								href="<%=request.getContextPath()%>/qna_content.do?no=${qrdto.getQna_num() }"
								style="display: block; text-decoration: none; font-size: 0.9em;"
								class="etc"> <c:set var="tag" value="${qrdto.getQna_tag() }" />
								<c:if test="${tag == 'JAVA'}">
									<span class="badge text-bg-secondary">JAVA</span>
								</c:if> <c:if test="${tag == 'HTML'}">
									<span class="badge text-bg-primary">HTML</span>
								</c:if> <c:if test="${tag == 'JAVASCRIPT'}">
									<span class="badge text-bg-warning">JS</span>
								</c:if> <c:if test="${tag == 'CSS'}">
									<span class="badge text-bg-danger">CSS</span>
								</c:if> <c:if test="${tag == 'JQUERY'}">
									<span class="badge text-bg-success">JQUERY</span>
								</c:if> <c:if test="${tag == 'DATABASE'}">
									<span class="badge text-bg-info">DB</span>
								</c:if> <c:if test="${tag == 'JSP'}">
									<span class="badge text-bg-dark">JSP</span>
								</c:if> <c:if test="${tag == 'ETC'}">
									<span class="badge text-bg-light">ETC</span>
								</c:if> <c:if test="${tag == null}">
									<span class="badge text-bg-light">ETC</span>
								</c:if> <%-- 표시할 프로그래밍 언어 다 표시하기 --%> &nbsp; <span id="title"
								style="color: black;">${qrdto.getQna_title() }</span></a>
						</div>

					</c:forEach>
				</c:if>
				<c:if test="${empty qrlist }">
					<h3>인기 게시글이 없음</h3>
				</c:if>
			</div>
		</div>
	
	
	

	<%-- 댓글 폼 영역입니다. --%>
	<div class="ReCount_wrap">
		<div class="ReCount">${dto.study_reply}개의 댓글이 있습니다.</div>
	</div>
	<div class="replyRap1">
		<div class="replyRap" align="center">
			<div class="card">
				<div class="card-dody_reply">
					<textarea class="commentInput" placeholder="댓글을 입력하세요"
						id="re_content"></textarea>
				</div>
			</div>
		</div>
	</div>
	<div class="commentInput_buttonWrapper">
		<div class="commentInput_button">
			<button type="button" class="btn btn-outline-secondary" id="replyBtn"
				onclick="refreshPage();">댓글쓰기</button>
		</div>
	</div>


	<div align="center">
		<table class="list" width="798px">
			<tr class="line">
				<input type="hidden" value="${userId }" name="scomment_writer" id="scomment_writer">
			</tr>
		</table>
	</div>


	<jsp:include page="../include/bottom.jsp" />

	<script type="text/javascript">


     $(function() {
	
		// ajax에서 동일하게 사용되는 속성 설정
		$.ajaxSetup({
			// ajax에서 한글 깨짐 문제 해결
			ContentType : "application/x-www-form-urlencoded;charset=UTF-8",
			type : "post"
		});
		
		//페이지 새로고침 함수
		function refreshPage() {
	        window.location.reload();
	    }


	// TBL_REPLY 테이블의 모든 데이터를 가져오는 함수
	function getList() {
		
		$.ajax({
			async : false,
			url : "/Project/study/studyboard_reply.jsp",
			data : {scomment_num : ${dto.study_num } },
			datatype : "xml",    // 결과 데이터 타입
			success : function(data) {
				// 테이블 태그의 타이틀태그를 제외한 
				// 댓글 목록을 지우는 명령어.
				$(".list tr:gt(0)").remove();
				
				let table = "";
				
                 $(data).find("reply").each(function() {
					
                	 //1행 작성자, 수정, 삭제, 번호(hidden)

                     table += "<tr>";
                     table += "<td";
                     if('${dto.study_writer }' == $(this).find("scomment_writer").text()){
                     table += " style='display: block;'>";
                     }else{
                     table += " style='display: none;'>";
                     }
                     table += "<p class='swriter'>"+'작성자' + "</p></td>";
                     table += "</tr>";
                     
                     
                     table += "<td class='scommentwriter'><i class='fa-regular fa-user'>"+ "</i> " + $(this).find("scomment_writer").text() + "</td>";
                     table += "<td class='buttonwrap'colspan='5' align = 'right'";
                     if('${userId}' == $(this).find("scomment_writer").text()){
                     table += " style='display: block;'>";
                     }else {
                     table += " style='display: none;'>";
                     }
                     table +="<button value = '수정' id ='modifyBtn' class= 'modifyBtn'>" + '수정' + "</button>" + "&nbsp &nbsp"+ '| &nbsp' +
                     "<button value = '삭제' id ='deleteBtn' class='deleteBtn'>" + '삭제' + "</button>";
                     table += "</td>";
                     table += "<td id = 'reSnum' style='display:none;'><span>" + $(this).find("scomment_num").text() + "</span>";
                     table += "</tr>";
                     
                     
                      //2행 작성일자
                      table += "<tr>";
                      table += "<td class='scommentDate'>" + $(this).find("scomment_date").text() + "</td>";
                      table += "</tr>";

                      // 3행 내용
                      table += "<tr>";
                      table += "<td colspan='2' class='commentwrap'><div class=''scomment_cont1' style='white-space : pre-wrap' >" + $(this).find("scomment_cont").text() + "</div>";
                      table += "<textarea class= 'modifyOK' style='display:none;' type='text' wrap=on>" + $(this).find("scomment_cont").text() + "</textarea></td>";
                      table += "</tr>";


                      table += "<tr class='borderbottom'>";
                      table += "<td colspan='2'>&nbsp;</td>";
                      table += "</tr>";
                      
                      table += "<tr>";
                      table += "<td colspan='2'>&nbsp;</td>";
                      table += "</tr>";
                      
				});
				
				//테이블의 첫번째 행의 아래에 table를 추가
				$(".list tr:eq(0)").after(table);
				
			},
			
			error : function() {
				alert('데이터 통신 에러');
			}

		});
		
	}  // getList() 함수 end
	
	
	

	// 댓글 작성 버튼을 클릭했을 때 DB에 추가로 저장.
	$("#replyBtn").on("click", function() {
		if(${!empty userId}){
		
		$.ajax({
			url : "/Project/studyboard_reply_insert.do",
			datatype : "text",
			data : {
					
				    content : $("#re_content").val(),
				    scomment_writer :$("#scomment_writer" ).val(),
				    study_num : ${dto.study_num }
				    
					},
			success : function(data) {
					if(data > 0) {
						alert('댓글 작성 완료');
						
						refreshPage();
						// 댓글 작성 후 다시 전체 댓글 리스트를
						// 화면에 뿌려주면 됨.
						getList();
						
						
						// input 태그에 입력된 내용을 지워줌.
						$("#re_content").each(function() {
							$(this).val("");  // 입력된 값 지우기
						});
					
					}else {
						alert('댓글 추가가 실패 하였습니다.');
					}
			},
			
			error : function() {
				alert('데이터 통신 오류입니다.');
			}
		});
		
	} else{
		alert('로그인한 이용자만 이용할 수 있습니다.');
	}
	});  // 댓글 등록하기 end
	


	// 수정버튼 클릭 시 댓글 수정.
     $(document).on("click", "#modifyBtn", function(){

    	 
		console.log('성공');
		
		if(this.textContent == '수정'){	
			  
		
         //수정 버튼 클릭 시 textarea태그의 숨김 속성을 해제하는 코드 (this는 modifyBtn )
         this.parentNode.parentNode.nextSibling.nextSibling.childNodes[0].childNodes[1].style.display = 'block';
         
         //autosize($('.modifyOK')); 숨겨진 textarea태그의 높이 자동조절
         autoReplyHeight($(this.parentNode.parentNode.nextSibling.nextSibling).find('textarea'));

         //수정 버튼 클릭 시 div태그를 숨기는 코드 (this는 modifyBtn )	
         this.parentNode.parentNode.nextSibling.nextSibling.childNodes[0].childNodes[0].hidden = true;

         console.log('if문 성공');
         
         
         //수정 버튼 클릭시 수정완료, 취소버튼으로 변경하는 코드
         //this.setAttribute('value', '수정완료');
         $(this).html('수정완료');
         $(this.nextSibling.nextSibling).html('취소');
                 
         return;                  
         
        }
	
               
         //수정완료 버튼을 눌렀을 때 수정한 글이 저장되는 코드.
         if(this.textContent == '수정완료' ){
			 
			console.log('if수정완료문 성공');
			
			$.ajax({
				url : "/Project/studyboard_reply_modify.do",
				datatype : "text",
				data : {
					content : this.parentNode.parentNode.nextSibling.nextSibling.childNodes[0].childNodes[1].value,  //input태그 value
					scomment_num : this.parentNode.parentNode.childNodes[2].childNodes[0].textContent   //scomment_num 
					    },
					    
			   success : function(data){
				       
				   if(data > 0){
					   alert('댓글 수정 완료');
					   
					// 댓글 작성 후 다시 전체 댓글 리스트를
						// 화면에 뿌려주면 됨.
						getList();
					   
				   }else{
					   alert('댓글 수정 실패');
				   }
				   
			   },
			   
			   error : function(){
				   alert('데이터통신오류');
			   }
				
				
			});
   
         }//수정완료 if문
         
  });//수정버튼 클릭 시 이벤트 end



 
  //삭제버튼 클릭 시 이벤트
  $(document).on("click", "#deleteBtn", function(){
	  
	  console.log('취소까지 옴');
	  
	  
	  if(this.textContent == '삭제'){
	  if(confirm("해당 댓글을 삭제하시겠습니까?")){
		  $.ajax({
			  url : "/Project/studyboard_reply_delete.do",
			  datatype:"text",
			  data:{
				  scomment_num : this.parentNode.parentNode.childNodes[2].childNodes[0].textContent   //scomment_num 
			  },
			  
			  success : function(data){
				  if(data > 0){
					  alert('댓글이 삭제되었습니다.')
					  refreshPage();
					  getList();
				  }else{
					  alert('댓글 삭제에 실패했습니다.')
				  }
			  },
			  
			  error : function(){
				  
				  alert('데이터통신오류입니다.')
			  }
		  
		  })
	  }//삭제if문
	        return;
	  
	  }//value가 삭제일 때 if문 end
	  
	  
	  
	  
	  
	  if(this.textContent == '취소'){
			
			
	         //취소 버튼 클릭 시 보이는 input태그의 숨김 속성을 다시 실행하는 코드 (this는 deleteBtn )
	         this.parentNode.parentNode.nextSibling.nextSibling.childNodes[0].childNodes[1].style.display = 'none';

	         //취소 버튼 클릭 시 숨겨져 있는 span태그를 다시 보이게 하는 코드  (this는 deleteBtn )	
	         this.parentNode.parentNode.nextSibling.nextSibling.childNodes[0].childNodes[0].hidden = false;

	         //input태그 안의 텍스트를 초기화하는 코드.
	         this.parentNode.parentNode.nextSibling.nextSibling.childNodes[0].childNodes[1].value
	         
	      // input 태그에 입력된 내용을 지워줌.
				this.parentNode.parentNode.nextSibling.nextSibling.childNodes[0].childNodes[1].value =
					$(this.parentNode.parentNode.nextSibling.nextSibling.childNodes[0].childNodes[0]).text();
	         
	         console.log('if문 성공');
	         
	         //취소 버튼 클릭시 수정, 삭제버튼으로 변경하는 코드
	         $(this).html('삭제');

	         $(this.previousSibling.previousSibling).html('수정');
	         
	    }// value가 취소일 때 if문 end

	     
	  
  });//삭제버튼 클릭 이벤트
	
  
		//테이블내의 textarea class= 'modifyOK'의 높이 자동조절 함수
		function autoReplyHeight(elemt) {
			var textEle = $(elemt);
			textEle[0].style.height = 'auto';
			var textEleHeight = textEle.prop('scrollHeight');
			textEle.css('height', textEleHeight+16);
			};//autoReplyHeight end
	
	
		//본문 textarea 높이 자동조절 함수
		function adjustHeight() {
			var textEle = $('#study_cont');
			textEle[0].style.height = 'auto';
			var textEleHeight = textEle.prop('scrollHeight');
			textEle.css('height', textEleHeight+8);
			};

	getList();  // 전체 리스트 함수 호출
	adjustHeight();
	
	
	
	
	//글쓴 사람만 EditDelete 보이는 함수
	// 글쓴 사람만 studyEditDelete studyComplete 보이는 함수, 
	// 글쓴 사람만 수정, 삭제, 모집완료처리 할수 있다. 모집중인 상태에서만 모집완료 버튼 보인다.
    function onlyWriter(){
            if(${userId == dto.study_writer}){
                $('.studyEditDelete').show();
                $('#studyDeleteIcon').on({
                	  click: function () {
                		  if(${userId == dto.study_writer}){
                	    		 var result = confirm('게시글을 삭제하시겠습니까?');
                	    	        if(result) {
                	    	        	//yes
                	    	        	location.href='studyboard_delete_ok.do?no=${dto.getStudy_num() }';
                	    	        	} else {
                	    	        		//no
                	    	        		return;
                	    	        		}
                	    	        }
                		  }
                });
                $('#studyEditIcon').on({
                	click: function () {
                		if(${userId == dto.study_writer}){
                			location.href="studyboard_modify.do?no=${dto.getStudy_num() }";}
                		}
                });
                }
            }
    onlyWriter();
    
    function onlyWriterStatus(){
    	 if(${userId == dto.study_writer} && ${dto.study_status == '모집중'}){
    		$('#studyComplete').show(); 
         	$('#studyComplete').on({
     		click: function () {
     				var result = confirm('게시글을 모집완료로 변경하시겠습니까?');
     				if(result) {
     					//yes
     					location.href='study_statusChange.do?no=${dto.getStudy_num() }';
     					} else {
     						//no
     						return;
     						}
     				}
         	});
         	}
    	 }
    onlyWriterStatus();
    
	// 기본 위치(top)값
	var floatPosition = parseInt($(".sideBanner").css('top'))

	// scroll 인식
	$(window).scroll(function() {
	  
	    // 현재 스크롤 위치
	    var currentTop = $(window).scrollTop();
	    var bannerTop = currentTop + floatPosition + "px";

	    //이동 애니메이션
	    $(".sideBanner").stop().animate({
	      "top" : bannerTop
	    }, 700);

	}).scroll();


});
</script>

	<script src="https://kit.fontawesome.com/7703fd875c.js" crossorigin="anonymous"></script>
</body>
</html>
