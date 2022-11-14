package com.user.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.coders.controller.Action;
import com.coders.controller.ActionForward;
import com.coders.model.UserDAO;
import com.coders.model.UserDTO;

public class CodersLoginOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String userId = request.getParameter("id").trim();
		String token = request.getParameter("token").trim();
		String userPwd = request.getParameter("pwd").trim();
		
		ActionForward forward = new ActionForward();
		
		HttpSession session = request.getSession();
		
		UserDAO dao = UserDAO.getInstance();
		
		UserDTO dto = dao.UserLogin(userId);
		
		PrintWriter out = response.getWriter();
		
		if(dto.getUser_id().equals(userId)) {
			
			if(dto.getUser_pwd().equals(userPwd)) {
				
				session.setAttribute("userId", userId);
				session.setAttribute("token", token);
				
				forward.setRedirect(true);
				
				forward.setPath("main.jsp");
				
			}else {
					
				out.println("<script>");
				out.println("alert('회원 정보를 제대로 입력하세요.')");
				out.println("history.back()");
				out.println("</script>");
					
			}
				
		}else {
			
			out.println("<script>");
			out.println("alert('회원 정보를 제대로 입력하세요.')");
			out.println("history.back()");
			out.println("</script>");
			
		}
		
		return forward;
	}

}
