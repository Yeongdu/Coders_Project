<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
	crossorigin="anonymous">
	
<style type="text/css">




 .container col-md-6{
 margin: auto;
 }
 
 .studyEditDelete{
 margin-left: 515px;
 }
 
 .studyEditIcon{
  color: black;
 }
 
 .studyEditIcon:hover{
  color: DarkBlue;
  text-shadow: 1px 2px 2px gray;
 }
 
 .studyDeleteIcon{
  color: black;
 }
 
 .studyDeleteIcon:hover {
  color: DarkBlue;
  text-shadow: 1px 2px 2px gray;
 }
 
 
 .ReCount{
    
    font-size: 22px;
    width: 600px;
    justify-content: center;
 }
 
 .replyRap textarea {
    font-family: inherit;
    padding: 1rem 1rem 1.5rem;
    outline: none;
    border: 1px solid #bebebe;
    border-radius: 16px;
    width: 100%;
    min-height: 100px;
    margin-bottom: 10px;
    resize: none;
}
 
 
 #re_content{
 width: 600px;
 }
 
 .button{

    outline: none;
    border: none;
    background-color: #fff;
    cursor: pointer;
   
    

}
 
 .btn.btn-outline-secondary{
 font-size: 1em;
 padding-left: 10px;
 padding-right: 10px;
 }
 

    
 .commentInput_buttonWrapper{
 
     display: flex;
    justify-content: flex-end;
    margin: 16px 0 24px;
    width: 600px;
}


.commentInput_buttonComplete{
padding: 10px 30px;
    min-width: 120px;
    height: 40px;
    background: #646464;;
    border-radius: 50px;
    font-weight: 700;
    color: #fff;
    font-size: 16px;
    outline: none;
    border: none;
    cursor: pointer;


}



 
.modifyBtn{
 color: black;
  background-color: transparent;
  border: 0;
}

