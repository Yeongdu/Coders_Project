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


 .container col-md-6{
 margin: auto;
 }
 
 .studyEditDelete{
 margin-left: 515px;
 }
 
 .studyEditIcon{
  color: black;
 }
 
 .studyEditIcon:hover{
  font-size: 1.1em;
  color: black;
 }
 
 .studyDeleteIcon{
  color: black;
 }
 
 .studyDeleteIcon:hover {
  color: black;
  font-size: 1.1em;	
 }
 
 .replyRap{
 margin: auto;
 width: 600px;
 display: flex;
 margin: auto;
 }
 
 #re_content{
 width: 502px;
 }
 
 .btn.btn-outline-secondary{
 font-size: 1em;
 padding-left: 10px;
 padding-right: 10px;
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

	<div class="align-middle">
		<div class="container col-md-6" style="width: 600px;">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title mb-3">${dto.getStudy_title() }</h4>
					<h6 class="card-subtitle text-muted mb-4">
						<i class="fa-regular fa-user"></i>${dto.getStudy_writer() } &nbsp;
						<i class="fa-regular fa-clock"></i> ${dto.getStudy_date()} &nbsp;
						<i class="fa-regular fa-eye"></i> ${dto.getStudy_hit() }            
					</h6>
					<span id="studyEditDelete" class="studyEditDelete" style="display: none;"><a class="studyEditIcon"
						href="studyboard_modify.do?no=${dto.getStudy_num() }"><i
							class="fa-solid fa-scissors"></i></a>&nbsp; <a
						class="studyDeleteIcon"
						onclick="if(confirm('게시글을 삭제하시겠습니까?')) {location.href='studyboard_delete_ok.do?no=${dto.getStudy_num() }'} else {return; }"><i
							class="fa-solid fa-trash"></i></a></span> <br> <br>
					<p>
						<img class="card-img"
							src="<%=request.getContextPath()%>/study_upload/${dto.getStudy_file()}"
							alt="" />
					</p>
					<p class="card-text"><textarea class="form-control" style="border:white;" readonly>${dto.getStudy_cont() }</textarea></p>
					<br> <span class="btn btn-outline-dark"><i
						class="fa-regular fa-calendar-days"></i>
						${dto.study_start.substring(0, 10)} ~ ${dto.study_end.substring(0, 10) }</span>
					&nbsp; <span class="btn btn-outline-dark"><i
						class="fa-solid fa-person"></i> ${dto.study_people }</span>
				</div>
			</div>
		</div>
	</div>
	
	<br>
	
	<div class="replyRap">
	<input class="form-control re_cont" name="re_content" id="re_content">
	&nbsp;&nbsp;
	<span class="btn btn-outline-secondary" id="replyBtn">댓글쓰기</span>
	</div>
	
	
	 <div>
	      <table class="list" cellspacing="0" width="400">
	         
	         <tr class="line">
	            <td>댓글내용</td> <td>작성일자</td>
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
	
	
	// TBL_REPLY 테이블의 모든 데이터를 가져오는 함수
	function getList() {
		
		$.ajax({
			url : "/Project/WebContent/study/studyboard_reply.jsp",
			data : {scomment_num : ${dto.study_num } },
			datatype : "xml",    // 결과 데이터 타입
			success : function(data) {
				// 테이블 태그의 타이틀태그를 제외한 
				// 댓글 목록을 지우는 명령어.
				$(".list tr:gt(0)").remove();
				
				let table = "";
				
				$(data).find("reply").each(function() {
					
					
					table += "<tr>";
					table += "<td>" + $(this).find("recont").text() + "</td>";
					table += "<td>" + $(this).find("redate").text() + "</td>";
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
		
		$.ajax({
			url : "/Project/studyboard_reply_insert.do",
			datatype : "text",
			data : {
					
				    content : $("#re_content").val(),
				    study_num : ${dto.study_num }
					},
			success : function(data) {
					if(data > 0) {
						alert('댓글 작성 완료');
						
					
						// 댓글 작성 후 다시 전체 댓글 리스트를
						// 화면에 뿌려주면 됨.
						getList();
						
						
						
						// input 태그에 입력된 내용을 지워줌.
						$("input[type=text]").each(function() {
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
	});  // 댓글 등록하기 end
	
	
	
	
	function adjustHeight() {
		  var textEle = $('textarea');
		  textEle[0].style.height = 'auto';
		  var textEleHeight = textEle.prop('scrollHeight');
		  textEle.css('height', textEleHeight+8);
		};

	getList();  // 전체 리스트 함수 호출
	adjustHeight();
	
	//글쓴 사람만 EditDelete 보이는 함수
    function onlyWriter(){
            if(${userId == dto.study_writer}){
                $('.studyEditDelete').show();
                }
            };

    onlyWriter();
	

});
</script>

	<script src="https://kit.fontawesome.com/7703fd875c.js" crossorigin="anonymous"></script>
</body>
</html>