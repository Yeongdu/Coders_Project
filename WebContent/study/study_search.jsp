<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import = "java.util.Calendar" %>


<%
  String Date = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
  String Today = new java.text.SimpleDateFormat("yyyyMMdd").format(new java.util.Date());
%>
<c:set var="list" value="${List }" />
<c:set var="keyword" value="${keyword }"/>
<c:set var="field" value="${field }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공부 게시판 검색 리스트</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>

<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap')
	;

body {
	font-family: 'Noto Sans KR' !important;
}

.study_view_aTag {
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
	align-items: center;
}

.study_view_left {
	flex: 1;
	text-align-last: left;
	flex-grow: 1;
	padding-left: 15px;
}

.study_view_center {
	flex: 3;
	flex-grow: 7;
	text-align: left;
	font-size: 1em;
	align-items: center;
}

.study_view_right {
	flex: 1;
	text-align: right;
	flex-grow: 2;
	display: flex;
	align-items: center;
	justify-content: flex-end;
}

.studyViewDate {
	font-size: 0.8em;
}

.studyViewWriter {
	font-size: 1.1em;
}

.pagination {
	justify-content: center;
}

.input-group:not(.has-validation)>.dropdown-toggle:nth-last-child(n+3),
	.input-group:not(.has-validation)>.form-floating:not(:last-child)>.form-control,
	.input-group:not(.has-validation)>.form-floating:not(:last-child)>.form-select,
	.input-group:not(.has-validation)>:not(:last-child):not(.dropdown-toggle):not(.dropdown-menu):not(.form-floating)
	{
	border-start-start-radius: 7px;
	border-end-start-radius: 7px;
}

.studySearchWrite {
	display: flex;
	margin: auto;
	justify-content: center;
}

.btn.btn-outline-primary {
	height: 37px;
	padding-top: 0px;
	padding-bottom: 0px;
}

#studyListContainer:hover {
	background-color: #f7f7f7;
}

button.btn.btn-outline-dark {
	border-color: #ffffff00;
	width: 70px;
	padding-right: 20px;
	font-weight: bold;
}

.studyEndTxt {
	font-weight: bold;
}

.studyIngTxt {
	border-bottom: 7px solid #dcf1fb;
	padding: 0.2em 0 0 0.2em;
	font-weight: bold;
}

.btn.btn-outline-secondary {
	width: 86px;
	padding-left: 5px;
	padding-right: 5px;
}

.btn.btn-primary {
	width: 86px;
	padding-left: 5px;
	padding-right: 5px;
	background-color: DarkCyan;
	padding-bottom: 7px;
	border: 0px;
}

#StudylistBtn {
	padding-left: 6px;
	padding-right: 6px;
	color: #dc3545;
	border-color: #dc3545;
	font-weight: bold;
}

