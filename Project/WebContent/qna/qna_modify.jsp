<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
<div align="center">

	<form method="post" enctype="multipart/form-data" 
		action="<%= request.getContextPath()%>/qna_modify_ok.do">
		
		<c:set var="dto" value="${qnaCont }"></c:set>
		
		<hr width = 65% >
			<h2> ${dto.qna_writer }님의 게시글 수정 폼페이지입니다. </h2>
		<hr width = 65% >
		
		<input type="hidden" name = "qna_num" value = "${dto.qna_num }">
		
		<table border = "1" cellspacing = "0" width = "500">
		
			<tr>
				<th> 작성자  </th>
				<td> <input name="qna_writer" type="text" value= "${dto.qna_writer } " readonly> </td>
			</tr>
			
			<tr>
				<th> 글 제목  </th>
				<td> <input name="qna_title" type="text" value= "${dto.qna_title }"></td>
			</tr>
			
			<tr>
				<th> 작성 내용  </th>
				<td>
					<textarea rows="7" cols="35" name="qna_content">${dto.qna_cont }</textarea>
				</td>
			</tr>
			
			<tr>
				<th>첨부 파일</th>
				<td> <img src = "<%= request.getContextPath()%>/upload/${dto.qna_file }"
						width = "100" height = "80"> 
					  <input type = "file" name = "qna_file_new">	
					  	
					  <input type = "hidden" name = "qna_file_old" value = "${dto.qna_file }">	
				</td>
			</tr>
			
			<tr>
				<th> 태그 선택 </th>
			<td>
				<select name = "qna_code" id = "qna_code">
                        <option value = "NONE" 
                        	<c:if test="${dto.qna_tag == 'none' }"> selected </c:if>>::: 언어 선택 :::</option>
                        	
                        <option value = "JAVA"
                        	<c:if test="${dto.qna_tag == 'JAVA' }"> selected </c:if>>JAVA</option>
                        
                        <option value = "PYTHON"
                        	<c:if test="${dto.qna_tag == 'PYTHON' }"> selected </c:if>>PYTHON</option>
                        
                        <option value = "HTML"
                        	<c:if test="${dto.qna_tag == 'HTML' }"> selected </c:if>>HTML</option>
                        
                        <option value = "CSS"
                        	<c:if test="${dto.qna_tag == 'CSS' }"> selected </c:if>>CSS</option>
                        
                        <option value = "JAVASCRIPT"
                        	<c:if test="${dto.qna_tag == 'JAVASCRIPT' }"> selected </c:if>>JAVASCRIPT</option>
                        
                        <option value = "JSP"
                        	<c:if test="${dto.qna_tag == 'JSP' }"> selected </c:if>>JSP</option>
                        
                        <option value = "JQUERY"
                        	<c:if test="${dto.qna_tag == 'JQUERY' }"> selected </c:if>>JQUERY</option>
                        
                        <option value = "DATABASE"
                        	<c:if test="${dto.qna_tag == 'DATABASE' }"> selected </c:if>>DATABASE</option>
                        
                        <option value = "ETC"
                        	<c:if test="${dto.qna_tag == 'ETC' }"> selected </c:if>>ETC</option>
                        
            	</select>
            </td>
			</tr>
			
			<tr>
				<td colspan="2" align= "center">
					<input type="submit" value="게시글 수정"> &nbsp;&nbsp;
					<input type="reset" value="다시 작성">
				</td>
			</tr>
		
		
		</table>
		
	</form>
	
</div>

</body>
</html>