<%@page import="com.coders.model.UserDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	
    	String userId = request.getParameter("userId").trim();
    
 		UserDAO dao = UserDAO.getInstance();
 		
 		// 현재 페이지에 해당하는 게시물을 가져오는 메서드 호출(최신순)
 		String List = dao.getUserQnaCommentList(userId);
 		
		out.println(List);    
    %>