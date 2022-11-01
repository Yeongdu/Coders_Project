<%@page import="com.coders.model.QnaDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
   <%
   
    int qcomment_no = Integer.parseInt(request.getParameter("qcnum").trim());
  
	QnaDAO dao = QnaDAO.getInstance();

   
	 //유저의 로그인 여부 확인
	   String userId = null;
	
		if(session.getAttribute("userId") != null) {
			userId = (String) session.getAttribute("userId");
		}
	
		if(userId == null) {
	
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 필요한 기능입니다.');");
			script.println("</script>");
	
			return;
	}
	   
	   	System.out.print("userId>>> " + userId);
		System.out.print("commentNo>>> " + qcomment_no);
	   	
	   	
   
   
   
   
   %>