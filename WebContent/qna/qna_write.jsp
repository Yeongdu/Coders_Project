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
<%-- summernote editor --%>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>


<style type="text/css">

	#qna_write_main {
		margin-top: 20px;
	}

	li {
		list-style: none;
	}
		
	textarea {
		height:26em; 
	    resize:none; /* 크기고정 */ 
	    maxlength="1000";
		resize: none;
	}
	
	.top_wrab{
		margin-bottom: 20px;
		display: flex;
		width: 40em;
		
	}	
	
	.tag_wrab {
		width:auto;
		margin:0;
		flex: 1;
	}
	
	.title_wrab{
		width:auto;
		margin:0;
		flex: 2;
	}
	
	.mb3 {
		margin-bottom: 40px;
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
	
  <div id = "qna_write_main" align = "center">
	<form method = "post" enctype = "multipart/form-data" action = "<%=request.getContextPath() %>/qna_insert_ok.do" id = "qna_write_form">
		<input type = "hidden" value = "${userId }" name = "userId">
			  <div class = "top_wrab" align = "center" width = "40em">
			  		<div class = "tag_wrab">
						<select class="form-select" aria-label="Default select example" name = "code" id = "code" style = "width:10em; margin-left:15px;">
							<option value = "NONE">언어 선택</option>
							<option value = "JAVA">JAVA</option>
							<option value = "HTML">HTML</option>
							<option value = "CSS">CSS</option>
							<option value = "JAVASCRIPT">JAVASCRIPT</option>
							<option value = "JSP">JSP</option>
							<option value = "JQUERY">JQUERY</option>
							<option value = "DATABASE">DATABASE</option>
							<option value = "ETC">ETC</option>
						</select>
					</div>
					<div id = "space">&nbsp;</div>
					<div class = "title_wrab">
						  <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="제목을 입력하세요." name = "qna_title" style = "width: 29.8em; margin: 0;">
					</div>
			</div><%--top_wrab의 end --%>
			<div id = "qna_write_cotent" align = "center">
				<ul>
					<li id = "qna_write_code">
						<div class="mb-3" style = "width:40em;">
						  <textarea class="form-control" id="qna_code" rows="8" name = "qna_code" placeholder = "코드를 입력하세요."></textarea>
						</div><%-- 코드 영역의 end --%>
					</li>
					
					<li id = "qna_write_cont">
						<div class="mb-3" style = "width:40em;">
						  <textarea class="form-control" id="qna_content" rows="8" name = "qna_content" placeholder = "내용을 입력하세요."></textarea>
						</div><%-- 내용 영역의 end --%>
					</li>
					
					<li>
						<div class="mb-3" style = "width:40em;">
						  <input class="form-control" type="file" id="formFile" name = "qna_file">
						</div><%-- 첨부파일의 end--%>
					</li>
				</ul>
			</div><%--코드/질문내용/첨부파일의 end --%>
			<div id = "qna_write_submit" align = "center">
				<button type="submit" class="btn btn-outline-primary" id ="saveBtn">작성하기</button>&nbsp;&nbsp;
				<button type="button" class="btn btn-outline-danger" onclick = "location.href='<%=request.getContextPath()%>/qna_list.do'">돌아가기</button>
			</div><%--버튼의 end --%>
	
	</form>
		
  </div><%-- qna_write_main의 end --%>
  
  <jsp:include page="../include/bottom.jsp" />
  
  
  <script type="text/javascript">

	function adjustHeight() {
		  var textEle = $('textarea');
		  textEle[0].style.height = 'auto';
		  var textEleHeight = textEle.prop('scrollHeight');
		  textEle.css('height', textEleHeight+8);
		  textEle.css('resize', 'none');
		  
		};
	
	adjustHeight();
	
	function adjustHeight2() {
		  var textEle = $('#qna_content');
		  textEle[0].style.height = 'auto';
		  var textEleHeight = textEle.prop('scrollHeight');
		  textEle.css('height', textEleHeight+8);
		  textEle.css('resize', 'none');
		  
		};
	
	adjustHeight2();
</script>

</body>
</html>