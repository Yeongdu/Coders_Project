package com.user.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.coders.controller.Action;
import com.coders.controller.ActionForward;
import com.coders.model.UserDAO;
import com.coders.model.UserDTO;

public class CodersUserContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		
		HttpSession session = request.getSession();
		
		String userId = (String) session.getAttribute("userId");
		
		UserDAO dao = UserDAO.getInstance();
		
		UserDTO dto = dao.userContentSearch(userId);
		
		request.setAttribute("content", dto);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("Login/profile.jsp");
		
		return forward;
	}

}
