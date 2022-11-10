package com.studyboard.action;

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

public class StudyBoardStatusViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		
		// 스터디 게시판의 글을 보여주는 비지니스 로직
		
				// 페이징 처리 작업 진행
						
				// 한 페이지당 보여질 게시물의 수
				int rowsize = 10;
				
				// 아래에 보여질 페이지의 최대 블럭 수 - 예) [1][2][3] / [4][5][6]
				int block = 5;
				
				// DB 게시물의 전체 수 (count함수) -전체 페이지 수 체크를 위해 체크
				int totalRecord = 0;
				
				//전체 페이지 수 = 한페이지당 보여질 게시물의 수 / 전체 게시물의 수
				int allPage = 0;
				
				int page = 0; //현재페이지 변수
				
				if(request.getParameter("page") != null) {
					page = Integer.parseInt(request.getParameter("page").trim());
				}else {
					//처음으로 "전체 게시물 목록" a태그를 클릭한 경우
					page = 1;
				}
				
				//해당 페이지에서 시작번호
				int startNo = (page * rowsize) - (rowsize - 1);
						
				//해당 페이지에서 끝번호
				int endNo = (page * rowsize);
				
				//해당 페이지에서 시작 블럭
				int startBlock = (((page - 1) / block) * block) + 1;
						
				//해당 페이지에서 끝 블럭
				int endBlock = (((page - 1) / block) * block) + block;
		
		StudyBoardDAO dao = StudyBoardDAO.getInstance();
		totalRecord = dao.getStudyIngCount();
		
		allPage = (int)Math.ceil(totalRecord/(double)rowsize);
		
		if(endBlock > allPage) {
			endBlock = allPage;
		}
		List<StudyBoardDTO> pageList = dao.getStudyStatusList(page,rowsize);
		
		List<StudyBoardDTO> rankList = dao.getStudyRankList();
		

		QnaDAO qdao = QnaDAO.getInstance();
		List<QnaDTO> qrankList = qdao.getQnaRankList();
	
		
		//현재페이지에 해당하는 게시물을 가져오는 메서드 호출
				request.setAttribute("page", page);
				request.setAttribute("rowsize", rowsize);
				request.setAttribute("block", block);
				request.setAttribute("totalRecord", totalRecord);
				request.setAttribute("allPage", allPage);
				request.setAttribute("startNo", startNo);
				request.setAttribute("endNo", endNo);
				request.setAttribute("startBlock", startBlock);
				request.setAttribute("endBlock", endBlock);
				request.setAttribute("List", pageList);
				request.setAttribute("rList", rankList);
				request.setAttribute("qrList", qrankList);
				
				ActionForward forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("study/study_status_view.jsp");
				
				
				return forward;
	}

}