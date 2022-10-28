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

        // 占쎈립疫뀐옙 占쎌뵥�굜遺얜뎃 筌ｌ꼶�봺
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        // getRequestURI() : "/占쎈늄嚥≪뮇�젰占쎈뱜筌륅옙/占쎈솁占쎌뵬筌륅옙(*.do)" 占쎌뵬占쎈뮉
        //                   �눧紐꾩쁽占쎈였占쎌뱽 獄쏆꼹�넎占쎈퉸 雅뚯눖�뮉 筌롫뗄苑뚳옙諭�.
        String uri = request.getRequestURI();
        System.out.println("URI >>> " + uri);

        // getContextPath() : 占쎌겱占쎌삺 占쎈늄嚥≪뮇�젰占쎈뱜筌뤿굞�뱽 �눧紐꾩쁽占쎈였嚥∽옙
        //                    獄쏆꼹�넎占쎈퉸 雅뚯눖�뮉 筌롫뗄苑뚳옙諭�.
        String path = request.getContextPath();
        System.out.println("Path >>> " + path);

        String command = uri.substring(path.length() + 1);
        System.out.println("Command >>> " + command);


        Action action = null;
        ActionForward forward = null;

        Properties pro = new Properties();
		
		/*
		 * java.util.Properties 占쎄깻占쎌삋占쎈뮞
		 * - Properties 占쎄깻占쎌삋占쎈뮞占쎈뮉 HashTable占쎌벥 占쎈릭占쎌맄 占쎄깻占쎌삋占쎈뮞.
		 * - 癰귣똾�꽰占쏙옙 占쎌넎野껋럥占쏙옙�땾 獄쏉옙 占쎈꺗占쎄쉐 揶쏅�れ뱽 Properties 占쎈솁占쎌뵬占쎈퓠
		 *   占쏙옙占쎌삢占쎈릭占쎈연 占쎈뤊野껓옙 占쎌젔域뱀눛釉� 占쎈땾 占쎌뿳占쎈뮉 占쎌삢占쎌젎占쎌뵠 占쎌뿳占쎌벉.
		 * - Properties 占쎈솁占쎌뵬占쏙옙 占쎌뵬占쎌졃占쎌벥 占쎄텕(key) - 揶쏉옙(value)占쎌벥
		 *   占쎈립 占쎈솂占쎌몵嚥∽옙 占쎌뵠�뙴�뫁堉깍옙議� 占쎌뿳占쎌벉.
		 * - 癰귣똾�꽰占쏙옙 占쎈솁占쎌뵬占쎈퓠 占쏙옙占쎌삢占쎈릭占쎈연 占쎄텢占쎌뒠占쎌뱽 占쎈맙. 占쎈솁占쎌뵬 占쎌뵠�뵳袁⑹뱽
		 *   *.properties 占쎌뵠�뵳袁⑹몵嚥∽옙 占쎄국占쎄돌野껓옙 占쎈맙.
		 * - FileInputStream 占쎄깻占쎌삋占쎈뮞占쎈퓠 Properties 占쎈솁占쎌뵬占쎌뱽 占쎌뵥占쎌쁽嚥∽옙
		 *   占쎄퐫占쎈선占쎄퐣 域뱄옙 占쎈뮞占쎈뱜�뵳�눘�몵嚥≪뮆占쏙옙苑� 占쎈솁占쎌뵬占쎌뱽 揶쏉옙占쎌죬占쎌궞 占쎈르 筌띾‘�뵠 占쎄텢占쎌뒠占쎈맙.
		 *   占쎌뵥占쎌쁽嚥∽옙 占쎈굶占쎈선占쎌궔 Properties 占쎈솁占쎌뵬占쎌뱽 占쎌뵭野껓옙 占쎈쭡.
		 * - 占쎌뵭占쎈선 占쎈굶占쎌뵬 占쎈르 占쎄텢占쎌뒠占쎈릭占쎈뮉 筌롫뗄苑뚳옙諭띰옙�뮉 load() 占쎌뵬占쎈뮉 筌롫뗄苑뚳옙諭띄몴占�
		 *   占쎌뵠占쎌뒠占쎈릭占쎈연 占쎈솁占쎌뵬占쎌뱽 占쎌뵭占쎈선 占쎈굶占쎌뵠野껓옙 占쎈쭡.
		 */
	
		FileInputStream fis = 
				new FileInputStream("D:\\git\\Project\\src\\com\\coders\\controller\\mapping.properties");

	        pro.load(fis);

	        String value = pro.getProperty(command);
	        System.out.println("Value >>> " + value);

	        if(value.substring(0, 7).equals("execute")) {
	            StringTokenizer st = 
	                    new StringTokenizer(value, "|");

	            String url_1 = st.nextToken();  // "execute"
	            String url_2 = st.nextToken();  // "占쎈솭占쎄텕筌욑옙筌륅옙.占쎄깻占쎌삋占쎈뮞筌륅옙"
			
	            try {
	                Class<?> url = Class.forName(url_2);

	                // 筌ｃ꺂苡뀐쭪占� 獄쎻뫖苡� (deprecated - 占쎈쐭 占쎌뵠占쎄맒 占쎄텢占쎌뒠占쎈┷筌욑옙 占쎈륫占쎈뮉)
	                // action = (Action)url.newInstance();

	                // getContructor() : 占쎈솁占쎌뵬沃섎챸苑ｅ첎占� 占쎈씨占쎈뮉 疫꿸퀡�궚占쎄문占쎄쉐占쎌쁽�몴占�
	                //                   揶쏉옙占쎌죬占쎌궎占쎈뮉 筌롫뗄苑뚳옙諭�.
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
	            // view page嚥∽옙 占쎌뵠占쎈짗
	            forward = new ActionForward();
	            forward.setRedirect(false);
	            forward.setPath(value);
	        }


	        if(forward != null) {
	            if(forward.isRedirect()) {  // true占쎌뵥 野껋럩�뒭
	                response.sendRedirect(forward.getPath());
	            }else {  // false占쎌뵥 野껋럩�뒭 view page嚥∽옙 占쎌뵠占쎈짗
	                request.getRequestDispatcher(forward.getPath()).forward(request, response);
	            }
	        }

	    }  // service() 筌롫뗄苑뚳옙諭� end

	}