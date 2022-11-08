<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Calendar"%>


<%
	String Date = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
String Today = new java.text.SimpleDateFormat("yyyyMMdd").format(new java.util.Date());
%>



<c:set var="list" value="${List }" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공부 게시판 전체 리스트</title>


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous"></script>
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
	--bs-btn-border-color: #2b59c6;
	--bs-btn-color: #2b59c6;

	--bs-btn-hover-color: white;
	--bs-btn-hover-bg: #2b59c6;
	--bs-btn-hover-border-color: #2b59c6;
}

.active>.page-link, .page-link.active{
--bs-pagination-active-bg:#2b59c6;
--bs-pagination-active-border-color:#2b59c6;
}

.page-link{
--bs-pagination-color : #2b59c6;
}

.pagination{
--bs-pagination-color: #2b59c6;
--bs-pagination-focus-box-shadow: 0 0 0 0.08rem rgba(13, 110, 253, 0.25);
}

#studyListContainer_top:hover {
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
	border-bottom: 7px solid #e8e8e8;
	padding: 0.2em 0 0 0.2em;
	color: gray;
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
	border-color: #dc3545;
	font-weight: bold;
	border-bottom: 7px solid #DC3545;
	padding: 0.2em 0 0 0.2em;
	color: #DC3545;
}

.study_view_aTag {
	width: 560px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

#studybanner {
	border-radius: 20px;
}

#main_top {
	margin-top: 50px;
	margin: auto;
	position: relative;
}

.bannerText {
	position: absolute;
	top: 23%;
	left: 15%;
	transform: translate(-50%, -50%);
	font-size: 1.5em;
	font-family: 'Noto Sans KR';
}

.bannerText2 {
	position: absolute;
	top: 36%;
	left: 25%;
	transform: translate(-50%, -50%);
	font-size: 1.5em;
	font-family: 'Noto Sans KR';
	color: gray;
	font-family: 'Noto Sans KR';
}

#studyWrite_btn {
	background-color: #2b59c6;
	border: #2b59c6;
	height: 37px;
}

#studyWrite_btn:hover {
	color: #2b59c6;
	border: 1px solid #2b59c6;
	background-color: white;
	border-radius: 5px;
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

	<%-- 메인 배너 --%>
	<div align="center" id="main_top" style="width: 800px; height: 200px;">
		<img src="upload/studyBanner.png" id="studybanner"
			style="width: 100%; height: 100%;"> <span class="bannerText">커뮤니티</span>
		<p class="bannerText2" style="font-size: 1em;">당신과 함께할 팀원을 찾아보세요</p>
	</div>



	<div align="center">
		<br>
		<div class="study_search_right" class="col-12 text-right"></div>
		<%-- 글쓰기 / 검색 / 정렬 창 --%>
		<div style="width: 750px; display: flex; margin-left: 5px; margin-right: 5px;">
			<button id="studyWrite_btn" class="btn btn-success">
				<i class="fa fa-pencil mr-1"></i> 새 글쓰기
			</button>

			<%-- 검색 기능 처리 --%>
			<div class="studySearchWrite" style="margin: auto;">
				<form name="search_form" method="post" action="<%=request.getContextPath()%>/study_search.do">
					<span class="study_search_left" style="width: 28em"> 
					<span class="col-lg"> 
					<span class="input-group list-search-form w-70"> 
