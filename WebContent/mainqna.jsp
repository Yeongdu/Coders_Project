<%@page import="com.coders.model.QnaDAO"%>
<%@page import="com.coders.model.QnaDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
		 // 페이징 처리 작업 진행
 		// 한 페이지당 보여질 게시물의 수
 		int rowsize = 5;
 		
 		int viewpage = 1;		// 현재 페이지 변수
 		
 		QnaDAO dao = QnaDAO.getInstance();
 		// Qna 게시판의 전체 글 갯수
 		
 		// 현재 페이지에 해당하는 게시물을 가져오는 메서드 호출(최신순)
 		String qnaList = dao.getMainQnaList(viewpage, rowsize);
 		
		out.println(qnaList);    
    %>