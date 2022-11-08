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
		
		File file = multi.getFile("qna_file");

		if(file != null) { // ÷�������� �����ϴ� ���
			String fileName = file.getName();
			
			// ��¥ ��ü ����
			Calendar cal = Calendar.getInstance();
			int year = cal.get(Calendar.YEAR);
			int month = cal.get(Calendar.MONTH) + 1;
			int day = cal.get(Calendar.DAY_OF_MONTH);
			
			// ..../upload/2022-10-11
			String homedir = saveFolder+"/"+year+"-"+month+"-"+day;
			
			// ��¥ ���� �����
			File path1 = new File(homedir);
			
			if(!path1.exists()) { // ������ �������� �ʴ� ���
				path1.mkdir(); // ���� ������ ������ִ� �޼���
			}
			
			// ���� ����� ==> ��) ȫ�浿_���ϸ�
			// ...../upload/2022-10-11/ȫ�浿_���ϸ�
			String reFileName = qna_writer + "_" + fileName;
			
			file.renameTo(new File(homedir + "/" + reFileName)); // ������ �̸� ����
			
			// ������ DB�� ����Ǵ� ���� �̸�
			// "/2022-10-11/ȫ�浿_���ϸ�"���� ������ ����
			String fileDBName = "/" + year + "-" + month + "-" + day + "/" + reFileName;
			dto.setQna_file(fileDBName);
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

