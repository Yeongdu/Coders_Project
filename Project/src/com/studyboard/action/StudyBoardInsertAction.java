package com.studyboard.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coders.controller.Action;
import com.coders.controller.ActionForward;
import com.coders.model.StudyBoardDAO;
import com.coders.model.StudyBoardDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class StudyBoardInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// Study게시판에 새 글을 추가하는 메서드

		StudyBoardDTO dto = new StudyBoardDTO();

		// 1. 파일 저장 경로 설정
		String saveFolder = "C:\\Users\\user1\\git\\Coders_Project\\CodersPJ_01\\WebContent\\study_upload";

		// 2. 첨부 파일 크기 지정
		int fileSize = 20 * 1024 * 1024; // 20MB

		// 3. MultipartRequest 객체 생성 ==> 파일업로드 진행하기 위한 객체 생성
		MultipartRequest multi = new MultipartRequest(request, saveFolder, fileSize, "UTF-8",
				new DefaultFileRenamePolicy()); // 파일 이름 같은 경우 중복안되게 설정

		
		String study_writer = multi.getParameter("study_writer").trim();
		String study_title = multi.getParameter("study_title").trim();
		String study_cont = multi.getParameter("study_cont").trim();
		int study_people = Integer.parseInt(multi.getParameter("study_people").trim());
		String study_start = multi.getParameter("study_start").trim();
		String study_end = multi.getParameter("study_end").trim();
		
		String study_file = multi.getFilesystemName("study_file");
		
		
		dto.setStudy_writer(study_writer);
		dto.setStudy_title(study_title);
		dto.setStudy_cont(study_cont);
		dto.setStudy_people(study_people);
		dto.setStudy_start(study_start);
		dto.setStudy_end(study_end);
		
		dto.setStudy_file(study_file);
		
		StudyBoardDAO dao = StudyBoardDAO.getInstance();
		int res = dao.insertStudy(dto);
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		
		if(res>0) {
			forward.setRedirect(true);
			forward.setPath("studyBoard_list.do");
		}else {
			out.println("<script> alert('업로드 실패.'); history.back(); </script>");
		}
		
		
		return forward;
	}

}