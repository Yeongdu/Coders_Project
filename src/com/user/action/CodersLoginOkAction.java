package com.user.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.coders.controller.Action;
import com.coders.controller.ActionForward;

public class CodersLoginOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String userId = request.getParameter("id").trim();
		String token = request.getParameter("token").trim();
		
		System.out.println("token >>> " + token);
		
		ActionForward forward = new ActionForward();
		
		HttpSession session = request.getSession();
		
		session.setAttribute("userId", userId);
		session.setAttribute("token", token);
		
		forward.setRedirect(true);
		
		forward.setPath("main.jsp");
		
		return forward;
	}

}
