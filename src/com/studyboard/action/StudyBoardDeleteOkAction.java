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

public class StudyBoardDeleteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 삭제버튼 클릭시 넘어온 글번호화 비밀번호를 가지고 DB에서 게시글을 삭제하는 비지니스 로직.
		
		int studyboard_no = 
			    Integer.parseInt(request.getParameter("no").trim());
		
		StudyBoardDAO dao = StudyBoardDAO.getInstance();
		
		StudyBoardDTO dto = dao.StudyboardContent(studyboard_no);
		
		String upload = 
			    "C:\\NCS\\workspace(jsp)\\SemiProject\\WebContent\\study_upload";
		
		
		//DTO에서 업로드된 파일 가져오기.
		
	    String fileName = dto.getStudy_file();
	    
	    ActionForward forward = new ActionForward();
	    
	    PrintWriter out = response.getWriter();
	    
	    int res = dao.deleteStudyboard(studyboard_no);
	    
	    
	    
	    if(fileName != null) {//첨부파일이 존재하는 경우
    		
    		File file = new File(upload + fileName);
    		
    		file.delete();  //파일을 제거하는 메서드.
    		
    	}
	    
	    if(res > 0) {
	    	forward.setRedirect(true);
	    	
	    	forward.setPath("studyBoard_list.do");
	    }else {    	
	    	out.println("<script>");
	    	out.println("alert('게시물 삭제 실패.')");
	    	out.println("history.back()");
	    	out.println("</script>");	    	
	    }

		return forward;
	}

}