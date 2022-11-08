package com.studyboard.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coders.controller.Action;
import com.coders.controller.ActionForward;
import com.coders.model.StudyBoardDAO;
import com.coders.model.StudyBoardDTO;

public class StudyStatusSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
//		String search_field = request.getParameter("search_field").trim();
		String search_keyword = request.getParameter("search_keyword").trim();
		
//		System.out.println("search_field >>>" +search_field);
		System.out.println("search_keyword >>>" +search_keyword);
		 
		int rowsize = 10;

		int block = 5;

		int totalRecord = 0;

		int allPage = 0;

		int page = 1;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page").trim());
		} else {
			page = 1;
		}

		int startNo = (page * rowsize) - (rowsize - 1);

		int endNo = (page * rowsize);

		int startBlock = (((page - 1) / block) * block) + 1;

		int endBlock = (((page - 1) / block) * block) + block;

		StudyBoardDAO dao = StudyBoardDAO.getInstance();
		
		
		totalRecord = dao.searchStudyStatusListCount(search_keyword);

		allPage = (int) Math.ceil(totalRecord / (double) rowsize);

		if (endBlock > allPage) {
			endBlock = allPage;
		}

		List<StudyBoardDTO> searchList = dao.searchStatusStudyList(search_keyword, page, rowsize);

		request.setAttribute("page", page);
		request.setAttribute("rowsize", rowsize);
		request.setAttribute("block", block);
		request.setAttribute("totalRecord", totalRecord);
		request.setAttribute("allPage", allPage);
		request.setAttribute("startNo", startNo);
		request.setAttribute("endNo", endNo);
		request.setAttribute("startBlock", startBlock);
		request.setAttribute("endBlock", endBlock);
//		request.setAttribute("field", search_field);
		request.setAttribute("keyword", search_keyword);
		request.setAttribute("List", searchList);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("study/study_status_search.jsp");
		
		return forward;
	}

}