.study_view_aTag {
	width: 560px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
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
<br />
<div align="center">


<h3>"${keyword }" 검색결과</h3>
<br />


		<input type="hidden" value="${userId }" name="study_writer">

			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">


				<div id="studyListContainer" class="border-bottom">
					<div class="study_view_left">
						<div><i class="fa-regular fa-eye"></i> &nbsp;${dto.getStudy_hit() }</div>
						<div><i class="fa-regular fa-pen-to-square"></i> &nbsp;${dto.getStudy_reply() }</div>
					</div>

					<div class="study_view_center"  class="align-middle"><a class="study_view_aTag" href="<%=request.getContextPath()%>/studyBoard_content.do?no=${dto.study_num }"
							style="display: block;">
							
							
						<c:if test="${dto.study_status eq '모집중' }">
							<button type="button" class="btn btn-primary">${dto.study_status }</button>
						</c:if>
						
						<c:if test="${dto.study_status eq '모집완료' }">
							<button type="button" class="btn btn-outline-secondary" disabled>${dto.study_status }</button>
						</c:if>
							

							&nbsp;<span class="studyTitle">${dto.getStudy_title() }</span>
							
					</a></div>
					

					
					<div class="study_view_right">
				
					<%-- 디데이 기능 --%>
					<c:set value="<%=Date%>" var="today" />
					<fmt:parseDate var="endDate_D" value="${dto.study_end.substring(0, 10)}" pattern="yyyy-MM-dd"/>
					<fmt:parseNumber var="endTime_N" value="${endDate_D.time / (1000*60*60*24)}" integerOnly="true" />
					
					<fmt:parseDate var="stDate_D" value="${today}" pattern="yyyy-MM-dd"/>
					<fmt:parseNumber var="stTime_N" value="${stDate_D.time / (1000*60*60*24)}" integerOnly="true" />
					
					
					<c:if test= "${!empty endDate_D}">
					
						<c:if test= "${endTime_N - stTime_N gt 0}" >
							<c:if test="${dto.study_status eq '모집완료' }">
							<span class="studyEndTxt">마감</span>
							</c:if>
							<c:if test="${dto.study_status eq '모집중' }">
								<span class="studyIngTxt">D - ${endTime_N - stTime_N}</span>
							</c:if>
						</c:if>
						
						<c:if test= "${endTime_N - stTime_N eq 0}" >
							<c:if test="${dto.study_status eq '모집완료' }">
							<span class="studyEndTxt">마감</span>
							</c:if>
							<c:if test="${dto.study_status eq '모집중' }">
								<button class="btn btn-outline-primary" id="StudylistBtn" disabled>오늘마감</button>
							</c:if>
						</c:if>
						
						<c:if test= "${endTime_N - stTime_N lt 0}" >
						<span class="studyEndTxt">마감</span>
						</c:if>
						
					</c:if>
					
					<c:if test="${empty endDate_D}">
					<span> </span>
					</c:if>
					<%-- 디데이 기능 end --%>
					
						<button type="button" class="btn btn-outline-dark" disabled><i
						class="fa-solid fa-person"></i> ${dto.study_people }</button>

					</div>

				</div>   <!-- id="studyListContainer" end -->

				</c:forEach>
				
				<br>
			</c:if>

			<c:if test="${empty list }">
				<h3>게시글이 없음</h3>
			</c:if>
			
			
		<%-- BootStrap을 이용한 페이징 처리 영역 --%>
		<nav>
          <ul class="pagination">
            <li class="page-item">
              <a class="page-link" href="study_search.do?page=1&search_field=${field}&search_keyword=${keyword }">First</a></li>
            <c:choose>
                <c:when test="${ (page - 1) == 0}">
                    <li><a class="page-link" href="study_search.do?page=1&search_field=${field}&search_keyword=${keyword }">Previous</a></li>
                </c:when>
                <c:otherwise>
                    <li><a class="page-link" href="study_search.do?page=${ page - 1 }&search_field=${field}&search_keyword=${keyword }">Previous</a></li>
                </c:otherwise>
            </c:choose>
            <c:forEach begin="${ startBlock }" end="${ endBlock }" var="i">
                <c:if test="${ i==page }">
                    <li class="page-item active" aria-current="page">
                    <a class="page-link" href="study_search.do?page=${i }&search_field=${field}&search_keyword=${keyword }">${i }</a></li>
                </c:if>
                <c:if test="${ i!=page }">
                    <li class="page-item">
                    <a class="page-link" href="study_search.do?page=${i }&search_field=${field}&search_keyword=${keyword }">${i }</a></li>
                </c:if>
            </c:forEach>
           <c:if test="${ page < allPage }">
                <li class="page-item">
                <a class="page-link" href="study_search.do?page=${ page + 1 }&search_field=${field}&search_keyword=${keyword }">Next</a>
                </li>
                <li class="page-item">
                <a class="page-link" href="study_search.do?page=${ allPage }&search_field=${field}&search_keyword=${keyword }">End</a>
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
						class="input-group list-search-form w-70">
<!-- 						 <select -->
<!-- 							name="search_field" class="custom-select col-sm-4" > -->
<%-- 								<option value="all" <c:if test="${field eq 'all'}">selected</c:if>>통합</option> --%>
<%-- 								<option value="title" <c:if test="${field eq 'title'}">selected</c:if>>제목</option> --%>
<%-- 								<option value="cont" <c:if test="${field eq 'cont'}">selected</c:if>>내용</option> --%>
<%-- 								<option value="title_cont" <c:if test="${field eq 'title_cont'}">selected</c:if>>제목+내용</option> --%>
<%-- 								<option value="writer" <c:if test="${field eq 'writer'}">selected</c:if>>작성자</option> --%>
<!-- 						</select>  -->
						<input type="text" name="search_keyword" value="${keyword }"
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