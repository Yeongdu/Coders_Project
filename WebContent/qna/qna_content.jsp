<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@taglib prefix="c"  uri ="http://java.sun.com/jsp/jstl/core"%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link
  rel="stylesheet"
  href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/11.5.0/styles/github-dark-dimmed.min.css"/>
<script src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/11.5.0/highlight.min.js"></script>
<script>
  hljs.highlightAll();
</script>

</head>
<body>
	
	<div align="center">
		<c:set var="dto" value="${Cont }"/>
		
	<h3> ${dto.qna_writer } 님의 게시글입니다. </h3>
	
	<table border ="1" cellspacing = "0" width = "800">
		
		
		<tr>
			<th>작성자</th>
			<td> ${dto.qna_writer }</td>
		</tr>	
		
		<tr>
			<th>글 제목</th>
			<td> ${dto.qna_title }</td>
		</tr>
		
		<tr>
			<th>코드 내용</th>
			<c:if test="${empty dto.qna_code }">
				<td></td>
			</c:if>
			<c:if test="${!empty dto.qna_code }">
				<td>
					<pre><code class="${dto.qna_tag }"><textarea rows="7" cols="35" readonly>${dto.qna_code }</textarea>
					</code></pre>
				</td>
			</c:if>
			
		</tr>
		
		<tr>
			<th>글 내용</th>
			<td>
				<textarea rows="7" cols="35" readonly>${dto.qna_cont }</textarea>
			</td>
		</tr>
		
		<tr>
			<c:if test="${empty dto.qna_update }">
				<th>작성일자</th>
				<td> ${dto.qna_date }</td>	
			</c:if>
			
			<c:if test="${!empty dto.qna_update }">
				<th>수정일자</th>
				<td> ${dto.qna_update }</td>	
			</c:if>
		</tr> 
		
		<tr>
			<th>조회수</th>
			<td> ${dto.qna_hit }</td>	
		</tr>
		
		
		<tr>
			<th> 첨부 파일 </th>
				<c:if test="${!empty dto.qna_file }">
				<td> 
					<a href = "<%= request.getContextPath()%>/upload/${dto.getQna_file() }"
					target = "_blank"> ${dto.qna_file }</a>
				
				 </td>
				</c:if>
				
				<c:if test="${empty dto.qna_file }">
				<td> </td>
				</c:if>
		</tr>
		
		
		<tr>
			<th>태그</th>
			<td> ${dto.qna_tag }</td>	
		</tr>
		
		<tr>
			<td colspan ="2" align = "center">
				<input type = "button" value="글 수정"
					onclick = "location.href='qna_modify.do?no=${dto.qna_num}'">
					
				<input type = "button" value="글 삭제"
					onclick = "location.href='qna_delete.do?no=${dto.qna_num}'">
					
				<input type = "button" value="전체 목록"
					onclick = "location.href='qna_list.do'">
			</td>
		</tr>
	
	</table>
	
	<br>
	<br>
	
	
	<!-- 댓글 폼 영역 -->
	<div> 
		<table cellspacing ="0" width = "600">
			<tr>
				<th> 작성자 </th>
				<td> 
					<input type = "text" name = "co_writer" id ="co_writer">
				 </td>
			</tr>
			
			<tr>
				<th> 내 용 </th>
				<td> 
					<textarea rows="7" cols="35" name = "co_content" id ="co_content"></textarea>
				 </td>
			</tr>
			
			<tr>
			<th> 첨부 파일 </th>
				<td>
					<input type = "file" name = "co_file" id ="co_file">
				</td>
			</tr>
			
				
			<tr>
				<td colspan ="2" align="right">
					<input type="button" id="commentBtn" value="댓글 작성">
				</td>
			</tr>
			

		</table>
	</div> 
	<!-- 댓글폼 end -->
	
	
	<h3>댓글 목록</h3>
		
	<div>
		<table class ="list" cellspacing ="0" width = "400" >
		
			<tr class = "line">
				<td colspan ="3"> 작성자</td>
			</tr>
		
			<tr class = "line">
				<td> 댓글 내용</td> <td> 작성 일자</td> <td>첨부 파일</td>
			</tr>
		
		</table>

	</div>
	
	</div>
	<!-- 전체 div end -->	
	
	
	<script type="text/javascript">
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
				url : "/Project/qna/qna_comment.jsp",
				data : { qcomment_num : ${dto.qna_num } },
				datatype : "xml",    // 결과 데이터 타입
				success : function(data) {
					// 테이블 태그의 타이틀태그를 제외한 댓글 목록을 지우는 명령어.
					$(".list tr:gt(1)").remove();
					
					let table = "";
					
					$(data).find("comment").each(function() {
						table += "<tr>";
						table += "<td colspan='2'>" + $(this).find("qcomment_writer").text() +"</td>";
						table += "</tr>";
						
						table += "<tr>";
						table += "<td>" + $(this).find("qcomment_cont").text() + "</td>";
						table += "<td>" + $(this).find("qcomment_date").text() + "</td>";
						table += "<td>" + $(this).find("qcomment_file").text() + "</td>";
						table += "<td>" + $(this).find("qcomment_num").text() + "</td>";
						table += "</tr>";
						
						table += "<tr>";
						table += "<td colspan='2'>&nbsp;</td>";
						table += "</tr>";
					});
					
					$(".list tr:eq(1)").after(table);
				},
				
				error : function() {
					alert('데이터 통신 에러 발생');
				}
			});
		}  // getList() 함수 end
		
		
		
		// 댓글 작성 버튼을 클릭했을 때 DB에 추가로 저장.
		$("#commentBtn").on("click", function() {
			
			$.ajax({
				url : "/Project/qna_comment_insert_ok.do",
				datatype : "text",
				data : {
						qcomment_num : ${dto.qna_num },
						qcomment_writer : $("#co_writer").val(),
						qcomment_cont : $("#co_content").val(),
						qcomment_file : $("#co_file").val()
						},
				success : function(data) {
						if(data > 0) {
							alert('댓글이 등록되었습니다.');
						
							// 댓글 작성 후 다시 전체 댓글 리스트를 화면에 출력.
							getList();
							
							// input 태그에 입력된 내용을 지워줌.
							$("input[type=text]").each(function() {
								$(this).val("");  // 입력된 값 지우기
							});
						
						}else {
							alert('댓글 등록에 실패했습니다.');
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