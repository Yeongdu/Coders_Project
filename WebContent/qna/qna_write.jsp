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
<style type="text/css">
	li {
		list-style: none;
	}
	
	#qna_write_main{
		width:50%;
		margin: auto;
	}

	.qna_language_select {
		width: auto;
	}
	
	textarea {
		resize: none;
	}
</style>
</head>
<body>
  <div id = "qna_write_main">
	<form method = "post" enctype = "multipart/form-data" action = "<%=request.getContextPath() %>/qna_insert_ok.do" id = "qna_write_form">
		<input type = "hidden" value = "${userId }" name = "userId">
			<div id = "qna_write_title">
				<ul>
					<li class = "qna_language_select">
						<label for="exampleFormControlInput1" class="form-label">프로그래밍 언어</label>
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
					<li id = "qna_write_title">
						<div class="mb-3">
						  <label for="exampleFormControlInput1" class="form-label">제 목</label>
						  <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="제목을 입력하세요." name = "qna_title">
						</div>
					</li>	
					
				</ul>
			</div>
			<div id = "qna_write_cotent">
				<ul>
					<li id = "qna_write_code">
						<div class="mb-3">
						  <label for="exampleFormControlTextarea1" class="form-label">코 드</label>
						  <textarea class="form-control" id="qna_code" rows="8" name = "qna_code"></textarea>
						</div>
					</li>
					
					<li id = "qna_write_cont">
						<div class="mb-3">
						  <label for="exampleFormControlTextarea1" class="form-label">질문 내용</label>
						  <textarea class="form-control" id="exampleFormControlTextarea1" rows="8" name = "qna_content"></textarea>
						</div>
					</li>
					
					<li>
						<div class="mb-3">
						  <label for="formFile" class="form-label">첨부파일</label>
						  <input class="form-control" type="file" id="formFile" name = "qna_file">
						</div>
					</li>
				</ul>
			</div>
			<div id = "qna_write_submit" align = "center">
				<button type="submit" class="btn btn-outline-primary">작성하기</button>&nbsp;&nbsp;
				<button type="button" class="btn btn-outline-danger" onclick = "location.href='<%=request.getContextPath()%>/qna_list.do'">돌아가기</button>
			</div>
	</form>
  </div>
  
</body>
</html>