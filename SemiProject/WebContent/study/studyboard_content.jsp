<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.js"></script>

</head>
<body>

	<div align="center">
	  <c:set var="dto" value="${Cont }" />
		<hr width="50%">
		<h3> ${dto.getStudy_writer() }님 게시글</h3>
		<hr width="50%">
		
		
		<table border="1"cellspacing="0" width="400">
	      <tr>
	         <th>작성자</th>
	         <td> ${dto.getStudy_writer() } </td>
	      </tr>
	      
	      <tr>
	      	 <th>글제목</th>
	         <td> ${dto.getStudy_title() } </td>
	      </tr>
	      
	      <tr>
	      	<th>내용</th>
	      	<td>
	      	 
	            <textarea rows="7" cols="25" readonly>${dto.getStudy_cont() }</textarea>
	         </td>
	      </tr>
	      
	      <tr>
	      	<td colspan="2">
	      	  <c:if test="${!empty dto.getStudy_file() }">
	      		<img src="<%=request.getContextPath() %>/upload/${dto.getStudy_file() }" width="150" height="150">
	      	 </td>
	           </c:if>
	           
	           <c:if test="${empty dto.getStudy_file() }">
               <td></td>
            </c:if>
	      </tr>
	      
	      <tr>
	      	<th>작성일자</th>
	      	<td> ${dto.getStudy_date() }</td>
	      </tr>
	      
	      <tr>
	      	<th>모집인원</th>
	      	<td> ${dto.getStudy_people() }</td>
	      </tr>
	      
	     
	      <tr>
	      	<th>모집현황</th>
	      	<td> ${dto.getStudy_status() }</td>
	      </tr>
	      
	      <tr>
	      	<th>모집 시작일자</th>
	      	<td> ${dto.getStudy_start() }</td>
	      </tr>
	      
	      <tr>
	      	<th>모집 종료일자</th>
	      	<td> ${dto.getStudy_end() }</td>
	      </tr>
	      
	      <tr>
	      	<th>조회수</th>
	      	<td> ${dto.getStudy_hit() }</td>
	      </tr>
	      
	       <c:if test="${empty dto }">
	         <tr>
	            <td colspan="2" align="center">
	               <h3>조회된 게시물이 없습니다.....</h3>
	            </td>
	         </tr>
	      </c:if>
	      
	      
	       <tr>
	         <td colspan="2" align="center">         
	            <input type="button" value="글수정"
	               onclick="location.href='studyboard_modify.do?no=${dto.getStudy_num() }'">
	         
	            <input type="button" value="글삭제"
	               onclick="location.href='studyboard_remove.do?no=${dto.getStudy_num() }'">
	               
	            <input type="button" value="전체목록"
	               onclick="location.href='study_list.do'">
	         </td>
	      </tr>
	   </table>
	   
	    <br>
	   
	   <hr width="50%" color="tomato">
	   
	   <br>
	   
	   <%-- 댓글 폼 영역  --%>
	   
	   <div>
	   
	   	<table  cellsapcing="0" width="400">
	   		<tr>
	   			<th>작성자</th>
	            <td>
	               <input type="text" name="re_writer"
	                    id="re_writer">
	            </td>
	   	    </tr>
	   	    
	   	    <tr>
	            <th>내 용</th>
	            <td>
	               <input type="text" name="re_content"
	                    id="re_content" size="40">
	            </td>
	         </tr>
	         
	           <tr>
	            <td colspan="2" align="right">
	               <input type="button" id="replyBtn" 
	                   value="댓글작성">
	            </td>
	         </tr>
	   	</table>
	 </div>
	 
	 <br>
	 
	  <h3>댓글 목록</h3>
	   <div>
	      <table class="list" cellspacing="0" width="400">
	         <tr class="line">
	      	    <td colspan="2">작성자</td>
	         </tr>
	         
	         <tr class="line">
	            <td>댓글내용</td> <td>작성일자</td>
	         </tr>
	     </table>
	  </div>
    </div>
    
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
			url : "/SemiProject/study/studyboard_reply.jsp",
			data : {scomment_num : ${dto.study_num } },
			datatype : "xml",    // 결과 데이터 타입
			success : function(data) {
				// 테이블 태그의 타이틀태그를 제외한 
				// 댓글 목록을 지우는 명령어.
				$(".list tr:gt(1)").remove();
				
				let table = "";
				
				$(data).find("reply").each(function() {
					table += "<tr>";
					table += "<td colspan='2'>" + $(this).find("rewriter").text() +"</td>";
					table += "</tr>";
					
					table += "<tr>";
					table += "<td>" + $(this).find("recont").text() + "</td>";
					table += "<td>" + $(this).find("redate").text() + "</td>";
					table += "</tr>";
					
					table += "<tr>";
					table += "<td colspan='2'>&nbsp;</td>";
					table += "</tr>";
				});
				
				$(".list tr:eq(1)").after(table);
			},
			
			
			error : function() {
				alert('데이터 통신 에러');
			}
		
		});
	}  // getList() 함수 end
	
	
	// 댓글 작성 버튼을 클릭했을 때 DB에 추가로 저장.
	$("#replyBtn").on("click", function() {
		
		$.ajax({
			url : "/SemiProject/studyboard_reply_insert.do",
			datatype : "text",
			data : {
					writer : $("#re_writer").val(),
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
	
	
	getList();  // 전체 리스트 함수 호출
	
});





</script>
    
    
    

</body>
</html>