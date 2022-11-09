<%@page import="java.util.StringTokenizer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문 게시판</title>
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
<link rel = "stylesheet" href = "./css/qna_list_main.css">
<script type="text/javascript">

	function goSortCode() {
		var codeName = document.getElementById("code");
		var codeValue = codeName.options[codeName.selectedIndex].value;
		
		document.frm.action = "<%=request.getContextPath() %>/qna_codesort_list.do?code=" + codeValue;
 		// frm 태그 내의 form의 action을 설정
		document.frm.submit();
	}
	
	function goSearch() {
		var search_keyword = document.getElementById("search_keyword");
		var keyword = search_keyword.value;
		
		document.frm.action = "<%=request.getContextPath() %>/qna_search.do?search_keyword=" + keyword;
 		// frm 태그 내의 form의 action을 설정
		document.frm.submit();
	}
	
</script>
<style type="text/css">
.btn.btn-primary_rank {
	font-size: 0.6em;
	width: 50px;
	padding-left: 5px;
	padding-right: 5px;
	padding-bottom: 7px;
	margin-bottom: 2px;
}

.btn.btn-outline-secondary_rank {
	font-size: 0.6em;
	width: 50px;
	padding-left: 5px;
	padding-right: 5px;
	margin-bottom: 2px;
	--bs-btn-disabled-border-color: gray;
	--bs-btn-disabled-color: gray;
}

.sideBanner {
	position: absolute;
	width: 280px;
	height: 266px;
	top: 250px;
	background-color: none;
	color: #fffffff;
	padding: 5px;
}

.sideBanner_study {
	padding: 5px;
	margin: 5px;
	border: 1px dashed gray;
}

.sideBanner_qna {
	padding: 5px;
	margin: 5px;
	border: 1px dashed gray;
}

.sideBanner a {
	text-decoration: none;
	font-size: 1em;
}

@media screen and (max-width: 1400px) {
	.sideBanner {
		display: none;
	}
}

