package com.comment.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coders.controller.Action;
import com.coders.controller.ActionForward;
import com.coders.model.QnaCommentDTO;
import com.coders.model.QnaDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class QnaCommentInsertOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		QnaCommentDTO dto = new QnaCommentDTO();
		
		String qnaBoardWriteFolder = "D:\\git\\Coders_Project\\WebContent\\qnaBoardWriteFolder";
		
		int fileSize = 10 * 1024 * 1024;
		
		MultipartRequest multi = new MultipartRequest(
				request,  		// 일반적인 request 객체
				qnaBoardWriteFolder, 	// 첨부파일이 저장될 경로
				fileSize, 		// 업로드할 첨부파일의 최대 크기
				"UTF-8",		// 문자 인코딩 방식
				new DefaultFileRenamePolicy());	
		
		String comment_writer = multi.getParameter("qcomment_writer").trim();
		String comment_content = multi.getParameter("qcomment_cont").trim();
		int comment_no = Integer.parseInt(multi.getParameter("qcomment_num").trim());
		String comment_file = multi.getFilesystemName("qcomment_file").trim();
		
		System.out.println(comment_writer);
		System.out.println(comment_content);
		System.out.println(comment_no);
		System.out.println(comment_file);
		
		dto.setQcomment_writer(comment_writer);
		dto.setQcomment_cont(comment_content);
		dto.setQna_num(comment_no);
		dto.setQcommnet_file(comment_file);
		
		QnaDAO dao = QnaDAO.getInstance();
		
		int check = dao.commentInsert(dto);
		
		PrintWriter out = response.getWriter();
		
		out.println(check);
		
		
		return null;
	}

}
