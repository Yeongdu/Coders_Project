package com.comment.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coders.controller.Action;
import com.coders.controller.ActionForward;

public class QnaCommentModifyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int no = Integer.parseInt(request.getParameter("no").trim());
		String cont = request.getParameter("cont").trim();
		String file = request.getParameter("file").trim();
		
		System.out.println("no >>> " + no);
		System.out.println("cont >>> " + cont);
		System.out.println("file >>> " + file);
		

		return null;
	}

}
