package com.qaboard.action;

import java.io.File;
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
		String qna_file = multi.getFilesystemName("qna_file").trim();
		
		System.out.println("qna_tag>>" + qna_tag);
		
		/*
		 * //파일 받기 File qna_file = multi.getFile("qna_file");
		 * 
		 * 
		 * if(qna_file != null) { //첨부파일이 존재하는 경우
		 * 
		 * String fileName = qna_file.getName();
		 * 
		 * Calendar cal = Calendar.getInstance();
		 * 
		 * int year = cal.get(Calendar.YEAR);
		 * 
		 * int month = cal.get(Calendar.MONTH) + 1;
		 * 
		 * int day = cal.get(Calendar.DAY_OF_MONTH);
		 * 
		 * String homedir = saveFolder+"/"+year+"-"+month+"-"+day;
		 * 
		 * File path1 = new File(homedir);
		 * 
		 * if(!path1.exists()) { // 폴더가 존재하지 않는 경우 path1.mkdir(); // 실제 폴더를 만들어 주는 메서드.
		 * 
		 * }
		 * 
		 * String reFileName = qna_writer+"_"+fileName;
		 * 
		 * qna_file.renameTo(new File(homedir+"/"+reFileName));
		 * 
		 * // 실제로 DB에 저장되는 파일 이름 // "/2022-10-11/홍길동_파일명" 으로 저장할 예정. String fileDBName =
		 * "/"+year+"-"+month+"-"+day+"/"+reFileName;
		 * 
		 * dto.setQna_file(fileDBName);
		 * 
		 * }
		 */
	
		dto.setQna_num(qna_no);
		dto.setQna_title(qna_title);
		dto.setQna_writer(qna_writer);
		dto.setQna_cont(qna_content);
		dto.setQna_tag(qna_tag);
		dto.setQna_code(qna_code);
		dto.setQna_file(qna_file);
		
		QnaDAO dao = QnaDAO.getInstance();
		
		
		int check = dao.updateQna(dto);
		
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		
		if(check>0) {
			forward.setRedirect(true);
			forward.setPath("qna_list.do");
			
		} else {
			out.println("<script>");
			out.println("alert('게시글 수정에 실패하였습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
		
	}

	}
