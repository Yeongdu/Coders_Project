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
		// ������ư Ŭ���� �Ѿ�� �۹�ȣȭ ��й�ȣ�� ������ DB���� �Խñ��� �����ϴ� �����Ͻ� ����.
		
		int studyboard_no = 
			    Integer.parseInt(request.getParameter("no").trim());
		String study_writer = request.getParameter("study_writer").trim();
		String session_id = request.getParameter("session_id").trim();
		
		StudyBoardDAO dao = StudyBoardDAO.getInstance();
		
		StudyBoardDTO dto = dao.StudyboardContent(studyboard_no);
		
		String upload = 
			    "C:\\NCS\\workspace(jsp)\\SemiProject\\WebContent\\study_upload";
		
		
		//DTO���� ���ε�� ���� ��������.
		
	    String fileName = dto.getStudy_file();
	    
	    ActionForward forward = new ActionForward();
	    
	    PrintWriter out = response.getWriter();
	    
	    int res = dao.deleteStudyboard(studyboard_no);
	    
	    
	    
	    if(fileName != null) {//÷�������� �����ϴ� ���
    		
    		File file = new File(upload + fileName);
    		
    		file.delete();  //������ �����ϴ� �޼���.
    		
    	}
	    
	    if(res > 0) {
	    	if(study_writer.equals(session_id)) {
	    		forward.setRedirect(true);
		    	forward.setPath("studyBoard_list.do");
		    	System.out.println("session_id >>> " + session_id);
		    	System.out.println("study_writer >>> " + study_writer);
	    	}else {
	    		out.println("<script>");
		    	out.println("alert('������ ������ �� �����ϴ�.')");
		    	out.println("history.back()");
		    	out.println("</script>");
	    	}
	    	
	    }else {    	
	    	out.println("<script>");
	    	out.println("alert('�Խù� ���� ����.')");
	    	out.println("history.back()");
	    	out.println("</script>");	    	
	    }

		return forward;
	}

}