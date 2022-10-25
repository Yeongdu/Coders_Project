package com.coders.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.lang.reflect.Constructor;
import java.util.Properties;
import java.util.StringTokenizer;

import javax.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class FrontController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request,
            HttpServletResponse response) throws IOException, ServletException {

		// 한글 인코딩 처리
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

		// getRequestURI() : "/프로젝트명/파일명(*.do)" 라는
		//                   문자열을 반환해 주는 메서드.
        String uri = request.getRequestURI();
        System.out.println("URI >>> " + uri);

        // getContextPath() : 현재 프로젝트명을 문자열로
     	//                    반환해 주는 메서드.
        String path = request.getContextPath();
        System.out.println("Path >>> " + path);

        String command = uri.substring(path.length() + 1);
        System.out.println("Command >>> " + command);


        Action action = null;
        ActionForward forward = null;

        Properties pro = new Properties();
		
        /*
		 * java.util.Properties 클래스
		 * - Properties 클래스는 HashTable의 하위 클래스.
		 * - 보통은 환경변수 및 속성 값을 Properties 파일에
		 *   저장하여 쉽게 접근할 수 있는 장점이 있음.
		 * - Properties 파일은 일련의 키(key) - 값(value)의
		 *   한 쌍으로 이루어져 있음.
		 * - 보통은 파일에 저장하여 사용을 함. 파일 이름을
		 *   *.properties 이름으로 끝나게 함.
		 * - FileInputStream 클래스에 Properties 파일을 인자로
		 *   넣어서 그 스트림으로부터 파일을 가져올 때 많이 사용함.
		 *   인자로 들어온 Properties 파일을 읽게 됨.
		 * - 읽어 들일 때 사용하는 메서드는 load() 라는 메서드를
		 *   이용하여 파일을 읽어 들이게 됨.
		 */
	
		FileInputStream fis = 
				new FileInputStream("D:\\git\\project\\src\\com\\coders\\controller\\mapping.properties");

	        pro.load(fis);

	        String value = pro.getProperty(command);
	        System.out.println("Value >>> " + value);

	        if(value.substring(0, 7).equals("execute")) {
	            StringTokenizer st = 
	                    new StringTokenizer(value, "|");

	            String url_1 = st.nextToken();  // "execute"
	            String url_2 = st.nextToken();  // "패키지명.클래스명"
			
	            try {
	                Class<?> url = Class.forName(url_2);

	                // 첫번째 방법 (deptrcated - 더 이상 사용되지 않는)
					// action = (Action)url.newInstance();
					
					// getContructor() : 파라미터가 없는 기본생성자를
					//                   가져오는 메서드.
	                Constructor<?> constructor = 
	                                url.getConstructor();

	                action = (Action)constructor.newInstance();

	                forward = action.execute(request, response);
	                System.out.println("FrontController forward >>> " + forward);


	            } catch (Exception e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            }
	        }else {  // value 揶쏅�れ뵠 "execute" 揶쏉옙 占쎈툡占쎈빒 野껋럩�뒭
	        	// view page로 이동
	            forward = new ActionForward();
	            forward.setRedirect(false);
	            forward.setPath(value);
	        }


	        if(forward != null) {
	            if(forward.isRedirect()) {  // true인 경우
	                response.sendRedirect(forward.getPath());
	            }else {  // false인 경우 view page로 이동
	                request.getRequestDispatcher(forward.getPath()).forward(request, response);
	            }
	        }

	    }  // service() 筌롫뗄苑뚳옙諭� end

	}