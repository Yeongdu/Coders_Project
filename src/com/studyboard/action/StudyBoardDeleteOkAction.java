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
		int studyboard_no = 
			    Integer.parseInt(request.getParameter("no").trim());
		
		StudyBoardDAO dao = StudyBoardDAO.getInstance();
		
		StudyBoardDTO dto = dao.StudyboardContent(studyboard_no);
		
		String upload = 
			    "D:\\git\\Coders_Project\\WebContent\\study_upload";
		
	    String fileName = dto.getStudy_file();
	    
	    ActionForward forward = new ActionForward();
	    
	    PrintWriter out = response.getWriter();
	    
	    int res = dao.deleteStudyboard(studyboard_no);
	    
	    
	    
	    if(fileName != null) {
    		
    		File file = new File(upload + fileName);
    		
    		file.delete();
    		
    	}
	    
		if (res > 0) {
			forward.setRedirect(true);
			forward.setPath("studyBoard_list.do");
		} else {
			out.println("<script>");
			out.println("alert('게시물 삭제에 실패하였습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		return forward;
	}

}
