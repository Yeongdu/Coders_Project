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

public class QnaInsertOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		// �ڷ�� �� ���������� �Ѿ�� �����͵��� DB�� �����ϴ� �����Ͻ� ����
			QnaDTO dto = new QnaDTO();
			
			// 	1. ���� ���� ��� ����
			String qnaBoardWriteFolder = "D:\\git\\Project\\WebContent\\qnaBoardWriteFolder";
			
			//	2. ÷�� ���� ũ�� ����
			int fileSize = 10 * 1024 * 1024; 
			
			//	3. MultipartRequest ��ü ����
			// 		==> ���� ���ε带 �����ϱ� ���� ��ü ����
			MultipartRequest multi = new MultipartRequest(
					request,  		// �Ϲ����� request ��ü
					qnaBoardWriteFolder, 	// ÷�������� ����� ���
					fileSize, 		// ���ε��� ÷�������� �ִ� ũ��
					"UTF-8",		// ���� ���ڵ� ���
					new DefaultFileRenamePolicy());		// ������ �̸��� ���� ��� �ߺ��� �ȵǰ� �����ϴ� ������ 
			
			
			String userId = multi.getParameter("userId").trim();
			String code = multi.getParameter("code").trim();
			String qna_title = multi.getParameter("qna_title").trim();
			String qna_content = multi.getParameter("qna_content").trim();
			String qna_code = multi.getParameter("qna_code").trim();
			
			// �ڷ�� ������������ type = "file"�� �Ǿ� ������ getFile() �޼���� �����͸� �޾ƾ��Ѵ�.
			File file = multi.getFile("qna_file"); // java.io ��Ű���� File Ŭ������ ��ȯ

			if(file != null) { // ÷�������� �����ϴ� ���
				// �켱�� ÷�������� �̸��� �˾ƾ��Ѵ�.
				// getName() �޼��� ���
				String fileName = file.getName();
				
				// ��¥ ��ü ����
				Calendar cal = Calendar.getInstance();
				int year = cal.get(Calendar.YEAR);
				int month = cal.get(Calendar.MONTH) + 1;
				int day = cal.get(Calendar.DAY_OF_MONTH);
				
				// ..../Qna/2022-10-11
				String homedir = qnaBoardWriteFolder+"/"+year+"-"+month+"-"+day;
				
				// ��¥ ���� �����
				File path1 = new File(homedir);
				
				if(!path1.exists()) { // ������ �������� �ʴ� ���
					path1.mkdir(); // ���� ������ ������ִ� �޼���
				}
				
				// ���� ����� ==> ��) ȫ�浿_���ϸ�
				// ...../Qna/2022-10-11/ȫ�浿_���ϸ�
				String reFileName = userId + "_" + fileName;
				
				file.renameTo(new File(homedir + "/" + reFileName)); // ������ �̸� ����
				
				// ������ DB�� ����Ǵ� ���� �̸�
				// "/2022-10-11/ȫ�浿_���ϸ�"���� ������ ����
				String fileDBName = "/" + year + "-" + month + "-" + day + "/" + reFileName;
				dto.setQna_file(fileDBName);
				
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
			out.println("alert('�Խñ��� ������� ���Ͽ����ϴ�.')");
			out.println("history.back()");
			out.println("</script>");
		}
		return forward;
	}

}
