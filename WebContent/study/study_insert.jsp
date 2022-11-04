<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%
	
	%>
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
	
	<script>
	
	$('#study_cont').keyup(function(e) {
		let content = $(this).val();

		// 글자수 세기
		if (content.length == 0 || content == '') {
			$('.textCount').text('0자');
		} else {
			$('.textCount').text(content.length + '자');
		}

		// 글자수 제한
		if (content.length > 200) {
			// 1000자 부터는 타이핑 되지 않도록
			$(this).val($(this).val().substring(0, 200));
			// 1000자 넘으면 알림창 뜨도록
			alert('본문은 1000자까지 입력 가능합니다.');
		}
		;
	});
	
</script>

<style type="text/css">

.mb-3 {
	width: 40em;
}

textarea{
	height:26em; 
    resize:none; /* 크기고정 */ 
    maxlength="1000";
}



.study_explain_main{

    --tw-text-opacity: 1;
    color: rgb(17 24 39/var(--tw-text-opacity));
    font-weight: 500;
    font-size: 24px;
    line-height: 1.75rem;
    margin: 0;
    
    }
    
    .study_explain_top_wrap{
     margin: auto;
    }
    

</style>

<!-- 추가할 기능 : '모집인원은N명을 초과할 수 없습니다' 알림 기능
모임 시작시간보다 종료시간이 앞서면 '모임 시작시간 이후의 날짜여야합니다' 알림 

-->
</head>
<body>

	
	<c:if test="${empty userId }">
	<jsp:include page="../include/none_top.jsp" />
	</c:if>
	
	<c:if test="${!empty userId }">
	<jsp:include page="../include/user_top.jsp" />
	</c:if>
<br>
    <div class="study_explain_top_wrap" style="width: 800px">
	<div align="center" >
	<div>
	 <div class="study_explain_mainwrap" style="display: flex;">
      <h3 class="study_explain_main"  >개발 관련 모임과 스터디</h3>
       </div>
         <div class="study_explain_subwrap" style="display: flex;">
       <p class="study_explain_sub">지식공유 플랫폼 CODE BOARD에서 다양한 사람들과 만나 지식을 공유해보세요.</p>
       </div>
         <br>
	 
		<br>
		</div>
		<%-- enctype : 파일을 업로드 하기 위한 속성 --%>
		<div class="form_wrap" style="width: 800px;">
		<form method="post" enctype="multipart/form-data"
			action="<%=request.getContextPath()%>/studyBoard_insert_ok.do" style="justify-content: center;
    display: flex;
    flex-direction: column;">
			
			<input type="hidden" value="${userId }" name="study_writer">
			<div class="mb-3 row">
<!-- 				<label for="exampleFormControlInput1"  -->
<!-- 					class="col-sm-2 col-form-label">제목</label> -->
				<div class="col-sm-10">
					<input name="study_title" class="form-control" placeholder="제목을 입력해주세요." style="width: 800px;" required>
				</div>
			</div>


<!-- 			<div class="textLengthWrap"> -->
<!-- 				<p class="textCount">0자</p> -->
<!-- 				<p class="textTotal">/1000자</p> -->
<!-- 			</div> -->
			<div class="mb-3 row">
<!-- 				<label for="exampleFormControlInput1" -->
<!-- 					class="col-sm-2 col-form-label">본문</label> -->
				<div class="col-sm-10">
					<textarea class="form-control" id="study_cont" name="study_cont" placeholder="본문을 입력해주세요." style="width: 800px;" required></textarea>
				</div>
			</div>
			
			<div class="mb-3 row">
				<label for="exampleFormControlInput1"
					class="col-sm-2 col-form-label">파일첨부</label>
				<div class="col-sm-10">
					<input class="form-control" type="file" name="study_file">
				</div>
			</div>
			
			<div class="mb-3 row">
				<label for="exampleFormControlInput1"
					class="col-sm-2 col-form-label">모집인원</label>
				<div class="col-sm-10">
					<input type="number" name="study_people" class="form-control" min="0" max="10" placeholder="모집 인원은 1명~10명 입니다." required>
				</div>
			</div>
			
			<div class="mb-3 row">
				<label for="exampleFormControlInput1"
					class="col-sm-2 col-form-label">모집기간</label>
				<div class="col-sm-10">
				
				<input type="text" class="form-control" name="study_daterange" />
				<input type="hidden" name="study_start" id="study_start" title="시작일" maxlength="10">
				<input type="hidden" name="study_end" id="study_end" title="종료일" maxlength="10">
					
				</div>
			</div>
		
			
			<div>
					<input class="btn btn-primary" onclick="checkCal()" type="submit" value="글쓰기"> &nbsp;&nbsp;&nbsp; 
					<input class="btn btn-outline-primary" type="reset" value="다시작성"> &nbsp;&nbsp;&nbsp;
					<input type="button" class="btn btn-outline-secondary" value="뒤로가기" onclick="history.back()">
			</div>
			
		</form>
      </div>
	</div>
</div>
	
	<jsp:include page="../include/bottom.jsp" />

<script type="text/javascript">
$(function(){

	
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

	
	
// 	  $(".study_daterange").daterangepicker({
// 	        locale: {
// 	            "separator": "/",
// 	            "format": 'YYYY-MM-DD',
// 	            "applyLabel": "확인",
// 	            "cancelLabel": "취소",
// 	            "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
// 	            "monthNames": ["01월", "02월", "03월", "04월", "05월", "06월", "07월", "08월", "09월", "10월", "11월", "12월"]
// 	        },
// 	        minDate: gYear+"/"+gMonth+"/"+gDate,
// 	        maxDate: (gYear+1)+"/"+gMonth+"/"+gDate,
// 	        autoApply: true,
// 	        opens: 'center',
// 	        timePicker: false,
// 	        showDropdowns: false,
// 	        singleDatePicker: false,
// 	        isCustomDate : function(){}
// 	    });
	  
// 	  $(".study_daterange").on("apply.daterangepicker", function(ev, picker){
// 	        let sdate = picker.startDate.format('YYYY-MM-DD');
// 	        let edate = picker.endDate.format('YYYY-MM-DD');
// 	        const date1 = new Date(sdate);
// 	        const date2 = new Date(edate);

// 	        const diffDate = date1.getTime() - date2.getTime();
// 	        const between = Math.abs(diffDate / (1000 * 60 * 60 * 24));

// // 	        $(this).html(sdate.replaceAll("-", ". ") + " - " + edate.replaceAll("-", ". ") + "<em>" + between + "박 " + (between+1) + "일</em>");
// // 	        $(".stay-room .sr-top .reserv-go").attr("start", sdate).attr("end", edate);
// 	    });

	
	});
</script>
</body>
</html>