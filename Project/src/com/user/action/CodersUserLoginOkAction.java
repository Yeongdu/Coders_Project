package com.user.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.coders.controller.Action;
import com.coders.controller.ActionForward;
import com.coders.model.UserDAO;

public class CodersUserLoginOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String userId = request.getParameter("id").trim();
		String userNickname = request.getParameter("nickname").trim();
		String token = request.getParameter("token").trim();
		
		if(userId.equals("undefined")) {
			userId = "User";
		}
		
		UserDAO dao = UserDAO.getInstance();

		int check = dao.UserSelect(userId);

		ActionForward forward = new ActionForward();

		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession();

		if(check == 1) {	// DB�� ������ �������� ���� ��
		  
		  dao.UserInsert(userId, userNickname);
		  
		  session.setAttribute("userId", userId);
		  session.setAttribute("userNickname", userNickname);
		  session.setAttribute("token", token);
		  
		  forward.setRedirect(false);
		  
		  forward.setPath("main.jsp");
		  
		}else if(check == -1){	// DB�� ������ ������ ��
		  
		  session.setAttribute("userId", userId); 
		  session.setAttribute("userNickname", userNickname);
		  session.setAttribute("token", token);
		  
		  forward.setRedirect(false);
		  
		  forward.setPath("main.jsp");
		  
		}else { 
		  out.println("<script>");
		  out.println("alert('�α��ο� �����ϼ̽��ϴ�.')");
		  out.println("location.href='main.jsp'"); 
		  out.println("</script>"); }
		 

		return forward;
	}

}