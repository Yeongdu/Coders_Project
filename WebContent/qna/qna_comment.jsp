<%@page import="com.coders.model.QnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
      
    <%
    	int comment_no =  Integer.parseInt(request.getParameter("qcomment_num").trim());
    	System.out.println("comment_no >>> " + comment_no);
    	
    	QnaDAO dao =  QnaDAO.getInstance();
    	
    	String str = dao.getQnacommentList(comment_no);
    	
    	out.println(str);
    
    %>
    
