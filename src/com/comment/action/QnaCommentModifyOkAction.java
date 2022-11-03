package com.comment.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coders.controller.Action;
import com.coders.controller.ActionForward;
import com.coders.model.QnaCommentDTO;
import com.coders.model.QnaDAO;

public class QnaCommentModifyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int qcomment_modify_no = Integer.parseInt(request.getParameter("qcomment_num").trim());
		String qcomment_modify_cont = request.getParameter("qcomment_cont").trim();
		String qcomment_modify_code = request.getParameter("qcomment_code").trim();
		
		System.out.println(qcomment_modify_no);
		System.out.println(qcomment_modify_cont);
		System.out.println(qcomment_modify_code);
	
		
		QnaCommentDTO dto = new QnaCommentDTO();
		
		dto.setQcomment_code(qcomment_modify_code);
		dto.setQcomment_cont(qcomment_modify_cont);
		dto.setQcomment_num(qcomment_modify_no);
		
		QnaDAO dao = QnaDAO.getInstance();
		   
		 int check = dao.modifyQnaComment(dto);
		   
		  PrintWriter out = response.getWriter();
		  
		  out.println(check);
		

		return null;
	}

}