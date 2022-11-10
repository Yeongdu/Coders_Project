package com.qaboard.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coders.controller.Action;
import com.coders.controller.ActionForward;
import com.coders.model.QnaDAO;
import com.coders.model.QnaDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class QnaInsertOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
			QnaDTO dto = new QnaDTO();

			String qnaBoardWriteFolder = "D:\\git\\Coders_Project\\WebContent\\qnaBoardWriteFolder";

			int fileSize = 5 * 1024 * 1024; 
			
			MultipartRequest multi = new MultipartRequest(request,qnaBoardWriteFolder,fileSize,"UTF-8");		
			
			String userId = multi.getParameter("userId").trim();
			String code = multi.getParameter("code").trim();
			String qna_title = multi.getParameter("qna_title").trim();
			String qna_content = multi.getParameter("qna_content").trim();
			String qna_code = multi.getParameter("qna_code").trim();
			String qna_file = multi.getFilesystemName("qna_file");
			
			if(qna_file == null ) {
				dto.setQna_file("");
			}else {
				dto.setQna_file(qna_file);
			}
			
		dto.setQna_writer(userId);
		dto.setQna_title(qna_title);
		dto.setQna_cont(qna_content);
		dto.setQna_tag(code);
		dto.setQna_code(qna_code);
		
		
		QnaDAO dao = QnaDAO.getInstance();
		int res = dao.insertQna(dto);
		
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		
		if(res > 0) {
			forward.setRedirect(true);
			forward.setPath("qna_list.do");
		}else {
			out.println("<script>");
			out.println("alert('게시물 등록에 실패하였습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		return forward;
	}

}
