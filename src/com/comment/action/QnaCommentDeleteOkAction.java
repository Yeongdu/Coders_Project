package com.comment.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coders.controller.Action;
import com.coders.controller.ActionForward;
import com.coders.model.QnaDAO;

public class QnaCommentDeleteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		
		int qcomment_no = Integer.parseInt(request.getParameter("reflyNum").trim());
		
		QnaDAO dao = QnaDAO.getInstance();
		
		int check = dao.deleteQnaComment(qcomment_no);
		
		PrintWriter out = response.getWriter();
		ActionForward forward = new ActionForward();
		
		if(check>0) {			
			forward.setRedirect(true);
			forward.setPath("qna/qna_list.do");	
		}else {
			out.println("<script>");
			out.println("alert('댓글 삭제에 실패했습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		
		return forward;
		
	}

}
