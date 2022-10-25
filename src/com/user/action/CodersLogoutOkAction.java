package com.user.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.coders.controller.Action;
import com.coders.controller.ActionForward;

public class CodersLogoutOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		HttpSession session = request.getSession();
		
		ActionForward forward = new ActionForward();
		
		session.invalidate();
			
		forward.setRedirect(false);
			
		forward.setPath("main.jsp");
			
		return forward;
	}

}
