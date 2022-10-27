<%@page import="java.util.regex.Pattern"%>
<%@page import="com.coders.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    	int res;
    
    	String userId = request.getParameter("paramId").trim();	
    
	    String regexp = "^[_a-z0-9-]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$";
		  
		Boolean ck = Pattern.matches(regexp, userId);
		  
		if(ck){
			UserDAO dao = UserDAO.getInstance();    
	    	    
	        res = dao.checkUserId(userId);
		}else {
			res = 1;
		}
		
    	// ajax에게 응답을 해 주면 됨.
    	out.println(res);
    %>