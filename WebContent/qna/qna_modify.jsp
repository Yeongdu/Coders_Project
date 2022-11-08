<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://kit.fontawesome.com/89d1c95709.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.js"></script>

<style type="text/css">

li {
		list-style: none;
	}
	
textarea {

	resize: none;
}
	.top_wrab {
		display : flex;
	}
	
	.tag_wrab {
		  flex-grow: 0.3;
		  padding: 0;
	}
	
	.space{
		flex-grow: 0.2;
	}
	
	.title_wrab {
	  flex-grow: 6;
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
	
	<br>
	<br>
	
<div align="center">

<div class="align-middle">
			<div class="container col-md-6" style="width: 800px;">
				<div class="card">
				<div class="card-body">

	<form method="post" enctype="multipart/form-data" 
		action="<%= request.getContextPath()%>/qna_modify_ok.do">
		
		<c:set var="dto" value="${qnaCont }"></c:set>
		
		<input type="hidden" name = "qna_num" value = "${dto.qna_num }">
		<input type="hidden" name = "qna_writer" value = "${dto.qna_writer }">
		<input type="hidden" name = "qna_date" value = "${dto.qna_date }">
		<input type="hidden" name = "qna_hit" value = "${dto.qna_hit }">
		
		<div class = "top_wrab">
		<div class = "tag_wrab">
			<ul style=" padding-left: 0px;">
			 <li>
				<select class="form-select" aria-label="Default select example" name = "qna_tag" id = "qna_tag">
                        <option value = "NONE" 
                        	<c:if test="${dto.qna_tag == 'none' }"> selected </c:if>>::: 언어 선택 :::</option>
                        	
                        <option value = "JAVA"
                        	<c:if test="${dto.qna_tag == 'JAVA' }"> selected </c:if>>JAVA</option>
                        
                        <option value = "PYTHON"
                        	<c:if test="${dto.qna_tag == 'PYTHON' }"> selected </c:if>>PYTHON</option>
                        
                        <option value = "HTML"
                        	<c:if test="${dto.qna_tag == 'HTML' }"> selected </c:if>>HTML</option>
                        
                        <option value = "CSS"
                        	<c:if test="${dto.qna_tag == 'CSS' }"> selected </c:if>>CSS</option>
                        
                        <option value = "JAVASCRIPT"
                        	<c:if test="${dto.qna_tag == 'JAVASCRIPT' }"> selected </c:if>>JAVASCRIPT</option>
                        
                        <option value = "JSP"
                        	<c:if test="${dto.qna_tag == 'JSP' }"> selected </c:if>>JSP</option>
                        
                        <option value = "JQUERY"
                        	<c:if test="${dto.qna_tag == 'JQUERY' }"> selected </c:if>>JQUERY</option>
                        
                        <option value = "DATABASE"
                        	<c:if test="${dto.qna_tag == 'DATABASE' }"> selected </c:if>>DATABASE</option>
                        
                        <option value = "ETC"
                        	<c:if test="${dto.qna_tag == 'ETC' }"> selected </c:if>>ETC</option>
                        
            	</select>
			</li>
		</ul>     
		</div>
		
		<div class = "space">&nbsp;</div>
		<div class = "title_wrab">
			<h4 class="card-title mb-3"><input name="qna_title" class="form-control" value= "${dto.qna_title }" ></h4>
		</div>
		</div>
		
			<h6 class="card-subtitle text-muted mb-4" align="left">
					<i class="fa-regular fa-user"></i> ${dto.qna_writer } &nbsp;
					<i class="fa-regular fa-clock"></i> ${dto.qna_date } &nbsp;
					<i class="fa-regular fa-eye"></i> ${dto.qna_hit }            
			</h6>
		<br>
		<br>
		
		
		<div>
			<h5 class="card-title mb-3" align="center"> 코드 내용  </h5>
				<div class="card-body">
					<textarea class="form-control" name="qna_code">${dto.qna_code }</textarea>
				</div>
		</div>
		
		<br>
			
		<div>
			<p>
				<c:if test="${!empty dto.getQna_file()}">
					<img class="card-img" src="<%=request.getContextPath()%>/qnaBoardWriteFolder/${dto.getQna_file()}" alt="" style="height: auto;margin-bottom: 14px;"/> 
				</c:if>	
				<c:if test="${empty dto.getQna_file()}">
				</c:if>	
			</p>
			<h5 class="card-title mb-3" align="center"> 본문 내용  </h5>
				<div class="card-body">
					<textarea class="form-control" name="qna_content" id = "qna_content">${dto.qna_cont }</textarea>
				</div>
		</div>
			<input type = "hidden" name = "qna_file_older" value = "${dto.qna_file }">
		<br>
			
		<div class="mb-3 row">
			<div class="card-body">
				<input class="form-control" type="file" name="qna_file">
			</div>
		</div>
			
			
		<div>	
			<input type="submit" value="게시글 수정" class= "btn btn-primary"> &nbsp;&nbsp;
			<input type="reset" value="다시 작성" class="btn btn-outline-primary"> &nbsp;&nbsp;
			<input type="button" value="뒤로 가기" class="btn btn-outline-secondary" onclick="history.back()">
		</div>
		
		
	</form>
	
	</div>
	</div>
	</div>
	</div> 

	
</div> <!-- 전체 div end -->

	<br>
	<br>
	<br>
	
	<jsp:include page="../include/bottom.jsp" />

</body>
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

</html>