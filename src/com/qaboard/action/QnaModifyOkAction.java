package com.qaboard.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coders.controller.Action;
import com.coders.controller.ActionForward;
import com.coders.model.QnaDAO;
import com.coders.model.QnaDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class QnaModifyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String saveFolder = "D:\\git\\Coders_Project\\WebContent\\qnaBoardWriteFolder";
		
		int fileSize = 10 * 1024 * 1024;
		
		QnaDTO dto = new QnaDTO();
		
		MultipartRequest multi = new MultipartRequest(
				request,
				saveFolder,
				fileSize,
				"UTF-8",
				new DefaultFileRenamePolicy()
				);

		int qna_no = Integer.parseInt(multi.getParameter("qna_num").trim());
		
		String qna_writer = multi.getParameter("qna_writer").trim();
		String qna_title = multi.getParameter("qna_title").trim();
		String qna_content = multi.getParameter("qna_content").trim();
		String qna_code = multi.getParameter("qna_code").trim();
		String qna_tag = multi.getParameter("qna_tag").trim();
		
		// 글 작성 시 삽입한 파일
		String older_file = multi.getParameter("qna_file_older").trim();
		
		// 수정 시 작성한 파일
		String new_file = multi.getFilesystemName("qna_file");

		if (new_file != null) { // 새로 등록한 파일이 있으면
			dto.setQna_file(new_file);
		}else {
			dto.setQna_file(older_file);
		}
	
		dto.setQna_num(qna_no);
		dto.setQna_title(qna_title);
		dto.setQna_writer(qna_writer);
		dto.setQna_cont(qna_content);
		dto.setQna_tag(qna_tag);
		dto.setQna_code(qna_code);
		
		QnaDAO dao = QnaDAO.getInstance();
		int check = dao.updateQna(dto);
		
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		
		if(check>0) {
			forward.setRedirect(true);
			forward.setPath("qna_content.do?no="+qna_no);
			
		} else {
			out.println("<script>");
			out.println("alert('�Խñ� ������ �����Ͽ����ϴ�.')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
		
	}

}

