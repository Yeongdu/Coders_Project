package com.user.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.coders.controller.Action;
import com.coders.controller.ActionForward;
import com.coders.model.UserDAO;
import com.oreilly.servlet.MultipartRequest;

public class CodersProfileFileUploadAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		HttpSession session = request.getSession();
		
		String saveFolder = "D:\\git\\Coders_Project\\WebContent\\upload";

		int fileSize = 20 * 1024 * 1024; // 20MB

		MultipartRequest multi = new MultipartRequest(request, saveFolder, fileSize, "UTF-8");
		
		String id = (String)session.getAttribute("userId");

		String file = multi.getFilesystemName("file").trim();
		
		PrintWriter out = response.getWriter();
		
		String extension = file.substring(file.length() - 3);
		
		if(extension.equals("jpg") || extension.equals("png") || extension.equals("gif")) {
			UserDAO dao = UserDAO.getInstance();
			
			dao.userFileUpload(id, file);
			
		}else {
			
			String result = "-1";
			out.println(result);

		}
		
		return null;
	}

}
