package com.user.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coders.controller.Action;
import com.coders.controller.ActionForward;
import com.coders.model.UserDAO;
import com.coders.model.UserDTO;

public class CodersSearchOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String id = request.getParameter("id").trim();
		String name = request.getParameter("name").trim();
		
		UserDAO dao = UserDAO.getInstance();
		
		UserDTO dto = dao.userPwdSearch(id, name);
		
		PrintWriter out = response.getWriter();
		
		System.out.println("비밀번호 값 >>> " + dto.getUser_pwd());
		
		if(dto.getUser_name().equals(name)) {
			
			if(dto.getUser_pwd() == null) {
				
				out.println("<script>");
				out.println("alert('Social 계정으로 로그인 하세요.')");
				out.println("location.href='user_login.do'");
				out.println("</script>");
				
				
			}else {
				
				out.println("<script>");
				out.println("alert(회원님의 비밀번호는 "+ dto.getUser_pwd()+ " 입니다.')");
				out.println("location.href='user_login.do'");
				out.println("</script>");
				
			}
			
		}else {
			
			out.println("<script>");
			out.println("alert('일치하는 회원의 정보가 없습니다.')");
			out.println("history.back()");
			out.println("</script>");
			
		}
		
		return null;
	}

}
