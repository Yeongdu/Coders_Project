<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>


<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/11.5.0/styles/github-dark-dimmed.min.css" />
<script
	src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/11.5.0/highlight.min.js"></script>
<script>
  hljs.highlightAll();
</script>
<!-- 코드 구현 스타일 -->


<script src="https://kit.fontawesome.com/89d1c95709.js"
	crossorigin="anonymous"></script>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.1.js"></script>

<style type="text/css">
.mb-3 {
	width: 40em;
}

#qna_cont {
	height: 26em;
/* 	resize: none; /* 크기고정 */ */
}

table {
	width: 1000px;
}

.qnaEditDelete {
	margin-left: 650px;
}

.qnaEditIcon {
	color: black;
}

.qnaDeleteIcon {
	color: black;
}

.container col-md-6 {
	margin: auto;
}

#emptyHeart {
	color: red;
}

#fullHeart {
	color: red;
	display: none;
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

	<input type="hidden" value="${userId }" id="userId">

	<br>

	<div align="center">
		<c:set var="dto" value="${Cont }" />

		<h3>${dto.qna_writer } 님의 게시글입니다.</h3>

		<br>

		<div class="align-middle">
			<div class="container col-md-6" style="width: 800px;">
				<div class="card">
					<div class="card-body">

						<div>
							<h4 class="card-title mb-3" align="left">${dto.qna_title }</h4>

							<h6 class="card-subtitle text-muted mb-4" align="left">
								<i class="fa-regular fa-user"></i> &nbsp; ${dto.qna_writer }
							</h6>

							<h6 class="card-subtitle text-muted mb-4" align="left">
								<i class="fa-regular fa-clock"></i> &nbsp; ${dto.qna_date }
								&nbsp; <i class="fa-regular fa-eye"></i> &nbsp; ${dto.qna_hit  } 
							</h6>
							
							
							<span id="qnaEditDelete" class="qnaEditDelete" style="display: none;"><a id="qnaEditIcon" class="qnaEditIcon"
						><i
							class="fa-solid fa-scissors"></i></a>&nbsp; <a id="qnaDeleteIcon"
						class="qnaDeleteIcon"><i
							class="fa-solid fa-trash"></i></a></span>

