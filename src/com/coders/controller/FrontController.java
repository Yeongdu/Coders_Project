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
    			
    			FileInputStream fis = 
    				new FileInputStream("D:\\git\\Coders_Project\\src\\com\\coders\\controller\\mapping.properties");
    			
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
    			}else {  // value 값이 "execute" 가 아닌 경우
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
    			

    		}  // service() 메서드 end
    
}


   