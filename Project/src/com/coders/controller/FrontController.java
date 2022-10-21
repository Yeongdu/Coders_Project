package com.coders.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.lang.reflect.Constructor;
import java.util.Properties;
import java.util.StringTokenizer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FrontController extends HttpServlet{
	
private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException  {
		
		// �ѱ� ���ڵ� ó��
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset =UTF-8");
		
		String uri = request.getRequestURI();
		
		String path = request.getContextPath();
		
		String command = uri.substring(path.length()+1);
		
		Action action = null;
		ActionForward forward = null;
		
		Properties pro = new Properties();
		/*
		 * �� java.util.Properties Ŭ����
		 * 		- Properties Ŭ������ HashTable�� ���� Ŭ����
		 * 		- ������ ȯ�溯�� �� �Ӽ� ���� Properties ���Ͽ� �����Ͽ� ���� ������ �� �ִ� ������ �ִ�.
		 * 		- Properties ������ �Ϸ��� Ű(key) - ��(value)�� �� ������ �̷���� �ִ�.
		 * 		- ������ ���Ͽ� �����Ͽ� ����Ѵ�.
		 * 		  ���� �̸��� *.properties �̸����� ������ �Ѵ�.
		 *		- FileInputStream Ŭ������ Properties ������ ���ڷ� �־ �� ��Ʈ�����κ��� ������ ������ �� ���� ����Ѵ�.
		 *		  ���ڷ� ���� Properties ������ �а� �ȴ�.
		 *		- �о� ���� �� ����ϴ� �޼���� load() ��� �޼��带 �̿��Ͽ� ������ �о� ���̰� �ȴ�.
		 */
		FileInputStream fis = new FileInputStream("C:\\Users\\user1\\Desktop\\Project\\src\\com\\coders\\controller\\mapping.properties");
		// mapping.properties�� *.do�� *.do�� ��θ� ���� ���� FileinputStream�� �̿��� mapping.properties�� �ҷ��´�.
		
		pro.load(fis);
		String value = pro.getProperty(command);
		
		if(value.substring(0,7).equals("execute")) {
			StringTokenizer st = new StringTokenizer(value, "|");
			
			String url_1 = st.nextToken();    // "execute"
			String url_2 = st.nextToken();    // "��Ű����.Ŭ������"
			
			/*
			 * �� ���� ��ü ���� : newInstance()
			 * 		- Class ��ü�� �̿��ϸ� new �������� ��� ���� �������� ��ü ������ �����ϴ�.

			 * 		- �ڵ� �ۼ� �ÿ� Ŭ������ �̸��� ������ �� ����, ��Ÿ��(����) �ÿ� Ŭ������ �̸��� �����Ǵ� ��쿡 �����ϴ�.
			 * 
			 *  	- newInstance() �޼���� �⺻�����ڸ� ȣ���ؼ� ��ü�� �����ϱ� ������ �ݵ�� Ŭ������ �⺻�����ڰ� �����ؾ��Ѵ�.
			 *  	  ���ܰ� �߻��� �� �ִµ� �ش� Ŭ������ �߻�Ŭ�����̰ų� �������̽��� ��� �߻��ϰ�, 
			 *  	  �� �ϳ��� ���ܴ� Ŭ������ �����ڰ� ���������ڷ� ���� ������ �� ���� ��쿡 �߻��Ѵ�.
			 *  	  ���� ���� ó���� ���־���Ѵ�.
			 * 	
			 * 		- ��ȯ Ÿ���� Object Ÿ���̹Ƿ� ����ȯ�� ���ָ� ������, Ŭ������ Ÿ���� �𸣴� �����̹Ƿ� ����ȯ�� �� �ټ� ����.
			 * 		  �̷��� ������ �ذ��ϱ� ���� �������̽��� ����ϴ� ���̴�. 
			 * 
			 * 		- Class.forName(class �̸�)�� �Ķ���ͷ� ���� class �̸��� �ش��ϴ� Ŭ������ �ε��� �� �� Ŭ������ �ش��ϴ� �ν��Ͻ��� ������ �ش�.
			 * 		  newInstance() �޼���� �ε��� Ŭ������ ��ü�� �����ϴ� �޼����̰�, �̷��� ������ ��ü�� ���� ��ü �����̶���Ѵ�.
			 */
			
			try {
				Class<?> url = Class.forName(url_2); 		// ���� ó�� �� throws �Ұ�
				// ���׸��� �𸣴� ��� "?"�� �̿��Ͽ� ó��
				
				// ù��° ���(deptrcated - �� �̻� ������ �ʴ�)
				// action = (Action)url.newInstance();
				
				// �ι�° ���
				// getConstructor() : �Ķ���Ͱ� ���� �⺻ �����ڸ� �������� �޼���
				Constructor<?> construtor = url.getConstructor();
				action = (Action)construtor.newInstance();
				
				forward = action.execute(request, response);
							// ��ü�� ������ ������ ��ȯ��Ų �ּҰ�
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else { // value ���� "execute"�� �ƴ� ��� viewpage�� �̵�
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath(value);
			
		}
		
		if(forward != null) {
			if(forward.isRedirect()) { // isRedirect()�� true�� ���
				response.sendRedirect(forward.getPath());
			}else { // isRedirect()�� false�� ��� viewpage�� �̵�
				RequestDispatcher rd = request.getRequestDispatcher(forward.getPath());
				rd.forward(request, response);
			}
		}
		
	} // service() �޼����� end

}
