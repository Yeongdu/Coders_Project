<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div align="center">
		<c:set var="dto" value="${Modify }" />
		<hr width="50%" color="red">
			<h3>${dto.getStudy_writer() }님의 게시글 수정폼</h3>
		<hr width="50%" color="red">
		
		
		<form method="post" enctype="multipart/form-data" action="<%=request.getContextPath() %>/studyboard_modify_ok.do">
		
		<input type="hidden" name="studyboard_no" value="${dto.getStudy_num() }">
		
		<table border="1" cellspacing="0" width="400">
		
			<tr>
				<th>작성자</th>
				<td>
					<input name="studyboard_writer" readonly value="${dto.getStudy_writer() }">
				</td>
			
			</tr>
			
			<tr>
				<th>글제목</th>
				<td>
					<input name="studyboard_title" value="${dto.getStudy_title() }">
				</td>
			
			</tr>
			
			
			<tr>
				<th>글 내용</th>
				<td>
					<textarea rows="7" cols="25" name="studyboard_cont">${dto.getStudy_cont() }</textarea>
				</td>
			</tr>
			
			<tr>
				<th>파일첨부</th>
				<td>
					<input type="file" name="studyboard_file">
				</td>
			
			</tr>
			
			
			
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="글수정">&nbsp;&nbsp;&nbsp;
					<input type="reset" value="다시작성">
				</td>
			</tr>
		
		
		</table>
		
		
		</form>
		
		
	
	</div>
</body>
</html>