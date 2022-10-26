<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="list" value="${List }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공부 게시판 검색 리스트</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>

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
.pagination{
justify-content: center;
}
.input-group:not(.has-validation)>.dropdown-toggle:nth-last-child(n+3), .input-group:not(.has-validation)>.form-floating:not(:last-child)>.form-control, .input-group:not(.has-validation)>.form-floating:not(:last-child)>.form-select, .input-group:not(.has-validation)>:not(:last-child):not(.dropdown-toggle):not(.dropdown-menu):not(.form-floating) {
border-start-start-radius: 7px;
border-end-start-radius: 7px;
}
.studySearchWrite{
display: flex;
margin: auto;
justify-content: center;
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
<h1>STUDY 게시판 검색</h1>
<br />


		<input type="hidden" value="${userId }" name="study_writer">

			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">


				<div id="studyListContainer" class="border-bottom">
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

				</div>   <!-- id="studyListContainer" end -->

				</c:forEach>
				
				<br>
			</c:if>

			<c:if test="${empty list }">
				<h3>검색 결과가 없음</h3>
			</c:if>
			
			
		<%-- BootStrap을 이용한 페이징 처리 영역 --%>
		<nav>
          <ul class="pagination">
            <li class="page-item">
              <a class="page-link" href="studyBoard_list.do?page=1">First</a></li>
            <c:choose>
                <c:when test="${ (page - 1) == 0}">
                    <li><a class="page-link" href="studyBoard_list.do?page=1">Previous</a></li>
                </c:when>
                <c:otherwise>
                    <li><a class="page-link" href="studyBoard_list.do?page=${ page - 1 }">Previous</a></li>
                </c:otherwise>
            </c:choose>
            <c:forEach begin="${ startBlock }" end="${ endBlock }" var="i">
                <c:if test="${ i==page }">
                    <li class="page-item active" aria-current="page">
                    <a class="page-link" href="studyBoard_list.do?page=${i }">${i }</a></li>
                </c:if>
                <c:if test="${ i!=page }">
                    <li class="page-item">
                    <a class="page-link" href="studyBoard_list.do?page=${i }">${i }</a></li>
                </c:if>
            </c:forEach>
           <c:if test="${ page < allPage }">
                <li class="page-item">
                <a class="page-link" href="studyBoard_list.do?page=${ page + 1 }">Next</a>
                </li>
                <li class="page-item">
                <a class="page-link" href="studyBoard_list.do?page=${ allPage }">End</a>
                </li>
            </c:if>
          </ul>
        </nav>
		<%-- BootStrap을 이용한 페이징 처리 영역 끝 --%>
		
		
		<br>
		<%-- 검색 기능 처리 --%>
		<div class="studySearchWrite">
			<form name="search_form" method="post"
				action="<%=request.getContextPath()%>/study_search.do">
				<span class="study_search_left" style="width: 28em"> <span
					class="col-lg"> <span
						class="input-group list-search-form w-70"> <select
							name="search_field" class="custom-select col-sm-4">
								<option value="title">제목</option>
								<option value="cont">내용</option>
								<option value="title_cont">제목+내용</option>
								<option value="writer">작성자</option>
						</select> <input type="text" name="search_keyword" value=""
							class="form-control" />
							<button type="submit" class="btn btn-secondary ml-1">
								<i class="fa fa-search"></i> 검색
							</button>
					</span>
				</span>
				</span>
			</form>
			<%-- 검색 기능 처리 end--%>
			
			
			&nbsp;&nbsp;
			<div class="study_search_right" class="col-12 text-right">
				<button id="studyWrite_btn" class="btn btn-success">
					<i class="fa fa-pencil mr-1"></i> 새 글쓰기
				</button>
			</div>
		</div>
		<%-- class="studySearchWrite" end--%>
			
<jsp:include page="../include/bottom.jsp" />
<script type="text/javascript">
	$("#studyWrite_btn").click(function(){
		if(${empty userId}) {
			alert('로그인한 이용자만 이용할 수 있습니다.');
		}else {
			location.href = '<%=request.getContextPath()%>/studyBoard_insert.do';
		}
	});
	
	function nonSearch(){
        if(${empty list }){
            $('.pagination').hide();
            }
        };
        nonSearch();
        
</script>
<script src="https://kit.fontawesome.com/7703fd875c.js" crossorigin="anonymous"></script>
<script type="text/javascript">
</body>
</html>