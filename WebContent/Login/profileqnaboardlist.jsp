<%@page import="com.coders.model.UserDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	
    	String userId = request.getParameter("userId").trim();
    
    	System.out.println("ID 값 >>> " + userId);
 		
 		UserDAO dao = UserDAO.getInstance();
 		// Qna 게시판의 전체 글 갯수
 		
 		// 현재 페이지에 해당하는 게시물을 가져오는 메서드 호출(최신순)
 		String userQnaList = dao.getUserQnaList(userId);
 		
		out.println(userQnaList);    
    %>