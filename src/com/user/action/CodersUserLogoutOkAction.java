package com.user.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.coders.controller.Action;
import com.coders.controller.ActionForward;

public class CodersUserLogoutOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		HttpSession session = request.getSession();
		
		ActionForward forward = new ActionForward();
		
		String token = (String)session.getAttribute("token");
		
		System.out.println("if 진입 전 토근 값 >>> " + token);
		
		// http://localhost:8282/SemiProject/user_login_ok.do?id=qjqtkwns1@naver.com&nickname=%EC%A0%95%EC%98%81%ED%9B%88&token=kakao
		// http://localhost:8282/SemiProject/user_login_ok.do?id=wjddudgns9414@naver.com&nickname=%EC%A0%95%EC%98%81%ED%9B%88&token=naver
		
		if(token.equals("naver")) {
			System.out.println("토근 값 >>> " + token);
			
			System.out.println("http://nid.naver.com/nidlogin.logout");
			
			session.invalidate();
			
			forward.setRedirect(false);
			
			forward.setPath("main.jsp");
			
		}else if(token.equals("kakao")){
			System.out.println("토근 값 >>> " + token);
			
			System.out.println("메인으로 이동");
			
			session.invalidate();
			
			forward.setRedirect(false);
			
			forward.setPath("main.jsp");
		
		}
		
		return forward;
	}

}