<!-- 							<select -->
<!-- 								name="search_field" class="custom-select col-sm-4" style = "width:8em;"> -->
<!-- 									<option value="all">통합</option> -->
<!-- 									<option value="title">제목</option> -->
<!-- 									<option value="cont">내용</option> -->
<!-- 									<option value="title_cont">제목+내용</option> -->
<!-- 									<option value="writer">작성자</option> -->
<!-- 							</select> -->
							<input type="text" name="search_keyword" value="" class="form-control" style = "width:20em;"/>
								<button type="submit" class="btn btn-secondary ml-1">
									<i class="fa fa-search"></i> 검색
								</button>
						</span>
					</span>
					</span>
				</form>
				<%-- 검색 기능 처리 end--%>

				&nbsp;&nbsp;

			</div>
			<%-- class="studySearchWrite" end--%>

			<button class="btn btn-outline-primary"
				onclick="location.href='<%=request.getContextPath()%>/study_status_view.do'">
				<i class="fa fa-search"></i> 모집중인 글
			</button>
		</div>
		<%-- 글쓰기 /검색 / 정렬 기능 창 end --%>

		<hr style="width: 50em; margin: 30px auto 10px;">

		<input type="hidden" value="${userId }" name="study_writer">

		<c:if test="${!empty list }">
			<c:forEach items="${list }" var="dto">
				<%-- 게시판 리스트 --%>
				<div id="studyListContainer_top" class="border-bottom"
					align="center" style="width: 50em; height: 7.6em;">
					<br>
					<div class="study_view_top" align="left"
						style="margin-left: 5px; color: gray; font-size: 0.7em;">
						<div>
							<i class="fa-regular fa-user"></i> &nbsp;${dto.getStudy_writer() }
							&nbsp;&nbsp; <i class="fa-regular fa-eye"></i>
							&nbsp;${dto.getStudy_hit() } &nbsp;&nbsp; <i
								class="fa-regular fa-pen-to-square"></i>
							&nbsp;${dto.getStudy_reply() }
						</div>
					</div>

					<div id="studyListContainer">

						<div class="study_view_center">
							<a class="study_view_aTag"
								href="<%=request.getContextPath()%>/studyBoard_content.do?no=${dto.study_num }"
								style="display: block;"> <c:if
									test="${dto.study_status eq '모집중' }">
									<button type="button" class="btn btn-primary">${dto.study_status }</button>
								</c:if> <c:if test="${dto.study_status eq '모집완료' }">
									<button type="button" class="btn btn-outline-secondary"
										disabled>${dto.study_status }</button>
								</c:if> <c:if test="${dto.study_status eq '모집중' }">
							&nbsp;<span style="font-size: 1.2em; color: black;">${dto.getStudy_title() }</span>
								</c:if> <c:if test="${dto.study_status eq '모집완료' }">
							&nbsp;<span style="font-size: 1.2em; color: gray;">${dto.getStudy_title() }</span>
								</c:if>

							</a>
						</div>



						<div class="study_view_right">

							<%-- 디데이 기능 --%>
							<c:set value="<%=Date%>" var="today" />
							<fmt:parseDate var="endDate_D"
								value="${dto.study_end.substring(0, 10)}" pattern="yyyy-MM-dd" />
							<fmt:parseNumber var="endTime_N"
								value="${endDate_D.time / (1000*60*60*24)}" integerOnly="true" />

							<fmt:parseDate var="stDate_D" value="${today}"
								pattern="yyyy-MM-dd" />
							<fmt:parseNumber var="stTime_N"
								value="${stDate_D.time / (1000*60*60*24)}" integerOnly="true" />


							<c:if test="${!empty endDate_D}">

								<c:if test="${endTime_N - stTime_N gt 0}">
									<c:if test="${dto.study_status eq '모집완료' }">
										<span class="studyEndTxt">마 감</span>
									</c:if>
									<c:if test="${dto.study_status eq '모집중' }">
										<span class="studyIngTxt">D - ${endTime_N - stTime_N}</span>
									</c:if>
								</c:if>

								<c:if test="${endTime_N - stTime_N eq 0}">
									<c:if test="${dto.study_status eq '모집완료' }">
										<span class="studyEndTxt">마 감</span>
									</c:if>
									<c:if test="${dto.study_status eq '모집중' }">
										<span class="studyTodayEnd" id="StudylistBtn">D - DAY</span>
									</c:if>
								</c:if>

								<c:if test="${endTime_N - stTime_N lt 0}">
									<span class="studyEndTxt">마 감</span>
								</c:if>

							</c:if>

							<c:if test="${empty endDate_D}">
								<span> </span>
							</c:if>
							<%-- 디데이 기능 end --%>

							<button type="button" class="btn btn-outline-dark" disabled>
								<i class="fa-solid fa-person"></i> ${dto.study_people }
							</button>

						</div>
					</div>
					<!-- id="studyListContainer" end -->
					<div>
						<span> </span>
					</div>
				</div>
				<%-- 게시판 리스트 end --%>

			</c:forEach>

			<br>
		</c:if>

		<c:if test="${empty list }">
			<h3>게시글이 없음</h3>
		</c:if>


		<%-- BootStrap을 이용한 페이징 처리 영역 --%>
		<nav>
			<ul class="pagination">
				<li class="page-item"><a class="page-link"
					href="studyBoard_list.do?page=1">First</a></li>
				<c:choose>
					<c:when test="${ (page - 1) == 0}">
						<li><a class="page-link" href="studyBoard_list.do?page=1">Previous</a></li>
					</c:when>
					<c:otherwise>
						<li><a class="page-link"
							href="studyBoard_list.do?page=${ page - 1 }">Previous</a></li>
					</c:otherwise>
				</c:choose>
				<c:forEach begin="${ startBlock }" end="${ endBlock }" var="i">
					<c:if test="${ i==page }">
						<li class="page-item active" aria-current="page"><a
							class="page-link" href="studyBoard_list.do?page=${i }">${i }</a></li>
					</c:if>
					<c:if test="${ i!=page }">
						<li class="page-item"><a class="page-link"
							href="studyBoard_list.do?page=${i }">${i }</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${ page < allPage }">
					<li class="page-item"><a class="page-link"
						href="studyBoard_list.do?page=${ page + 1 }">Next</a></li>
					<li class="page-item"><a class="page-link"
						href="studyBoard_list.do?page=${ allPage }">End</a></li>
				</c:if>
			</ul>
		</nav>
		<%-- BootStrap을 이용한 페이징 처리 영역 끝 --%>


		<br>


	</div>
	<br />

	<jsp:include page="../include/bottom.jsp" />
	<script type="text/javascript">
$(function() {
	$("#studyWrite_btn").click(function(){
        if(${empty userId}) {
            alert('로그인한 이용자만 이용할 수 있습니다.');
            location.href = '<%=request.getContextPath()%>/user_login.do';
        }else {
            location.href = '<%=request.getContextPath()%>/studyBoard_insert.do';
        }
    });
	
});
</script>
	<script src="https://kit.fontawesome.com/7703fd875c.js"
		crossorigin="anonymous"></script>
</body>
</html>