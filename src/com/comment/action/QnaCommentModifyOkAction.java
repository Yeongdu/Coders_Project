package com.comment.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coders.controller.Action;
import com.coders.controller.ActionForward;

public class QnaCommentModifyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int qcomment_modify_no = Integer.parseInt(request.getParameter("qcomment_num").trim());
		String qcomment_modify_cont = request.getParameter("qcomment_cont").trim();
		String qcomment_modify_code = request.getParameter("qcomment_code").trim();
		
		System.out.println("��۹�ȣ>>> " + qcomment_modify_no);
		System.out.println("��� ���� ����>>> " + qcomment_modify_cont);
		System.out.println("��� ���� �ڵ�>>> " + qcomment_modify_code);

		

		return null;
	}

}
