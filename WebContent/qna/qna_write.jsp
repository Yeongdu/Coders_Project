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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

<style type="text/css">

@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap')
	;

body {
	font-family: 'Noto Sans KR' !important;
}


   .btn.btn-primary{
   --bs-btn-bg: #2b59c6;
   --bs-btn-border-color: #2b59c6;

  --bs-btn-hover-color: #2b59c6;
  --bs-btn-hover-bg: #ffffff00;
  --bs-btn-hover-border-color: #2b59c6;

}
    .btn.btn-outline-primary{
    --bs-btn-border-color: #2b59c6;
    --bs-btn-color: #2b59c6;

    --bs-btn-hover-color: white;
    --bs-btn-hover-bg: #2b59c6;
    --bs-btn-hover-border-color: #2b59c6;
}


  #space{
   flex-grow: 0.1;  
  
  }


   .qna_explain_mainwrap{
    display: flex;
    justify-content: flex-start;
    margin: 0 auto;
}


   .qna_explain_subwrap{
    display: flex;
    justify-content: flex-start;
    margin: 0 auto;
}

   .qna_explain_main{
   --tw-text-opacity: 1;
   color: rgb(17 24 39/var(--tw-text-opacity));
   font-weight: 500;
   font-size: 24px;
   line-height: 1.75rem;
   margin: 0;
   }
   
   .qna_explain_sub{
   --tw-text-opacity: 1;
    color: rgb(107 114 128/var(--tw-text-opacity));
     font-size: .875rem;
    line-height: 1.25rem;
    margin: 0;
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
   }
   
   
   .code_label{
    --tw-text-opacity: 1;
    color: rgb(55 65 81/var(--tw-text-opacity));
    font-weight: 500;
    font-size: .875rem;
    line-height: 1.25rem;
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
    align-content: flex-start;
    justify-content: flex-start;
    align-items: center;
    padding-bottom: 7px;


   }
   
   .title_label{
    --tw-text-opacity: 1;
    color: rgb(55 65 81/var(--tw-text-opacity));
    font-weight: 500;
    font-size: .875rem;
    line-height: 1.25rem;
    display: flex;
    flex-direction: row;
    align-content: stretch;
    padding-left: 10px;
    padding-bottom: 7px;

   }
   
   .main_label{
    --tw-text-opacity: 1;
    color: rgb(55 65 81/var(--tw-text-opacity));
    font-weight: 500;
    font-size: .875rem;
    line-height: 1.25rem;
    display: flex;
    flex-direction: row;
    align-content: stretch;
    justify-content: flex-start;
    padding-left: 8px;
   }

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

		
	}	
	
	.tag_wrab {
 	width: auto;
    margin: 0;
    flex-grow: 1;
	}
	
	.title_wrab{
 	width: auto;
    margin: 0;
    flex-grow: 3.5;
	}
	
	.mb3 {
		margin-bottom: 40px;
	}
	
	#modalOpen {
		margin-left: 95%;
	}
	
	#modal {
		position: absolute;
        top: 0;
        left: 0;

        width: 100%;
        height: 100%;

        display: none;

        background-color: rgba(0, 0, 0, 0.4);
	}
	
	.modal_body {
	  position: absolute;
	  top: 50%;
	  left: 50%;
	
	  width: 800px;
	  height: 600px;
	
	  padding: 20px;
	
	  text-align: center;
	
	  background-color: rgb(255, 255, 255);
	  border-radius: 10px;
	  box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	
	  transform: translateX(-50%) translateY(-50%);
	}
	
	.modalClose {
		color:white;
		text-shadow:-1px 0 gray, 0 1px gray, 1px 0 gray, 0 -1px gray;
		font-size: 20px;
	}
	
	.qna_write_main_Wrap{
	display: flex;
	justify-content: center;
	margin: 0 auto;
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
<div class="qna_write_main_Wrap" style="width: 800px">
	<div id="qna_write_main" align="center" style="width: 800px">
		<div class="qna_explain_mainwrap">
			<h3 class="qna_explain_main">기술 궁금증 해결하기</h3>
			<br>
		</div>
		<div class="qna_explain_subwrap">
			<p class="qna_explain_sub">지식공유 플랫폼 CODE BOARD에서 최고의 개발자들과 함께 궁금증을 해결하세요.</p>
			<br>
			<br>
			<br>
		</div>
		<form method="post" enctype="multipart/form-data"
			action="<%=request.getContextPath()%>/qna_insert_ok.do"
			id="qna_write_form">
			<input type="hidden" value="${userId }" name="userId">
			<div class="top_wrab" align="center">
				<div class="tag_wrab">
					<label for="code" class="code_label">기술스택</label> <select
						class="form-select" aria-label="Default select example"
						name="code" id="code" style="width: 100%; margin-left: 0px;">
						<option value="">언어 선택</option>
						<option value="JAVA">JAVA</option>
						<option value="HTML">HTML</option>
						<option value="CSS">CSS</option>
						<option value="JAVASCRIPT">JAVASCRIPT</option>
						<option value="JSP">JSP</option>
						<option value="JQUERY">JQUERY</option>
						<option value="DATABASE">DATABASE</option>
						<option value="">ETC</option>
					</select>
				</div>
				<div id="space">&nbsp;</div>
				<div class="title_wrab">
					<label for="exampleFormControlInput1" class="title_label">제목</label>
					<input type="text" class="form-control"
						id="exampleFormControlInput1"
						placeholder="제목은 30자 까지만 입력할 수 있습니다." name="qna_title"
						style="width: 100%; margin: 0;" maxlength="30">
				</div>

			</div>
			<%--top_wrab의 end --%>
				<div id="qna_write_cotent" align="center">

					<ul style="padding-left: 0px;">
						<li id="qna_write_code">
							<div class="mb-3">
								<label class="main_label">본문</label> <a id="modalOpen"
									class="modalOpen"><i class="bi bi-question-circle"></i></a>
								<script src="https://kit.fontawesome.com/c85ddd0cc6.js"
									crossorigin="anonymous"></script>
								<textarea class="form-control" id="qna_code" rows="8"
									name="qna_code" placeholder="코드를 입력하세요."></textarea>
							</div> <%-- 코드 영역의 end --%>
						</li>

						<li id="qna_write_cont">
							<div class="mb-3">
								<textarea class="form-control" id="qna_content" rows="8"
									name="qna_content" placeholder="내용을 입력하세요."></textarea>
							</div> <%-- 내용 영역의 end --%>
						</li>

						<li>
							<div class="mb-3">
								<input class="form-control" type="file" id="formFile"
									name="qna_file">
							</div> <%-- 첨부파일의 end--%>
						</li>
					</ul>
				</div>
				<%--코드/질문내용/첨부파일의 end --%>
			<div id="qna_write_submit" align="center">
				<button type="submit" class="btn btn-outline-primary" id="saveBtn">작성하기</button>
				&nbsp;&nbsp;
				<button type="button" class="btn btn-outline-danger"
					onclick="location.href='<%=request.getContextPath()%>/qna_list.do'">돌아가기</button>
			</div>
			<%--버튼의 end --%>

		</form>

		<div id="modal">
			<div class="modal_body">
				<div class="modalClose" align="right">
					<i class="bi bi-x-lg"></i>
				</div>
				<h3>CODE 작성 방법</h3>
				<br> <img src="./upload/codeInfo.gif"> <br>
				<div class="code_info">
					<br>
					<p style="margin-bottom: 0;">1. 말머리에서 선택한 언어와 질문하고자 하는 언어의 형식이
						같아야합니다.</p>
					<p style="font-size: 13px; margin-top: 0; color: tomato;">*형식이
						달라도 코드 출력은 되지만 에디터 형식으로 출력되지 않습니다.</p>
					<p>2. 프로그램에서 코드를 복사해 붙여넣으세요.</p>
				</div>
			</div>
		</div>

	</div>
	</div>
	<%-- qna_write_main의 end --%>

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

<script type="text/javascript">
<%-- code 입력 방법을 설명하는 모달창 --%>
	$("#modalOpen").on("click", function(){
		$("#modal").css('display', 'block');
		$("#modal").css('overflow','hidden');
	});
	
	$(".modalClose").on("click",function(){
		$("#modal").css('display', 'none');
		$("#modal").css('overflow','auto');
	});

	
<%-- 아이콘 이미지 위로 마우스 올릴시 아이콘 변경 --%>
	// 모달창 여는 ? 아이콘
	$('.modalOpen').on('mouseover',function(){
	    $('.bi-question-circle').attr('class','bi-question-circle-fill');
	    $(this).css('cursor', 'pointer');
	});
	
	$('.modalOpen').on('mouseout',function(){
	    $('.bi-question-circle-fill').attr('class','bi-question-circle');
	});
	
	// 모달창 닫는 x 아이콘
	$('.modalClose').on('mouseover',function(){
	    $('.bi-x-lg').css('color','gray');
	    $('.bi-x-lg').css('text-shadow','-1px 0 gray, 0 1px gray, 1px 0 gray, 0 -1px gray');
	    $('.bi-x-lg').css('cursor','pointer');
	    
	});
	
	$('.modalClose').on('mouseout',function(){
	    $('.bi-x-lg').css('color','white');
	    $('.bi-x-lg').css('text-shadow','-1px 0 gray, 0 1px gray, 1px 0 gray, 0 -1px gray');
	});
</script>


<script type="text/javascript">
<%-- 클립보드 붙여넣기 --%>

function pasteFromClipboard(fieldId){
	  const pasteTextarea = document.querySelector('#'+fieldId);
	  pasteTextarea.focus();

	  try {
	    //프로미스 객체를 통해 클립보드에서 가져온 데이터를 입력 필드에 적용
	    navigator.clipboard.readText().then(clipboardText => {
	      pasteTextarea.value = clipboardText;
	      pasteTextarea.select();
	      console.log('클립보드에서 가져온 내용: ' + pasteTextarea.value);
	    });
	  } catch (err) {
	    console.log('클립보드에서 가져올 수 없음!'+err);
	  }

</script>


</body>
</html>