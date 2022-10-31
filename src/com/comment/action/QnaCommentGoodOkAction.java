package com.comment.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.coders.controller.Action;
import com.coders.controller.ActionForward;
import com.coders.model.QnaDAO;

public class QnaCommentGoodOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		HttpSession session = request.getSession();
		
		int qcomment_no = Integer.parseInt(request.getParameter("no").trim());
		String userId = (String) session.getAttribute("userId");
		
		QnaDAO dao = QnaDAO.getInstance();
		
		PrintWriter out = response.getWriter();
		
		System.out.println("goodaction no>>> " + qcomment_no);
		System.out.println("goodaction id>>> " + userId);
		
		
		int check0 = dao.userIdSessionIdGood(userId, qcomment_no);
		
		System.out.println("________________________________________________");
		
		System.out.println("Id check>>>>> " + check0);
		
		if(check0 < 0) { 
			
			int check1 = dao.upGoodQnaComment(qcomment_no, userId);
			int check2 = dao.updatePlusGood(qcomment_no, userId);
			
			out.println(check1);
			out.println(check2);
			
		}else if (check0 > 0) { 
			
			int check3 = dao.downGoodQnaComment(qcomment_no, userId);
			int check4 = dao.updateMinusGood(qcomment_no, userId);
			
			out.println(check3);
			out.println(check4);
			
		}

		return null;
	
	}

}