<%-- 							<span class="qnaEditDelete"><a class="qnaEditIcon"
								href="qna_modify.do?no=${dto.qna_num }"><i class="fa-solid fa-scissors"></i></a> &nbsp; &nbsp; <a class="qnaDeleteIcon"
								onclick="if(confirm('게시글을 삭제하시겠습니까?')) {location.href='qna_delete.do?no=${dto.qna_num }'} else {return; }">
									<i class="fa-solid fa-trash"></i>
							</a>
							</span> --%>

						</div>

						<br>

						<div class="card-body">
							<h5 class="card-title mb-3" align="center">코드 내용</h5>

							<c:if test="${empty dto.qna_code }">
								<label> </label>
							</c:if>
							<c:if test="${!empty dto.qna_code }">
								<div class="card-body" align="left">
									<pre>
										<code class="${dto.qna_tag }"><textarea class="form-control" id="qna_code" name="qna_code" readonly>${dto.qna_code }</textarea>
										</code>
									</pre>
								</div>
							</c:if>
						</div>

						<br>

						<div class="card-body">
							<h5 class="card-title mb-3" align="center">본문</h5>
								<p class="card-text"><textarea class="form-control" style="border:white;" id="qna_cont" name="qna_cont" readonly>${dto.getQna_cont() }</textarea></p>
						</div>



						<br> <br>

						<div class="mb-3 row">
							<label for="exampleFormControlInput1"
								class="col-sm-2 col-form-label">파일 첨부</label>
							<div class="col-sm-10">
								<input class="form-control" type="file" name="qna_file">
							</div>
						</div>

						<div class="mb-3 row">
							<label for="exampleFormControlInput1"
								class="col-sm-2 col-form-label"> 태그 </label>
							<div class="col-sm-10">
								<input name="qna_tag" class="form-control"
									value="${dto.qna_tag }" readonly="readonly">
							</div>
						</div>


						<div>
							<input class="btn btn-outline-secondary" type="button"
								value="전체 목록" onclick="location.href='qna_list.do'">
						</div>

					</div>
				</div>
			</div>



			<br> <br> <br>

			<h4>댓글 목록</h4>

			<br>

			<div>
				<table class="list" cellspacing="0" width="400">

					<tr class="line">
						<td colspan="3"></td>
					</tr>

					<tr class="line">
						<td></td>
						<td></td>
						<td></td>
					</tr>

				</table>

			</div>

			<br> <br> <br>

			<h4>${dto.qna_writer } 님의 게시글에 댓글 작성하기</h4>

			<br> <br>
			<!-- 댓글 폼 영역 -->

			<div class="align-middle">
				<div class="container col-md-6" style="width: 800px;">
					<div class="card">
						<div class="card-body">

							<div class="mb-3 row">
								<label for="exampleFormControlInput1"
									class="col-sm-2 col-form-label"><i
									class="fa-regular fa-user"></i> 작성자 </label>
								<div class="col-sm-10">
									<input class="form-control" type="text" name="co_writer"
										id="co_writer" value=${userId  } size="10" readonly>
								</div>
							</div>

							<br>

							<div>
								<h6 class="card-title mb-3" align="center">댓글 내용</h6>
								<div class="col-sm-10">
									<textarea class="form-control" id="co_content"
										name="co_content" rows="7" cols="40"></textarea>
								</div>
							</div>

							<br>

							<div class="mb-3 row">
								<label for="exampleFormControlInput1"
									class="col-sm-2 col-form-label">파일 첨부</label>
								<div class="col-sm-10">
									<input class="form-control" type="file" name="co_file"
										id="co_file">
								</div>

								<br> <br> <br>


								<div>
									<input type="button" id="commentBtn" value="댓글 작성"
										class="btn btn-primary"> <input type="reset"
										id="resetBtn" value="다시 작성" class="btn btn-outline-primary">
								</div>

							</div>
						</div>
					</div>
				</div>

			</div>
			<!-- 댓글폼 end -->

		</div>
		<!-- 전체 div end -->
		
		<br>
		<br>
		

		<script type="text/javascript">
		var qment = 0;

	$(function() {
		
		// ajax에서 동일하게 사용되는 속성 설정
		$.ajaxSetup({
			// ajax에서 한글 깨짐 문제 해결
			ContentType : "application/x-www-form-urlencoded;charset=UTF-8",
			type : "post"
		});
		
		//qna_comment 테이블의 모든 데이터를 가져오는 함수
		function getList() {
			
			$.ajax({
				url : "/Project/qna/qna_comment.jsp",
				data : { qcomment_num : ${dto.qna_num } },
				datatype : "json",    // 결과 데이터 타입
				success : function(data) {
					// 테이블 태그의 타이틀태그를 제외한 댓글 목록을 지우는 명령어.
					$(".list tr:gt(1)").remove();
					
					let table = "";
					
					
					$(data).find("comment").each(function() {
						
						table += "<tr>";
						table += "<td colspan='2'>" + "작성자: " + $(this).find("qcomment_writer").text() +"</td>";
						table += "</tr>";
						table += "<tr>";
						table += "<td id='reNum'>" + $(this).find("qcomment_num").text() + "</td>";
						table += "<td>" + "내용: " + $(this).find("qcomment_cont").text() + "</td>";
						table += "<td>" + "작성일자: " + $(this).find("qcomment_date").text() + "</td>";
						table += "<td>" + "첨부파일: " + $(this).find("qcomment_file").text() + "</td>";
						table += "<td>" + $(this).find("qcomment_good").text() + "</td>";
						table += "</td>";
						table += "</tr>";
						table += "<tr>";
						table += "<td colspan='5' align = 'right' id ='tdInput'> <input type = 'button' value = '수정'" +
									"id = 'input' num = '"+$(this).find("qcomment_num").text()+"' cont ='"+$(this).find("qcomment_cont").text()+"' file = '"+$(this).find("qcomment_file").text()+"'></td>";
						table += "<td colspan='5' align = 'right' id ='tdDel'> <input type = 'button' value = '삭제'" +
							" id = 'del' num = '" +$(this).find("qcomment_num").text()+"'></td>"; 
						table += "<td>" + "<button class = 'goodBtn'><i class='fa-regular fa-heart'></i></button>" + "</td>";
						table += "</tr>";
						table += "<tr>";
						table += "<td colspan='2'>&nbsp;</td>";
						table += "</tr>";
					});
					
					$(".list tr:eq(1)").after(table);
					/* console.log("arr >>> " + arr);
					console.log("qCo >>> " + qCo) */
					
				},
				
				error : function() {
					alert('데이터 통신 에러 발생');
				}
			});
		}  // getList() 함수 end
		
		// 댓글 작성 버튼을 클릭했을 때 DB에 추가로 저장.
		
	
		
		$("#commentBtn").on("click", function() {
			
			$.ajax({
				url : "/Project/qna_comment_insert_ok.do",
				datatype : "text",
				data : {
						qcomment_num : ${dto.qna_num },
						qcomment_writer : $("#co_writer").val(),
						qcomment_cont : $("#co_content").val(),
						qcomment_file : $("#co_file").val()
						},
				success : function(data) {
						if(data > 0) {
							alert('댓글이 등록되었습니다.');

							// 댓글 작성 후 다시 전체 댓글 리스트를 화면에 출력.
							getList();
							
							// input 태그에 입력된 내용을 지워줌.
							$("input[type=text]").each(function() {
								$(this).val();  // 입력된 값 지우기
							});
						
						}else {
							alert('댓글 등록에 실패했습니다.');
						}
				},
				
				error : function() {
					alert('댓글 삭제 오류입니다.');
				}
			});
		});  // 댓글 등록하기 end
		
		
		
		// 댓글 수정
		$("table").on("click", "#input", function() {
			$.ajax({
				url : "/Project/qna_modify.jsp",
				data : {
						no : $(this).attr("num"),
						cont : $(this).attr("cont"),
						file : $(this).attr("file")
				},
				datatype : "text",
				success : function(data) {
					if(data > 0) {
						alert('댓글이 삭제되었습니다.');
						
						getList();
					}else {
						alert('댓글이 삭제되지 않았습니다.');
					}
				},
				
				error : function() {
					alert('데이터 통신 오류입니다.~~~');
				}
			});
		});
		
		
		
		// 댓글 삭제
		$("table").on("click", "#del", function() {
			$.ajax({
				url : "/Project/qna_comment_delete_ok.do",
				data : "no="+$(this).attr("num"),
				datatype : "text",
				success : function(data) {
					if(data > 0) {
						alert('댓글이 삭제되었습니다.');
						
						getList();
					}else {
						alert('댓글이 삭제되지 않았습니다.');
					}
				},
				
				error : function() {
					alert('데이터 통신 오류입니다.~~~');
				}
			});
		});
		
	
		
		getList();  // 전체 리스트 함수 호출
			 	
	
	//좋아요 버튼 누르기 
	$(document).on("click", ".goodBtn", function(){
		
		$.ajax({
			url : "/Project/qna_comment_good_ok.do",
			datatype : "text",
			data : {
				qcomment_num : $(".reNum").text(),
				userId : $("#userId").val()
			},
			
			success : function(data){
				if(data>0){
					
						if(${empty userId}) {
							alert('로그인이 필요한 기능입니다.');
						}else{
					
				     	
				     	alert("좋아요를 누르셨습니다.")
						
						getList(); 
					}
						
				}else {
					alert("좋아요 누르기에 실패했습니다.")
				}
			}, 
			
			error : function(){
				alert("데이터 통신 오류입니다.")
			}
			
		})
		
	});
		
		
	function adjustHeight() {
		  var textEle = $('textarea');
		  textEle[0].style.height = 'auto';
		  var textEleHeight = textEle.prop('scrollHeight');
		  textEle.css('height', textEleHeight+8);
		};

	adjustHeight();
	
	
	// 글쓴 사람만 studyEditDelete studyComplete 보이는 함수, 
	// 글쓴 사람만 수정, 삭제, 모집완료처리 할수 있다. 모집중인 상태에서만 모집완료 버튼 보인다.
    function onlyWriter(){
            if(${userId == dto.qna_writer}){
                $('.qnaEditDelete').show();
                $('#qnaDeleteIcon').on({
                	  click: function () {
                		  if(${userId == dto.qna_writer}){
                	    		 var result = confirm('게시글을 삭제하시겠습니까?');
                	    	        if(result) {
                	    	        	//yes
                	    	        	location.href='qna_delete.do?no=${dto.qna_num }';
                	    	        	} else {
                	    	        		//no
                	    	        		return;
                	    	        		}
                	    	        }
                		  }
                });
                $('#qnaEditIcon').on({
                	click: function () {
                		if(${userId == dto.qna_writer}){
                			location.href='qna_modify.do?no=${dto.qna_num }';}
                		}
                });
                }
            }
    onlyWriter();
    


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	}); //전체 end

	</script>
		<br> <br> <br>

		<jsp:include page="../include/bottom.jsp" />
</body>
</html>