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
		<c:set var="dto" value="${Cont }" />
		<hr width="50%">
		<h3> ${dto.getStudy_writer() }님 게시글</h3>
		<hr width="50%">
		<br>
		
		<table  cellspacing="0" width="400">
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
	      
	      
	      
	      
	      
	      
	      
	      
	      
	      
	      </table>
		
		
		
		
	
	
	</div>

</body>
</html>