#qna .badge2 {
	font-size: 0.6em;
	width: 50px;
	padding-left: 5px;
	padding-right: 5px;
	height: 29px;
	margin-bottom: 2px;
	--bs-badge-padding-y: 1em;
    border-radius: 5px;
    border: 0px;
	
}
</style>
</head>
<body id  = "qna">
	<c:if test="${empty userId }">
	<jsp:include page="../include/none_top.jsp" />
	</c:if>
	
	<c:if test="${!empty userId }">
	<jsp:include page="../include/user_top.jsp" />
	</c:if>
	
		<%-- 메인 배너 --%>
	<div align = "center" id = "main_top" style = "width:800px; height: 200px; ">
		<img src = "upload/qnabanner4.png" id = "qnabanner" style = "width:100%; height: 100%;">
			<span class = "bannerText">기술 Q&A</span>
			<p class = "bannerText2" style = "font-size: 1em;">지식공유 플랫폼 CODE BOARD에서 최고의 개발자들과 함께 궁금증을 해결하세요.</p>
	</div>

	<div align = "center" id = "main">
	<br>
		<div id = "search_top" style = "display:flex; width: 750px;"> <%-- 정렬 / 언어 선택 창 --%>
	                <button id="qnaWrite_btn" class="btn btn-success"><i class="fa fa-pencil mr-1"></i> 새 글쓰기</button>
					<div class="qnaSearchWrite" style="margin: auto;">
							<span class="qna_search_left"> 
							<span class="col-lg"> 
							<span class="input-group list-search-form w-70"> 
									<input type="text" id ="search_keyword" name = "search_keyword" value="" class="form-control" style = "margin-top:0; width:20em;" />
									<button type="button" class="btn btn-secondary ml-1" onclick = "goSearch()">
										<i class="fa fa-search"></i> 검색
									</button>
								</span>
							</span>
							</span>
					</div>
				
				<div class = "qna_language_sort" onchange = "goSortCode()" style = " margin:0;">
					<select class="form-select" aria-label="Default select example" name = "code" id = "code" style = "width:6em;">
					  	<option selected>언어순</option>
						<option value = "JAVA">JAVA</option>
						<option value = "HTML">HTML</option>
						<option value = "CSS">CSS</option>
						<option value = "JAVASCRIPT">JAVASCRIPT</option>
						<option value = "JSP">JSP</option>
						<option value = "JQUERY">JQUERY</option>
						<option value = "DATABASE">DATABASE</option>
						<option>ETC</option>
					</select>
				</div>
				&nbsp;&nbsp;			
				<div class="dropdown">
				  <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
				    정렬
				  </button>
				  <ul class="dropdown-menu">
				    <li><a class="dropdown-item" href="<%=request.getContextPath()%>/qna_list.do">최신순</a></li>
				    <li><a class="dropdown-item" href="<%=request.getContextPath()%>/qna_list_view.do">조회순</a></li>
				    <li><a class="dropdown-item" href="<%=request.getContextPath()%>/qna_list_comment.do">답변순</a></li>
				  </ul>
				</div>
				<br>
		</div> <%-- main_top의 end --%>
		
		<hr style="width: 50em; margin: 30px auto 10px;">
		
		<div id = "main_center"> <%-- 게시판 리스트 --%>
			<form method = "post" name = "frm" id = "frm">
			<c:set var = "list" value = "${List }" />
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
				<input type = "hidden" name = "qna_num" id = "qna_num" value = "${dto.getQna_num() }">
					<div id="container" class="border-bottom" class="border-bottom">
						<div class="qna_view_left" align="left" style="margin-left: 5px; color: gray; font-size: 0.7em;">
							<br>
							<div>
								<i class="fa-regular fa-user"></i> &nbsp;${dto.getQna_writer() }
								&nbsp;&nbsp; <i class="fa-regular fa-eye"></i>
								&nbsp;${dto.getQna_hit() } &nbsp;&nbsp; <i
									class="fa-regular fa-pen-to-square"></i>
								&nbsp;${dto.getQna_reply() }
							</div>
						</div>
						<div class="qna_view_center">
							<a href="<%=request.getContextPath()%>/qna_content.do?no=${dto.getQna_num() }"
								style="display: block; text-decoration: none;" class = "etc">
								<c:set var = "tag" value = "${dto.getQna_tag() }" />
								<c:if test="${tag == 'JAVA'}">
									<span class="badge text-bg-secondary">JAVA</span>
								</c:if>
								<c:if test="${tag == 'HTML'}">
									<span class="badge text-bg-primary">HTML</span>
								</c:if>
								<c:if test="${tag == 'JAVASCRIPT'}">
									<span class="badge text-bg-warning">JS</span>
								</c:if>
								<c:if test="${tag == 'CSS'}">
									<span class="badge text-bg-danger">CSS</span>
								</c:if>
								<c:if test="${tag == 'JQUERY'}">
									<span class="badge text-bg-success">JQUERY</span>
								</c:if>
								<c:if test="${tag == 'DATABASE'}">
									<span class="badge text-bg-info">DB</span>
								</c:if>
								<c:if test="${tag == 'JSP'}">
									<span class="badge text-bg-dark">JSP</span>
								</c:if>
								<c:if test="${tag == 'ETC'}">
									<span class="badge text-bg-light">ETC</span>
								</c:if>
								<c:if test="${tag == null}">
									<span class="badge text-bg-light">ETC</span>
								</c:if>									
								<%-- 표시할 프로그래밍 언어 다 표시하기 --%>
								&nbsp;&nbsp;&nbsp;
								<span id = "title" style = "color:black;">${dto.getQna_title() }</span></a>
						</div>
						
							<div id = "qna_view_date" align = "right">
								<c:if test="${empty dto.getQna_update() }">
									<i class="fa-regular fa-clock"></i>&nbsp;${dto.getQna_date() }
								</c:if>
								<c:if test="${!empty dto.getQna_update() }">
									<i class="fa-regular fa-clock"></i>&nbsp;${dto.getQna_update() }
								</c:if>
								
							</div>

				</div>   <!-- id="container" end -->
				</c:forEach>
			</c:if>
			</form>
				<br>
		</div> <%-- main_center의 end --%>

	<%-- BootStrap을 이용한 페이징 처리 영역 --%>
		<nav>
          <ul class="pagination">
            <li class="page-item">
              <a class="page-link" href="qna_codesort_list.do?page=1" id = "page1">First</a></li>
            <c:choose>
                <c:when test="${ (page - 1) == 0}">
                    <li><a class="page-link" href="qna_codesort_list.do?page=1" id = "page2">Previous</a></li>
                </c:when>
                <c:otherwise>
                    <li><a class="page-link" href="qna_codesort_list.do?page=${ page - 1 }" id = "page3">Previous</a></li>
                </c:otherwise>
            </c:choose>
            <c:forEach begin="${ startBlock }" end="${ endBlock }" var="i">
                <c:if test="${ i==page }">
                    <li class="page-item active" aria-current="page">
                    <a class="page-link" href="qna_codesort_list.do?page=${i }" id = "page4">${i }</a></li>
                </c:if>
                <c:if test="${ i!=page }">
                    <li class="page-item">
                    <a class="page-link" href="qna_codesort_list.do?page=${i }" id = "page5">${i }</a></li>
                </c:if>
            </c:forEach>
           <c:if test="${ page < allPage }">
                <li class="page-item">
                <a class="page-link" href="qna_codesort_list.do?page=${ page + 1 }" id = "page6">Next</a>
                </li>
                <li class="page-item">
                <a class="page-link" href="qna_codesort_list.do?page=${ allPage }" id = "page7">End</a>
                </li>
            </c:if>
          </ul>
        </nav>
		<%-- BootStrap을 이용한 페이징 처리 영역 끝 --%>
		
		
		
