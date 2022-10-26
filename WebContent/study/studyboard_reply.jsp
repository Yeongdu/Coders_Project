<%@page import="com.coders.model.StudyBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    int reply_no =  
    Integer.parseInt(request.getParameter("scomment_num").trim());

	System.out.println("넘겨 받은 원글 번호 >>> " + reply_no);
	
    StudyBoardDAO dao = StudyBoardDAO.getInstance();
    
    String str = dao.getReplyList(reply_no);
    
    out.println(str);
%>