.deleteBtn{
   color: black;
    background-color: transparent;
    border: 0;
}
 .contBottomWrab{
 display: flex;
 justify-content: space-between;
 }
 
 .scommentDate{
 font-size:0.8em;
 }
 
 .scommentwriter{
 font-weight: 600;
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

	<c:set var="dto" value="${Cont }" />

	<div class="align-middle">
		<div class="container col-md-6" style="width: 600px;">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title mb-3"><button type="button" class="btn btn-outline-primary" disabled>${dto.study_status }</button>&nbsp;${dto.getStudy_title() }</h4>
					<h6 class="card-subtitle text-muted mb-4">
						<i class="fa-regular fa-user"></i> ${dto.getStudy_writer() } &nbsp;
						<i class="fa-regular fa-clock"></i> ${dto.getStudy_date()} &nbsp;
						<i class="fa-regular fa-eye"></i> ${dto.getStudy_hit() }            
					</h6>
					<span id="studyEditDelete" class="studyEditDelete" style="display: none;"><a id="studyEditIcon" class="studyEditIcon"
						><i
							class="fa-solid fa-scissors"></i></a>&nbsp; <a id="studyDeleteIcon"
						class="studyDeleteIcon"><i
							class="fa-solid fa-trash"></i></a></span> <br> <br>
					<p>
						<img class="card-img"
							src="<%=request.getContextPath()%>/study_upload/${dto.getStudy_file()}"
							alt="" />
					</p>
					<p class="card-text"><textarea class="form-control" style="border:white;" readonly>${dto.getStudy_cont() }</textarea></p>
					<br> 
					<div class="contBottomWrab">
					<div><span class="btn btn-outline-dark"><i
						class="fa-regular fa-calendar-days"></i>
						${dto.study_start.substring(0, 10)} ~ ${dto.study_end.substring(0, 10) }</span>
					&nbsp; <span class="btn btn-outline-dark"><i
						class="fa-solid fa-person"></i> ${dto.study_people }</span></div>
						<div>
						<span id="studyComplete" class="btn btn-outline-success" style="display: none;" 
						><i class="fa-solid fa-check"></i>&nbsp;모집완료</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<br>
	
	<%-- 댓글 폼 영역입니다. --%>
	
	 <div align="center" class="ReCount">${dto.study_reply} 개의 댓글이 있습니다.</div>
	 <div class="replyRap" align="center">
    <textarea class="commentInput" placeholder="댓글을 입력하세요" id="re_content"></textarea>
	&nbsp;&nbsp;
	
	<div class="commentInput_buttonWrapper">
	<button class="commentInput_buttonComplete" id="replyBtn">댓글쓰기</button>
	</div>
	</div>
	
	
	 <div align="center">
	      <table class="list" class="table" style="width: 600px">
	         
	       <tr class="line">
	           <input type="hidden" value="${userId }" name="scomment_writer" id="scomment_writer">
	         </tr>
	     </table>
	  </div>
	  
	  
	  
	  
	
	<jsp:include page="../include/bottom.jsp" />


	<script type="text/javascript">
     $(function() {
	
	// ajax에서 동일하게 사용되는 속성 설정
	$.ajaxSetup({
		// ajax에서 한글 깨짐 문제 해결
		ContentType : "application/x-www-form-urlencoded;charset=UTF-8",
		type : "post"
	});
	
	



	// TBL_REPLY 테이블의 모든 데이터를 가져오는 함수
	function getList() {
		
		$.ajax({
			url : "/Project/study/studyboard_reply.jsp",
			data : {scomment_num : ${dto.study_num } },
			datatype : "xml",    // 결과 데이터 타입
			success : function(data) {
				// 테이블 태그의 타이틀태그를 제외한 
				// 댓글 목록을 지우는 명령어.
				$(".list tr:gt(0)").remove();
				
				let table = "";
				
                 $(data).find("reply").each(function() {
					
                	//1행 작성자, 수정, 삭제, 번호(hidden)

                	 table += "<tr>";
                	 table += "<td class='scommentwriter'><i class='fa-regular fa-user'>"+ "</i>" + $(this).find("scomment_writer").text() + "</td>";
                	 table += "<td colspan='5' align = 'right'";
                	 if('${userId}' == $(this).find("scomment_writer").text()){
                	 table += " style='display: block;'>";
                	 }else {
                	 table += " style='display: none;'>";
                	 }
                	 table +="<button value = '수정' id ='modifyBtn' class= 'modifyBtn'>" + '수정' + "</button>" + "&nbsp &nbsp"+ '| &nbsp' +
                	 "<button value = '삭제' id ='deleteBtn' class='deleteBtn'>" + '삭제' + "</button>";
                	 table += "</td>";
                	 table += "<td id = 'reSnum' style='display:none;'><span>" + $(this).find("scomment_num").text() + "</span>";
                	 table += "</tr>";


                	 //2행 작성일자
                	 table += "<tr>";
                	 table += "<td class='scommentDate'>" + $(this).find("scomment_date").text() + "</td>";
                	 table += "</tr>";

                	 // 3행 내용
                	 table += "<tr>";
                	 table += "<td><span>" + $(this).find("scomment_cont").text() + "</span>";
                	 table += "<input id = 'modifyOK' style='display:none;' type='text' value='"+$(this).find("scomment_cont").text()+"'/></td>";
                	 table += "</tr>";


                	 table += "<tr>";
                	 table += "<td colspan='2'>&nbsp;</td>";
                	 table += "</tr>";

				});
				
				//테이블의 첫번째 행의 아래에 table를 추가
				$(".list tr:eq(0)").after(table);
				//onlyReWriter();
			},
			
			
			error : function() {
				alert('데이터 통신 에러');
			}
		
		});
		
		
		
		    
		
	   
		
	}  // getList() 함수 end
	
	
	
	// 댓글 작성 버튼을 클릭했을 때 DB에 추가로 저장.
	$("#replyBtn").on("click", function() {
		if(${!empty userId}){
		
		$.ajax({
			url : "/Project/studyboard_reply_insert.do",
			datatype : "text",
			data : {
					
				    content : $("#re_content").val(),
				    scomment_writer :$("#scomment_writer" ).val(),
				    study_num : ${dto.study_num }
				    
					},
			success : function(data) {
					if(data > 0) {
						alert('댓글 작성 완료');
						
					
						// 댓글 작성 후 다시 전체 댓글 리스트를
						// 화면에 뿌려주면 됨.
						getList();
						
						
						
						// input 태그에 입력된 내용을 지워줌.
						$("#re_content").each(function() {
							$(this).val("");  // 입력된 값 지우기
						});
					
					}else {
						alert('댓글 추가가 실패 하였습니다.');
					}
			},
			
			error : function() {
				alert('데이터 통신 오류입니다.');
			}
		});
		
	} else{
		alert('로그인한 이용자만 이용할 수 있습니다.');
	}
	});  // 댓글 등록하기 end

	// 수정버튼 클릭 시 댓글 수정.
   /*  $(document).on("click", "#modifyBtn", function(){

    
		console.log('성공');
		
		if(this.getAttribute('value') == '수정'){
			
		
         //수정 버튼 클릭 시 input태그의 숨김 속성을 해제하는 코드 (this는 modifyBtn )
         this.parentNode.parentNode.previousSibling.childNodes[0].childNodes[1].style.display = 'block';
         

         //수정 버튼 클릭 시 span태그를 숨기는 코드 (this는 modifyBtn )	
         this.parentNode.parentNode.previousSibling.childNodes[0].childNodes[0].hidden = true;

         console.log('if문 성공');
         
         //수정 버튼 클릭시 수정완료, 취소버튼으로 변경하는 코드
         this.setAttribute('value', '수정완료');

         this.nextSibling.nextSibling.setAttribute('value', '취소');
         
         
         return;
         
         
        }


		
		
               
         //수정완료 버튼을 눌렀을 때 수정한 글이 저장되는 코드.
         if(this.getAttribute('value') == '수정완료' ){
			 
			console.log('if수정완료문 성공');
			
			$.ajax({
				url : "/Project/studyboard_reply_modify.do",
				datatype : "text",
				data : {
					content : this.parentNode.parentNode.previousSibling.childNodes[0].childNodes[1].value,  //input태그 value
					scomment_num : this.parentNode.nextSibling.childNodes[0].textContent   //scomment_num 
					    },
					    
			   success : function(data){
				       
				   if(data > 0){
					   alert('댓글 수정 완료');
					   
					// 댓글 작성 후 다시 전체 댓글 리스트를
						// 화면에 뿌려주면 됨.
						getList();
					   
				   }else{
					   alert('댓글 수정 실패');
				   }
				   
			   },
			   
			   error : function(){
				   alert('데이터통신오류');
			   }
				
				
			});
        	 
			
       
      
         }//수정완료 if문
         
  });//수정버튼 클릭 시 이벤트 end


 
  //삭제버튼 클릭 시 이벤트
  $(document).on("click", "#deleteBtn", function(){
	  
	  console.log('취소까지 옴');
	  
	  
	  if(this.getAttribute('value') == '삭제'){
	  if(confirm("해당 댓글을 삭제하시겠습니까?")){
		  $.ajax({
			  url : "/Project/studyboard_reply_delete.do",
			  datatype:"text",
			  data:{
				  scomment_num : this.parentNode.nextSibling.childNodes[0].textContent    //scomment_num 
				  
			  },
			  
			  success : function(data){
				  if(data > 0){
					  alert('댓글이 삭제되었습니다.')
					  getList();
				  }else{
					  alert('댓글 삭제에 실패했습니다.')
				  }
			  },
			  
			  error : function(){
				  
				  alert('데이터통신오류입니다.')
			  }
			  
			  
			  
		  })
	  }//삭제if문
	        return;
	  
	  }//value가 삭제일 때 if문 end
	  
	  
	  
	  
	  
	  if(this.getAttribute('value') == '취소'){
			
			
	         //취소 버튼 클릭 시 보이는 input태그의 숨김 속성을 다시 실행하는 코드 (this는 deleteBtn )
	         this.parentNode.parentNode.previousSibling.childNodes[0].childNodes[1].style.display = 'none';

	         //취소 버튼 클릭 시 숨겨져 있는 span태그를 다시 보이게 하는 코드  (this는 deleteBtn )	
	         this.parentNode.parentNode.previousSibling.childNodes[0].childNodes[0].hidden = false;

	         //input태그 안의 텍스트를 초기화하는 코드.
	         this.parentNode.parentNode.previousSibling.childNodes[0].childNodes[1].value
	         
	      // input 태그에 입력된 내용을 지워줌.
				this.parentNode.parentNode.previousSibling.childNodes[0].childNodes[1].value =
					$(this.parentNode.parentNode.previousSibling.childNodes[0].childNodes[0]).text();
	         
	         console.log('if문 성공');
	         
	         //취소 버튼 클릭시 수정, 삭제버튼으로 변경하는 코드
	         this.setAttribute('value', '삭제');

	         this.previousSibling.previousSibling.setAttribute('value', '수정');
	         
	    }// value가 취소일 때 if문 end

	     
	  
  });//삭제버튼 클릭 이벤트
	
	 */
	
	
	function adjustHeight() {
		  var textEle = $('textarea');
		  textEle[0].style.height = 'auto';
		  var textEleHeight = textEle.prop('scrollHeight');
		  textEle.css('height', textEleHeight+8);
		};

	getList();  // 전체 리스트 함수 호출
	adjustHeight();
	
	
	
	//글쓴 사람만 EditDelete 보이는 함수
	// 글쓴 사람만 studyEditDelete studyComplete 보이는 함수, 
	// 글쓴 사람만 수정, 삭제, 모집완료처리 할수 있다. 모집중인 상태에서만 모집완료 버튼 보인다.
    function onlyWriter(){
            if(${userId == dto.study_writer}){
                $('.studyEditDelete').show();
                $('#studyDeleteIcon').on({
                	  click: function () {
                		  if(${userId == dto.study_writer}){
                	    		 var result = confirm('게시글을 삭제하시겠습니까?');
                	    	        if(result) {
                	    	        	//yes
                	    	        	location.href='studyboard_delete_ok.do?no=${dto.getStudy_num() }';
                	    	        	} else {
                	    	        		//no
                	    	        		return;
                	    	        		}
                	    	        }
                		  }
                });
                $('#studyEditIcon').on({
                	click: function () {
                		if(${userId == dto.study_writer}){
                			location.href="studyboard_modify.do?no=${dto.getStudy_num() }";}
                		}
                });
                }
            }
    onlyWriter();
    
    function onlyWriterStatus(){
    	 if(${userId == dto.study_writer} && ${dto.study_status == '모집중'}){
    		$('#studyComplete').show(); 
         	$('#studyComplete').on({
     		click: function () {
     				var result = confirm('게시글을 모집완료로 변경하시겠습니까?');
     				if(result) {
     					//yes
     					location.href='study_statusChange.do?no=${dto.getStudy_num() }';
     					} else {
     						//no
     						return;
     						}
     				}
         	});
         	}
    	 }
    onlyWriterStatus();


});
</script>

	<script src="https://kit.fontawesome.com/7703fd875c.js" crossorigin="anonymous"></script>
</body>
</html>