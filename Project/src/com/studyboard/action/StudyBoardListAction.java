package com.studyboard.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coders.controller.Action;
import com.coders.controller.ActionForward;
import com.coders.model.StudyBoardDAO;
import com.coders.model.StudyBoardDTO;

public class StudyBoardListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// ���͵� �Խ����� ���� �����ִ� �����Ͻ� ����
		StudyBoardDAO dao = StudyBoardDAO.getInstance();
		List<StudyBoardDTO> list = dao.getStudyBoardList();
		request.setAttribute("studyBoardList", list);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("study/study_list.jsp");
		
		
		return forward;
	}

}