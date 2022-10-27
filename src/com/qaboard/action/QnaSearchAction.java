package com.qaboard.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coders.controller.Action;
import com.coders.controller.ActionForward;
import com.coders.model.QnaDAO;
import com.coders.model.QnaDTO;

public class QnaSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String search_keyword = request.getParameter("search_keyword").trim();
		
		// 페이징 처리 작업 진행
		// 한 페이지당 보여질 게시물의 수
		int rowsize = 10;
		// 아래에 보여질 페이지의 최대 블럭 수 - 예) [1][2][3] / [4][5][6] / [7][8][9] / ....
		int block = 3;
		
		// DB상의 게시물의 전체 수
		int totalRecord = 0;
		// 전체 페이지 수 - 전체 게시물의 수 / 한 페이지 당 보여질 게시물의 수
		int allPage = 0;
		
		int page = 1;		// 현재 페이지 변수
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page").trim());
		}
		
		// 해당 페이지에서 시작 번호
		int startNo = (page * rowsize) - (rowsize -1);
		
		// 해당 페이지에서 마지막 번호
		int endNo = (page * rowsize);
		
		// 해당 페이지에서 시작 블럭
		int startBlock = (((page - 1) / block) * block) + 1;
		
		// 해당 페이지에서 끝 블럭
		int endBlock = (((page - 1) / block) * block) + block;
		
		
		QnaDAO dao = QnaDAO.getInstance();
		
		// DB상의 검색 게시물의 수를 확인하는 메서드 호출
		totalRecord = dao.searchListCount(search_keyword);
		
		// 검색 페이지의 수 : 검색 게시물의 수를 한 페이지당 보여질 게시물의 수로 나누기
		// 검색 페이지 수가 나올 때 나머지가 있으면 무조건 페이지 수 + 1(나머지 값이 들어올 부분)
		allPage = (int)Math.ceil(totalRecord / (double)rowsize);
		
		if(endBlock > allPage) {
			endBlock = allPage;
		}
		
		// 현재 페이지에 해당하는 검색 게시물을 가져오는 메서드 호출
		List<QnaDTO> searchList = dao.searchQnaList(search_keyword, page, rowsize);
		
		// 페이징 처리 시 작업했던 모든 값들을 viewpage로 이동
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
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("qna/qna_main_search.jsp");
		
		return forward;
	}

}
