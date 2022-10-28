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
		
		// 자료실 폼 페이지에서 넘어온 데이터들을 DB에 저장하는 비지니스 로직
			QnaDTO dto = new QnaDTO();
			
			// 	1. 파일 저장 경로 지정
			String qnaBoardWriteFolder = "C:\\Users\\user1\\git\\Coders_Project\\Coders_Project\\Project\\WebContent\\qnaBoardWriteFolder";
			
			//	2. 첨부 파일 크기 지정
			int fileSize = 10 * 1024 * 1024; 
			
			//	3. MultipartRequest 객체 생성
			// 		==> 파일 업로드를 진행하기 위한 객체 생성
			MultipartRequest multi = new MultipartRequest(
					request,  		// 일반적인 request 객체
					qnaBoardWriteFolder, 	// 첨부파일이 저장될 경로
					fileSize, 		// 업로드할 첨부파일의 최대 크기
					"UTF-8",		// 문자 인코딩 방식
					new DefaultFileRenamePolicy());		// 파일의 이름이 같은 경우 중복이 안되게 설정하는 생성자 
			
			
			String userId = multi.getParameter("userId").trim();
			String code = multi.getParameter("code").trim();
			String qna_title = multi.getParameter("qna_title").trim();
			String qna_content = multi.getParameter("qna_content").trim();
			String qna_code = multi.getParameter("qna_code").trim();
			
			// 자료실 폼페이지에서 type = "file"로 되어 있으면 getFile() 메서드로 데이터를 받아야한다.
			File file = multi.getFile("qna_file"); // java.io 패키지의 File 클래스로 반환

			if(file != null) { // 첨부파일이 존재하는 경우
				// 우선은 첨부파일의 이름을 알아야한다.
				// getName() 메서드 사용
				String fileName = file.getName();
				
				// 날짜 객체 생성
				Calendar cal = Calendar.getInstance();
				int year = cal.get(Calendar.YEAR);
				int month = cal.get(Calendar.MONTH) + 1;
				int day = cal.get(Calendar.DAY_OF_MONTH);
				
				// ..../Qna/2022-10-11
				String homedir = qnaBoardWriteFolder+"/"+year+"-"+month+"-"+day;
				
				// 날짜 폴더 만들기
				File path1 = new File(homedir);
				
				if(!path1.exists()) { // 폴더가 존재하지 않는 경우
					path1.mkdir(); // 실제 폴더를 만들어주는 메서드
				}
				
				// 파일 만들기 ==> 예) 홍길동_파일명
				// ...../Qna/2022-10-11/홍길동_파일명
				String reFileName = userId + "_" + fileName;
				
				file.renameTo(new File(homedir + "/" + reFileName)); // 파일의 이름 변경
				
				// 실제로 DB에 저장되는 파일 이름
				// "/2022-10-11/홍길동_파일명"으로 저장할 예정
				String fileDBName = "/" + year + "-" + month + "-" + day + "/" + reFileName;
				dto.setQna_file(fileDBName);
				
			}
			
		dto.setQna_writer(userId);
		dto.setQna_title(qna_title);
		dto.setQna_cont(qna_content);
		/*
		 * dto.setQna_cont(qna_content.replaceAll(
		 * "<(/)?([a-zA-Z]*)(\\\\s[a-zA-Z]*=[^>]*)?(\\\\s)*(/)?>",""));
		 */
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
			out.println("alert('게시글을 등록하지 못하였습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		return forward;
	}

}
