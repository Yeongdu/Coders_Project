package com.comment.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coders.controller.Action;
import com.coders.controller.ActionForward;
import com.coders.model.QnaCommentDTO;
import com.coders.model.QnaDAO;

public class QnaCommentInsertOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		
		String comment_writer = request.getParameter("qcomment_writer").trim();
		String comment_content = request.getParameter("qcomment_cont").trim();
		int comment_no = Integer.parseInt(request.getParameter("qcomment_num").trim());
		String comment_code = request.getParameter("qcomment_code").trim();
		

		
		QnaCommentDTO dto = new QnaCommentDTO();
		
		dto.setQcomment_writer(comment_writer);
		dto.setQcomment_cont(comment_content);
		dto.setQna_num(comment_no);
		dto.setQcomment_code(comment_code);
		
		QnaDAO dao = QnaDAO.getInstance();
		
		int check = dao.commentInsert(dto);
		
		PrintWriter out = response.getWriter();
		
		out.println(check);
		
		
		return null;
	}

}