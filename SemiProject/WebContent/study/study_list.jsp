<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="list" value="${studyBoardList }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div align="center">
		<table class="table table-bordered table-hover">
			<tr>
				<th style="width: 10%;">번호</th>
				<th style="width: 20%;">작성자</th>
				<th style="width: 20%;">제목</th>
				<th style="width: 30%;">내용</th>
				<th style="width: 20%;">작성일</th>
			</tr>
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
					<tr class="align-middle">
						<td>${dto.getStudy_num() }</td>
						<td>${dto.getStudy_writer() }</td>
						<td>
							<a href="<%=request.getContextPath() %>/studyBoard_content.do?no=${dto.getStudy_num() }">
						${dto.getStudy_title() }</a></td>
						<td>${dto.getStudy_cont() }</td>
						<td>${dto.getStudy_date() }</td>
					</tr>
				</c:forEach>
			</c:if>

			<c:if test="${empty list }">
				<tr>
					<td colspan="4" align="left">
						<h3>게시글이 없음</h3>
					</td>
				</tr>

			</c:if>
		</table>



	</div>

</body>
</html>