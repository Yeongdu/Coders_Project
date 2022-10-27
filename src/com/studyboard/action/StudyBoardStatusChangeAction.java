package com.studyboard.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coders.controller.Action;
import com.coders.controller.ActionForward;
import com.coders.model.StudyBoardDAO;
import com.coders.model.StudyBoardDTO;

public class StudyBoardStatusChangeAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		
		int study_num = Integer.parseInt(request.getParameter("no").trim());
		
		StudyBoardDAO dao = StudyBoardDAO.getInstance();
		int res = dao.modifyStudyStatus(study_num);
		ActionForward forward = new ActionForward();
		  if(res > 0) {
	    	  forward.setRedirect(true);
	    	  forward.setPath("studyBoard_content.do?no="+study_num);
	     }
		
		return forward;
	}

}
