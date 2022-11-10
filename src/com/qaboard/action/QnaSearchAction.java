package com.qaboard.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coders.controller.Action;
import com.coders.controller.ActionForward;
import com.coders.model.QnaDAO;
import com.coders.model.QnaDTO;
import com.coders.model.StudyBoardDAO;
import com.coders.model.StudyBoardDTO;

public class QnaSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String search_keyword = request.getParameter("search_keyword").trim();
		
		int rowsize = 10;

		int block = 3;
		
		int totalRecord = 0;

		int allPage = 0;
		
		int page = 1;		
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page").trim());
		}
		
		int startNo = (page * rowsize) - (rowsize -1);
		
		int endNo = (page * rowsize);
		
		int startBlock = (((page - 1) / block) * block) + 1;
		
		int endBlock = (((page - 1) / block) * block) + block;
		
		QnaDAO dao = QnaDAO.getInstance();
		
		totalRecord = dao.searchListCount(search_keyword);
		
		StudyBoardDAO sdao = StudyBoardDAO.getInstance(); 
		
		List<StudyBoardDTO> rankList = sdao.getStudyRankList();

		List<QnaDTO> qrankList = dao.getQnaRankList();
		
		allPage = (int)Math.ceil(totalRecord / (double)rowsize);
		
		if(endBlock > allPage) {
			endBlock = allPage;
		}
		
		List<QnaDTO> searchList = dao.searchQnaList(search_keyword, page, rowsize);
		
		request.setAttribute("page", page);
		request.setAttribute("rowsize", rowsize);
		request.setAttribute("block", block);
		request.setAttribute("totalRecord", totalRecord);
		request.setAttribute("allPage", allPage);
		request.setAttribute("startNo", startNo);
		request.setAttribute("endNo", endNo);
		request.setAttribute("startBlock", startBlock);
		request.setAttribute("endBlock", endBlock);
		request.setAttribute("List", searchList);
		request.setAttribute("searchkeyword", search_keyword);
		
		request.setAttribute("rList", rankList);
		request.setAttribute("qrList", qrankList);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("qna/qna_main_search.jsp");
		
		return forward;
	}

}
