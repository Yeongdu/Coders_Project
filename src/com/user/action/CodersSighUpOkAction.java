package com.user.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coders.controller.Action;
import com.coders.controller.ActionForward;
import com.coders.model.UserDAO;
import com.coders.model.UserDTO;

public class CodersSighUpOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String id = request.getParameter("id").trim();
		String pwd = request.getParameter("pwd").trim();
		String name = request.getParameter("name").trim();
		
		UserDTO dto = new UserDTO();
		
		dto.setUser_id(id);
		dto.setUser_pwd(pwd);
		dto.setUser_name(name);
		
		UserDAO dao = UserDAO.getInstance();
		
		int check = dao.userInsert(dto);
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			
			out.println("<script>");
			out.println("alert('회원 계정 생성에 성공하였습니다.')");
			out.println("location.href='user_login.do'");
			out.println("</script>");

		}else {
			out.println("<script>");
			out.println("alert('회원 계정 생성에 실패하였습니다.')");
			out.println("history.back()");
			out.println("</script>");
			
		}
		
		return null;
	}

}
