package com.studyboard.action;

import java.io.File;
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

public class StudyBoardModifyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		StudyBoardDTO dto = new StudyBoardDTO();
		
	      String saveFolder = "D:\\git\\Coders_Project\\WebContent\\study_upload";
	      
	      int fileSize = 10 * 1024 * 1024;   //10MB
	      
	      MultipartRequest multi = new MultipartRequest(
	            request,      
	            saveFolder,    
	            fileSize,      
	            "UTF-8"); 
	      
	      String study_title = 
	      multi.getParameter("study_title").trim();
	      
	      String studyboard_cont = 
	      multi.getParameter("study_cont").trim();
	      
	      int study_people = Integer.parseInt(multi.getParameter("study_people").trim());
	      String study_start = multi.getParameter("study_start").trim();
	      String study_end = multi.getParameter("study_end").trim();
	
	      
	      File studyboard_file = multi.getFile("study_file");
	      
	      int studyboard_no = 
	      Integer.parseInt(multi.getParameter("study_no").trim());
	      
			if (studyboard_file != null) {
				String study_file = multi.getFilesystemName("study_file");
				dto.setStudy_file(study_file);
			}
			
	      dto.setStudy_num(studyboard_no);
	      dto.setStudy_title(study_title);
	      dto.setStudy_cont(studyboard_cont);
	      dto.setStudy_people(study_people);
	      dto.setStudy_start(study_start);
	      dto.setStudy_end(study_end);
	         
	      StudyBoardDAO dao = StudyBoardDAO.getInstance();
	      
	      int res = dao.modifyStudyboard(dto);
	      
	      
	      ActionForward forward = new ActionForward();
	      
	     PrintWriter out = response.getWriter();
	     
	     if(res > 0) {
	    	  forward.setRedirect(true);
	    	  forward.setPath("studyBoard_content.do?no="+studyboard_no);
	     
	     }else {
	    	  out.println("<script>");
	    	  out.println("alert('게시물 수정에 실패하였습니다.')");
	    	  out.println("history.back()");
	    	  out.println("</script>");
	      }
		return forward;
	}

}