<%@page import="com.coders.model.StudyBoardDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
		 // 페이징 처리 작업 진행
 		// 한 페이지당 보여질 게시물의 수
 		int rowsize = 5;
 		
 		int viewpage = 1;		// 현재 페이지 변수
 		
 		StudyBoardDAO dao = StudyBoardDAO.getInstance();
 		// Qna 게시판의 전체 글 갯수
 		
 		// 현재 페이지에 해당하는 게시물을 가져오는 메서드 호출(최신순)
 		String studyList = dao.getMainstudyList(viewpage, rowsize);
 		
		out.println(studyList);    
    %>