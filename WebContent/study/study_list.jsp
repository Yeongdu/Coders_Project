<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="list" value="${studyBoardList }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공부 게시판 전체 리스트</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

<style type="text/css">

.study_view_aTag{
  text-decoration: none;
  line-height: 48px;
  color: gray;
}

#studyListContainer {
  display: flex;
  width: 50em;
  padding-top: 10px;
  padding-bottom: 10px;
  margin: auto;
}

.study_view_left {
  flex: 1;
}

.study_view_left2{
  display: table-cell;
  vertical-align: middle;
  text-align: right;
}

.study_view_center {
  align-items: center;
  flex: 3;
  text-align: left;
  font-size: 1.2em;
}
.study_view_right {
  flex: 1;
  text-align: right;
}
.studyViewDate{
font-size: 0.8em;
}
.studyViewWriter{
font-size: 1.1em;
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

<div align="center">
<h1>STUDY 할 사람 모여라</h1>


		<input type="hidden" value="${userId }" name="study_writer">

			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">


				<div id="studyListContainer" class="border-top border-bottom">
					<div class="study_view_left">
						<div>${dto.getStudy_hit() }</div>
						<div>${dto.getStudy_hit() }</div>
					</div>
					
					<div class="study_view_left2" class="align-middle">
						<button type="button" class="btn btn-outline-primary" style="height: 48px;">모집중</button>					
					</div>

					<div class="study_view_center">
						<a class="study_view_aTag" href="<%=request.getContextPath()%>/studyBoard_content.do?no=${dto.study_num }"
							style="display: block;"> &nbsp;${dto.getStudy_title() }</a>
							<!-- a태그에 style="display: block;" 하면 제목있는 부분 전체가 링크가 된다 -->
					</div>
					
					<div class="study_view_right">
					<div class="studyViewWriter">${dto.getStudy_writer() }</div>
					<div class="studyViewDate">${dto.getStudy_date() }</div>
					</div>

				</div>   <!-- id="container" end -->

				</c:forEach>
				
				<br>
			</c:if>

			<c:if test="${empty list }">
				<h3>게시글이 없음</h3>
			</c:if>
			  
                <div class="col-12 text-right">
                <a href="<%=request.getContextPath()%>/studyBoard_insert.do" class="btn btn-success"><i class="fa fa-pencil mr-1"></i> 새 글쓰기</a>
                </div>
            
	</div>
	
	<jsp:include page="../include/bottom.jsp" />
	
<script src="https://kit.fontawesome.com/7703fd875c.js" crossorigin="anonymous"></script>
</body>
</html>