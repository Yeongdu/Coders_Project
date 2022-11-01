<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link rel = "stylesheet" href = "./css/qna_board_main.css">
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
</head>
<body>

	<c:if test="${empty userId }">
	<jsp:include page="../include/none_top.jsp" />
	</c:if>
	
	<c:if test="${!empty userId }">
	<jsp:include page="../include/user_top.jsp" />
	</c:if>

	<div align = "center" id = "main">
	
		<div id = "main_top"> <%-- 정렬 / 언어 선택 창 --%>
				<div class="form-floating mb-3">
				  <input type="text" class="form-control" placeholder="질문" id ="search_keyword" name = "search_keyword">
				 <a href = "#"><i class="fa-solid fa-magnifying-glass fa-2x" onclick = "goSearch()"></i></a>
				 <script src="https://kit.fontawesome.com/c85ddd0cc6.js" crossorigin="anonymous"></script>
				</div>
			<ul>
				<li class = "qna_language_sort" onchange = "goSortCode()">
					<select class="form-select" aria-label="Default select example" name = "code" id = "code">
					  	<option value = "NONE">::: 언어 선택 :::</option>
						<option value = "JAVA">JAVA</option>
						<option value = "HTML">HTML</option>
						<option value = "CSS">CSS</option>
						<option value = "JAVASCRIPT">JAVASCRIPT</option>
						<option value = "JSP">JSP</option>
						<option value = "JQUERY">JQUERY</option>
						<option value = "DATABASE">DATABASE</option>
						<option value = "ETC">ETC</option>
					</select>
				</li>
				<li class = "qna_sort">
					<button type="button" class="btn btn-outline-primary" id = "recent_btn" onclick = "location.href ='<%=request.getContextPath()%>/qna_list.do'">최신순</button>&nbsp;&nbsp;
					<button type="button" class="btn btn-outline-primary" id = "view_btn" onclick = "location.href='<%=request.getContextPath()%>/qna_list_view.do'" disabled>조회순</button>&nbsp;&nbsp;
					<button type="button" class="btn btn-outline-primary" id = "comment_btn" onclick = "location.href ='<%=request.getContextPath()%>/qna_list_comment.do'">답변순</button>
				</li>
			</ul>
		</div> <%-- main_top의 end --%>
		
		<div id = "main_center"> <%-- 게시판 리스트 --%>
			<form method = "post" name = "frm" id = "frm">
			<c:set var = "list" value = "${List }" />
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
				<input type = "hidden" name = "qna_num" id = "qna_num" value = "${dto.getQna_num() }">
					<div id="container" class="border-top" class="border-bottom">
						<div class="qna_view_left">
							<div>
								<i class="fa-regular fa-eye"></i>
								${dto.getQna_hit() }
							</div>
							
							<div>
								<i class="fa-regular fa-pen-to-square"></i>
								${dto.getQna_reply() }
							</div> <%-- 답변 수 값 --%>
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
									<span class="badge text-bg-warning">JAVASCRIPT</span>
								</c:if>
								<c:if test="${tag == 'CSS'}">
									<span class="badge text-bg-danger">CSS</span>
								</c:if>
								<c:if test="${tag == 'JQUERY'}">
									<span class="badge text-bg-success">JQUERY</span>
								</c:if>
								<c:if test="${tag == 'DATABASE'}">
									<span class="badge text-bg-info">DataBase</span>
								</c:if>
								<c:if test="${tag == 'JSP'}">
									<span class="badge text-bg-dark">JSP</span>
								</c:if>
								<c:if test="${tag == 'ETC'}">
									<span class="badge text-bg-light">ETC</span>
								</c:if>								
								<%-- 표시할 프로그래밍 언어 다 표시하기 --%>
								&nbsp;&nbsp;&nbsp;${dto.getQna_title() }</a>
						</div>
						
						<div class="qna_view_right">
							<div id = "qna_view_writer">${dto.getQna_writer() }</div>
							<div id = "qna_view_date">
								<c:if test="${empty dto.getQna_update() }">
									${dto.getQna_date() }
								</c:if>
								<c:if test="${!empty dto.getQna_update() }">
									${dto.getQna_update() }
								</c:if>
							</div>
						</div>

				</div>   <!-- id="container" end -->
				</c:forEach>
			</c:if>
			</form>
		</div> <%-- main_center의 end --%>

	<%-- BootStrap을 이용한 페이징 처리 영역 --%>
		<nav>
          <ul class="pagination">
            <li class="page-item">
              <a class="page-link" href="qna_list_view.do?page=1" id = "page1">First</a></li>
            <c:choose>
                <c:when test="${ (page - 1) == 0}">
                    <li><a class="page-link" href="qna_list_view.do?page=1" id = "page2">Previous</a></li>
                </c:when>
                <c:otherwise>
                    <li><a class="page-link" href="qna_list_view.do?page=${ page - 1 }" id = "page3">Previous</a></li>
                </c:otherwise>
            </c:choose>
            <c:forEach begin="${ startBlock }" end="${ endBlock }" var="i">
                <c:if test="${ i==page }">
                    <li class="page-item active" aria-current="page">
                    <a class="page-link" href="qna_list_view.do?page=${i }" id = "page4">${i }</a></li>
                </c:if>
                <c:if test="${ i!=page }">
                    <li class="page-item">
                    <a class="page-link" href="qna_list_view.do?page=${i }" id = "page5">${i }</a></li>
                </c:if>
            </c:forEach>
           <c:if test="${ page < allPage }">
                <li class="page-item">
                <a class="page-link" href="qna_list_view.do?page=${ page + 1 }" id = "page6">Next</a>
                </li>
                <li class="page-item">
                <a class="page-link" href="qna_list_view.do?page=${ allPage }" id = "page7">End</a>
                </li>
            </c:if>
          </ul>
        </nav>
		<%-- BootStrap을 이용한 페이징 처리 영역 끝 --%>
		
		<div class="col-12 text-right">
                <button id="studyWrite_btn" class="btn btn-success" id = "write_btn"><i class="fa fa-pencil mr-1"></i> 새 글쓰기</button>
           </div>
	</div> <%-- main의 end --%>
	
	<jsp:include page="../include/bottom.jsp" />
	
<script type="text/javascript">

	$("#studyWrite_btn").click(function(){
		if(${empty userId}) {
			alert('로그인한 이용자만 이용할 수 있습니다.');
		}else {
			location.href = '<%=request.getContextPath() %>/qna_insert.do'
		}
	});
	
</script>

</html>