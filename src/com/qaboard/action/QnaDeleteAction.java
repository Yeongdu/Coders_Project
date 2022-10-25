package com.qaboard.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coders.controller.Action;
import com.coders.controller.ActionForward;
import com.coders.model.QnaDAO;

public class QnaDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int qna_no = Integer.parseInt(request.getParameter("no").trim());
		
		QnaDAO dao = QnaDAO.getInstance();
		
		int check = dao.deleteQna(qna_no);
		
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			dao.updateQnaNum(qna_no);
			forward.setRedirect(true);
			forward.setPath("qna/qna_main.jsp");
		}else {
			out.println("<script>");
			out.println("alert('게시글 삭제에 실패하였습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
			
		
	}

}
