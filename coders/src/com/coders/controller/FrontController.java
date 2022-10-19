package com.coders.controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Constructor;
import java.util.Properties;
import java.util.StringTokenizer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qaboard.action.Action;
import com.qaboard.action.ActionForward;


public class FrontController extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String uri = request.getRequestURI();
		String path = request.getContextPath();
		String command = uri.substring(path.length()+1);
		
		Action action = null;
		ActionForward forward = null;
		
		Properties pro = new Properties();
		
		/*
		 * java.util.Properties 클래스
		 * 	- Properties 클래스는 HashTable의 하위 클래스
		 * 	- 보통은 환경변수 및 속성 값을 Properties파일에 저장하여 쉽게 접근할 수 있는 장점.
		 * 	- Properties파일은 일련의 key - value한 쌍으로 이루어져 있다.
		 * 	- 보통 파일에 저장해서 사용한다. 파일 이름을 *.properties 이름으로 끝나게 한다.
		 * 	- FileInputStream클래스에 Properties 파일을 인자로 넣어 그 스트림으로부터 파일을 가져올 때 많이 사용 
		 * 	- 인자로 들어온 파일을 읽게한다.
		 * 	- 읽어들일 때 사용하는 메소드는 load()
		 */
		
		FileInputStream fis = new FileInputStream
				("C:\\NCS\\workspace(jsp_project)\\coders\\src\\com\\coders\\controller\\mapping.properties");
		
		pro.load(fis);
		String value = pro.getProperty(command);
		System.out.println(value);
		
		if(value.substring(0, 7).equals("execute")) {
			StringTokenizer st = new StringTokenizer(value, "|");
			
			String url_1 = st.nextToken(); //token
			String url_2 = st.nextToken(); //패키지명. 클래스명

			
			/*
			 * 동적 객체 생성 (newInstance() )
			 * 	- class객체 이용 시 new 연산자 사용 없이 동적 객체 생성 가능
			 * 	- 코드 작성 시 클래스 이름 결정 x, 런타임 (실행) 시 클래스 이름이 결정되는 경우 유용하게 사용
			 * 	- newIntance() 메소드는 기본생성자 호출해 객체 생성하기때문에 반드시 클래스에 기본생성자 존재해야 함.
			 * 	- 예외 발생 경우 > 해당 클래스 추상클래스이거나 인터페이스일경우
			 * 					클래스 생성자ㅏ 접근제한자로 인해 접근할 수 없는 경우
			 * 	- 반환 타입은 Object 타입이므로 맞게 형변환해주면 되지만, 클래스 타입을 모르는 상태이므로 형변환 x.
			 * 		이러한 문제를 해결하기 위해 인터페이스 사용. 
			 * 
			 * 	- Class.forName(class 이름) 은 파라미터로 받은 class 이름에 해당하는 클래스를 로딩 후, 그 클래스에
			 * 		해당하는 인스턴스 리턴.
			 * 	- newInstance() 메소드는 로딩한 클래스 객체 생성, 이렇게 생성된 객체 > 동적 객체 생성
			 */
			
			try {
				
				Class<?> url = Class.forName(url_2);
				
				//첫번째 방법(deptracated > 더 이상 사용되지 않는
				//action = (Action)url.newInstance();
				
				//getConstructor(): 파라미터가 없는 기본 생성자를 가져오는 메소드. 
				Constructor<?> constructor = url.getConstructor();
				
				action = (Action)constructor.newInstance();
				
				forward = action.execute(request, response);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		} else { //value 값이 "execute"가 아닌 경우 view페이지로 이동
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath(value);
		}
		
		if(forward != null) {
			if(forward.isRedirect()) {//true인 경우 
				response.sendRedirect(forward.getPath());
			}else { //false인 경우 
				RequestDispatcher rd =  request.getRequestDispatcher(forward.getPath());
				rd.forward(request, response);
			}
			
		}
		
		
	}

}
