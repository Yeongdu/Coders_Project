package com.studyboard.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coders.controller.Action;
import com.coders.controller.ActionForward;
import com.coders.model.StudyBoardDAO;
import com.coders.model.StudyBoardDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class StudyBoardModifyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 수정 폼 페이지에서 넘어온 데이터들을 DB에 저장하는 비지니스 로직
		
		StudyBoardDTO dto = new StudyBoardDTO();
		
		
		 //파일 업로드 시 설정 내용
	      //1.파일 저장 경로 지정
	      String saveFolder = "C:\\Users\\user1\\git\\Coders_Project\\SemiProject\\WebContent\\study_upload";
	      
	      
	      
	      //2.첨부파일 크기 지정
	      int fileSize = 10 * 1024 * 1024;   //10MB
	      
	      //3.MultipartRequest 객체 생성
	      //  ==> 파일을 업로드하기 위한 객체 생성
	      MultipartRequest multi = new MultipartRequest(
	            request,       //일반적인 request 객체
	            saveFolder,    //첨부파일이 저장될 경로
	            fileSize,       //업로드할 첨부파일의 최대 크기
	            "UTF-8",      //문자 인코딩 방식
	            new DefaultFileRenamePolicy());   //파일 이름이 같은 경우 중복되지 않게 설정하는 생성자
	      
	      String studyboard_writer = 
	      multi.getParameter("studyboard_writer").trim();
	      
	      String studyboard_title = 
	      multi.getParameter("studyboard_title").trim();
	      
	      String studyboard_cont = 
	      multi.getParameter("studyboard_cont").trim();
	      
	      File studyboard_file = 
	      multi.getFile("studyboard_file");
	      
	      //히든으로 넘어온 값 받아주기
	      
	      int studyboard_no = 
	      Integer.parseInt(multi.getParameter("studyboard_no").trim());
	      
	      //첨부파일이 존재하지 않은 경우
	      if(studyboard_file != null) {
	    	  
	    	String fileName = studyboard_file.getName();
	    	
	    	 
	    	  //날짜 객체 생성
	    	  Calendar cal = Calendar.getInstance();
	    	  
	    	  int year = cal.get(Calendar.YEAR);
	    	  
	    	  int month = cal.get(Calendar.MONTH) + 1;
	    	  
	    	  int day = cal.get(Calendar.DAY_OF_MONTH);
	    	  
	    	  //....../upload/2022-10-11
	    	 String homedir = 
	    	  saveFolder+"/"+year+"-"+month+"-"+day;
	    	 
	    	 //날짜 폴더를 만들어 보자.
	    	 File path1 = new File(homedir);
	    	 
	    	 if(!path1.exists()) { //폴더가 존재하지 않는 경우
	    		 path1.mkdir();    //실제 폴더를 만들어 주는 메서드
	    		 
	    		 
	    	 }
	    	 
	    	//파일을 만들어 보자 ==> 예) 홍길동_ 파일명
	    	 //......./upload/2022-10-11/홍길동_파일명
	    	 String reFileName = 
	    			 studyboard_writer+"_"+fileName;
	    	 
	    	 studyboard_file.renameTo(new File(homedir+"/"+reFileName));
	    	 
	    	 //실제로 DB에 저장되는 파일 이름
	    	 //"/2022-10-11/홍길동_파일명"으로 저장할 예정.
	    	 String fileDBName = 
	    	 "/"+year+"-"+month+"-"+day+"/"+reFileName;
	    	 
	    	 dto.setStudy_file(fileDBName);
	    	
	    }
	      
	      dto.setStudy_num(studyboard_no);
	      
	      dto.setStudy_title(studyboard_title);
	      
	      dto.setStudy_writer(studyboard_writer);
	      
	      dto.setStudy_cont(studyboard_cont);
	      
	      
	      
	      StudyBoardDAO dao = StudyBoardDAO.getInstance();
	      
	      int res = dao.modifyStudyboard(dto);
	      
	      
	      ActionForward forward = new ActionForward();
	      
	     PrintWriter out = response.getWriter();
	     
	     if(res > 0) {
	    	  forward.setRedirect(true);
	    	  
	    	  forward.setPath("studyBoard_content.do?no="+studyboard_no);
	      }else {
	    	  out.println("<script>");
	    	  out.println("alert('실패')");
	    	  out.println("history.back()");
	    	  out.println("</script>");
	    	  
	      }
	      
	      
	      
	      
	      
		return forward;
	}

}
