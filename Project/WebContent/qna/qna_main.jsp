<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<style type="text/css">
	a{
	text-decoration: none;
	}
	
	#container {
	  display: flex;
	  width: 55em;
	}
	.qna_view_left {
	  flex: 1;
	}
	.qna_view_center {
	  flex: 3;
	}
	.qna_view_right {
	  flex: 1;
	  text-align: right;
	}
	
	.qna_sort {
		float: right;
		list-style: none;
		margin-right: 30%;
		margin-bottom: 20px;
	}
	
	.qna_language_sort {
		list-style: none;
		float:left;
		margin-left: 30%;
	}
	
	.qna_view_center{
		margin: auto;
	}
	
	#main_center {
		clear: both;
	}
	
	#page_nav {
		float: center;
	}

</style>
</head>
<body>

	<div align = "center" id = "main">
	
		<div id = "main_top"> <%-- ���� / ��� ���� â --%>
			<ul>
				<li class = "qna_language_sort">
					<b>���α׷��� ���</b>
					<select name = "code">
							<option value = "none">::: ��� ���� :::</option>
							<option value = "Java">JAVA</option>
							<option value = "Python">PYTHON</option>
							<option value = "Html">HTML</option>
							<option value = "Css">CSS</option>
							<option value = "Javascript">JAVASCRIPT</option>
							<option value = "JSP">JSP</option>
							<option value = "Jquery">JQUERY</option>
							<option value = "DataBase">DATABASE</option>
							<option value = "ETC">ETC</option>
						</select>
				</li>
				<li class = "qna_sort">
					<input type = "button" value = "�ֽż�" class = "sort_Btn" onclick = "location.href ='<%=request.getContextPath()%>/qna_list.do'">&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
					<input type = "button" value = "��ȸ��" class = "sort_Btn" onclick = "location.href='<%=request.getContextPath()%>/qna_list_view.do'">&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
					<input type = "button" value = "�亯��" class = "sort_Btn" onclick = "location.href ='<%=request.getContextPath()%>/qna_list_comment.do'">
				</li>
			</ul>
		</div> <%-- main_top�� end --%>
		
		<div id = "main_center"> <%-- �Խ��� ����Ʈ --%>
			<c:set var = "list" value = "${List }" />
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
					<div id="container" class="border-top" class="border-bottom">
						<div class="qna_view_left">
							<div>${dto.getQna_hit() }</div>
							<div>${dto.getQna_hit() }</div> <%-- �亯 �� �� --%>
						</div>
	
						<div class="qna_view_center">
							<a href="<%=request.getContextPath()%>/qna_content.do?no=${dto.getQna_num() }"
								style="display: block;"> ${dto.getQna_title() }</a>
						</div>
						
						<div class="qna_view_right">
						<div>${dto.getQna_writer() }</div>
						<div>${dto.getQna_date() }</div>
						</div>

				</div>   <!-- id="container" end -->
				</c:forEach>
			</c:if>
		</div> <%-- main_center�� end --%>

	<%-- BootStrap�� �̿��� ����¡ ó�� ���� --%>
		<nav id = "page_nav">
		  <ul class="pagination">
		  
		    <li class="page-item">
		      <a class="page-link" href = "board_list.do?page=1">First</a>
		    </li>
		    <li>
		    	<c:if test="${page > 1 }">
		      <a class="page-link" href = "board_list.do?page=${page -1 }">Previous</a>
		      </c:if>
		    </li>
		    
			    <c:forEach begin ="${startBlock }" end = "${endBlock }" var = "i">
					<c:if test="${i == page }">
						<li class = "page-item active" aria-current="page">
							<a class = "page-link" href="board_list.do?page=${i }">${i }</a>
						</li>
					</c:if>
					
					<c:if test="${i != page }">
						<li class = "page-item">
							<a class = "page-link" href="board_list.do?page=${i }">${i }</a>
						</li>
					</c:if>
				</c:forEach>
				
				<c:if test="${endBlock < allPage }">
					<li class = "page-item">
						<a class = "page-link" href = "board_list.do?page=${page + 1 }">Next</a>
					</li>
					
					<li class = "page-item">
						<a class = "page-link" href = "board_list.do?page=${allPage }">End</a>
					</li>
				</c:if>
		  </ul>
		</nav>
	
	</div> <%-- main�� end --%>
</body>
</html>