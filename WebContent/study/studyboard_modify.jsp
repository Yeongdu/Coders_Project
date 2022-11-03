<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dto" value="${Modify }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.1.js"></script>
	
	
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
	
<style type="text/css">

@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap')
	;

body {
	font-family: 'Noto Sans KR' !important;
}

 .study_subtitle {
 font-size: 0.9rem;
 }

 .container col-md-6{
 margin: auto;
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

	<form method="post" enctype="multipart/form-data" action="<%=request.getContextPath() %>/studyboard_modify_ok.do">
		
		<input type="hidden" name="study_no" value="${dto.getStudy_num() }">
		<input type="hidden" name="study_writer" value="${dto.getStudy_writer() }">

	<br>
	<div class="align-middle">
		<div class="container col-md-6" style="width: 600px;">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title mb-3"><input name="study_title" class="form-control" value="${dto.getStudy_title() }" ></h4>
					<h6 class="study_subtitle">
						<i class="fa-regular fa-user"></i>${dto.getStudy_writer() } &nbsp;
						<i class="fa-regular fa-clock"></i> ${dto.getStudy_date()} &nbsp;
						<i class="fa-regular fa-eye"></i> ${dto.getStudy_hit() }            
					</h6>
					 <br> <br>
					<p>
						<img class="card-img" src="<%=request.getContextPath()%>/study_upload/${dto.getStudy_file()}" alt="" />
						<input class="form-control" class="card-img" type="file" name="study_file">
					</p>
					<p class="card-text">
					<textarea onkeyup="adjustHeight();" class="form-control" id="study_cont" name="study_cont">${dto.getStudy_cont() }</textarea>
					</p>
					
					<div class="mb-3 row">
				<label for="exampleFormControlInput1"
					class="col-sm-2 col-form-label">모집인원</label>
				<div class="col-sm-10">
					<input type="number" name="study_people" class="form-control" min="0" max="10" value="${dto.study_people }">
				</div>
			</div>
			
<!-- 			<div class="mb-3 row"> -->
<!-- 				<label for="exampleFormControlInput1" -->
<!-- 					class="col-sm-2 col-form-label">모집시작</label> -->
<!-- 				<div class="col-sm-10"> -->
<%-- 					<input type="date" name="study_start" class="form-control" value="${dto.study_start.substring(0, 10)}"> --%>
<!-- 				</div> -->
<!-- 			</div> -->
			
<!-- 			<div class="mb-3 row"> -->
<!-- 				<label for="exampleFormControlInput1" -->
<!-- 					class="col-sm-2 col-form-label">모집종료</label> -->
<!-- 				<div class="col-sm-10"> -->
<%-- 					<input type="date" name="study_end" class="form-control" value="${dto.study_end.substring(0, 10)}"> --%>
<!-- 				</div> -->
<!-- 			</div> -->

			<div class="mb-3 row">
				<label for="exampleFormControlInput1"
					class="col-sm-2 col-form-label">모집기간</label>
				<div class="col-sm-10">
				
				<input type="text" class="form-control" name="study_daterange" />
				<input type="hidden" name="study_start" id="study_start" title="시작일" maxlength="10" value="${dto.study_start.substring(0, 10) }">
				<input type="hidden" name="study_end" id="study_end" title="종료일" maxlength="10" value="${dto.study_end.substring(0, 10) }">
					
				</div>
			</div>






			
			
			<div align="center">
					<input class="btn btn-primary" type="submit" value="수정"> &nbsp;&nbsp; 
					<input class="btn btn-outline-primary" type="reset" value="리셋"> &nbsp;&nbsp;
					<input type="button" value="취소" class="btn btn-outline-secondary" 
					onclick="history.back()">
			</div>
					
				</div>

			</div>
		</div>
	</div>
	</form>
	
	
	
	
	<script type="text/javascript">
	$(function(){
	function adjustHeight() {
		  var textEle = $('textarea');
		  textEle[0].style.height = 'auto';
		  var textEleHeight = textEle.prop('scrollHeight');
		  textEle.css('height', textEleHeight+8);
		};

	adjustHeight();
	

	  $('input[name="study_daterange"]').daterangepicker({
		  
		locale: {
	            "separator": " ~ ",
	            "format": 'YYYY-MM-DD',
	            "applyLabel": "확인",
	            "cancelLabel": "취소",
	            "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
	 	        "monthNames": ["01월", "02월", "03월", "04월", "05월", "06월", "07월", "08월", "09월", "10월", "11월", "12월"]
	    },
	    opens: 'left'
	  }, function(start, end, label) {
	    $("#study_start").val(start.format('YYYY-MM-DD'));
	    $("#study_end").val(end.format('YYYY-MM-DD'));
	  });
	  
	  $('input[name="study_daterange"]').data('daterangepicker').setStartDate('${dto.study_start.substring(0, 10) }');
	  $('input[name="study_daterange"]').data('daterangepicker').setEndDate('${dto.study_end.substring(0, 10) }');
	  
	}); 
	
	
	$('#daterange').data('daterangepicker').setStartDate('03/01/2014');
	$('#daterange').data('daterangepicker').setEndDate('03/31/2014');
	
	
	</script>


	<script src="https://kit.fontawesome.com/7703fd875c.js" crossorigin="anonymous"></script>
		

	<jsp:include page="../include/bottom.jsp" />
</body>
</html>