<%-- 인기글 배너 --%>
		<div class="sideBanner" align="left">
			<div class="sideBanner_study">
				<p align="center"
					style="margin-bottom: 5px; border-bottom: 3px double #8080804f;">STUDY
					게시판 인기글</p>
				<c:set var="rlist" value="${rList }" />
				<c:if test="${!empty rlist }">
					<c:forEach items="${rlist }" var="rdto">
						<div>

							<a class="text-truncate"
								href="<%=request.getContextPath()%>/studyBoard_content.do?no=${rdto.study_num }"
								style="display: block;"> <c:if
									test="${rdto.study_status eq '모집중' }">
									<button type="button" class="btn btn-primary_rank" disabled>${rdto.study_status }</button>
								</c:if> <c:if test="${rdto.study_status eq '모집완료' }">
									<button type="button" class="btn btn-outline-secondary_rank"
										disabled>${rdto.study_status }</button>
								</c:if> <c:if test="${rdto.study_status eq '모집중' }">
							&nbsp;<span style="font-size: 0.9em; color: black;">${rdto.getStudy_title() }</span>
								</c:if> <c:if test="${rdto.study_status eq '모집완료' }">
							&nbsp;<span style="font-size: 0.9em; color: gray;">${rdto.getStudy_title() }</span>
								</c:if>
							</a>

						</div>
					</c:forEach>
				</c:if>
				<c:if test="${empty rlist }">
					<h3>인기 게시글이 없음</h3>
				</c:if>
			</div>

			<br>

			<div class="sideBanner_qna">
				<p align="center"
					style="margin-bottom: 5px; border-bottom: 3px double #8080804f;">Q&A
					게시판 인기글</p>

				<c:set var="qrlist" value="${qrList }" />
				<c:if test="${!empty qrlist }">
					<c:forEach items="${qrlist }" var="qrdto">

						<div class="qna_Rank_view_center">
							<a class="text-truncate"
								href="<%=request.getContextPath()%>/qna_content.do?no=${qrdto.getQna_num() }"
								style="display: block; text-decoration: none; font-size: 0.9em;"
								class="etc"> <c:set var="tag" value="${qrdto.getQna_tag() }" />
								<c:if test="${tag == 'JAVA'}">
									<button type="button" class="badge2 text-bg-secondary">JAVA</button>
								</c:if> <c:if test="${tag == 'HTML'}">
									<button type="button" class="badge2 text-bg-primary">HTML</button>
								</c:if> <c:if test="${tag == 'JAVASCRIPT'}">
									<button type="button" class="badge2 text-bg-warning">JS</button>
								</c:if> <c:if test="${tag == 'CSS'}">
									<button type="button" class="badge2 text-bg-danger">CSS</button>
								</c:if> <c:if test="${tag == 'JQUERY'}">
									<button type="button" class="badge2 text-bg-success">JQUERY</button>
								</c:if> <c:if test="${tag == 'DATABASE'}">
									<button type="button" class="badge2 text-bg-info">DB</button>
								</c:if> <c:if test="${tag == 'JSP'}">
									<button type="button" class="badge2 text-bg-dark">JSP</button>
								</c:if> <c:if test="${tag == 'ETC'}">
									<button type="button" class="badge2 text-bg-light">ETC</button>
								</c:if> <c:if test="${tag == null}">
									<button type="button" class="badge2 text-bg-light">ETC</button>
								</c:if> <%-- 표시할 프로그래밍 언어 다 표시하기 --%> &nbsp; <span id="title"
								style="font-size: 0.9em;color: black;">${qrdto.getQna_title() }</span></a>
						</div>

					</c:forEach>
				</c:if>
				<c:if test="${empty qrlist }">
					<h3>인기 게시글이 없음</h3>
				</c:if>
			</div>
		</div>
<%-- 인기글 배너 end --%>		
		
	</div> <%-- main의 end --%>
	
	<jsp:include page="../include/bottom.jsp" />
	
<script type="text/javascript">

	$("#qnaWrite_btn").click(function(){
		if(${empty userId}) {
			alert('로그인한 이용자만 이용할 수 있습니다.');
			 location.href = '<%=request.getContextPath()%>/user_login.do';
		}else {
			location.href = '<%=request.getContextPath() %>/qna_insert.do'
		}
	});
	
	
	// 기본 위치(top)값
	var floatPosition = parseInt($(".sideBanner").css('top'))

	// scroll 인식
	$(window).scroll(function() {
	  
	    // 현재 스크롤 위치
	    var currentTop = $(window).scrollTop();
	    var bannerTop = currentTop + floatPosition + "px";

	    //이동 애니메이션
	    $(".sideBanner").stop().animate({
	      "top" : bannerTop
	    }, 700);

	}).scroll();
</script>

<script src="https://kit.fontawesome.com/c85ddd0cc6.js" crossorigin="anonymous"></script>
</body>
</html>
