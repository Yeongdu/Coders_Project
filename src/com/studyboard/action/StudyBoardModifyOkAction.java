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
		// �닔�젙 �뤌 �럹�씠吏��뿉�꽌 �꽆�뼱�삩 �뜲�씠�꽣�뱾�쓣 DB�뿉 ���옣�븯�뒗 鍮꾩��땲�뒪 濡쒖쭅
		
		StudyBoardDTO dto = new StudyBoardDTO();
		
		
		 //�뙆�씪 �뾽濡쒕뱶 �떆 �꽕�젙 �궡�슜
	      //1.�뙆�씪 ���옣 寃쎈줈 吏��젙
	      String saveFolder = "D:\\git\\project\\WebContent\\study_upload";
	      
	      
	      
	      //2.泥⑤��뙆�씪 �겕湲� 吏��젙
	      int fileSize = 10 * 1024 * 1024;   //10MB
	      
	      //3.MultipartRequest 媛앹껜 �깮�꽦
	      //  ==> �뙆�씪�쓣 �뾽濡쒕뱶�븯湲� �쐞�븳 媛앹껜 �깮�꽦
	      MultipartRequest multi = new MultipartRequest(
	            request,       //�씪諛섏쟻�씤 request 媛앹껜
	            saveFolder,    //泥⑤��뙆�씪�씠 ���옣�맆 寃쎈줈
	            fileSize,       //�뾽濡쒕뱶�븷 泥⑤��뙆�씪�쓽 理쒕� �겕湲�
	            "UTF-8",      //臾몄옄 �씤肄붾뵫 諛⑹떇
	            new DefaultFileRenamePolicy());   //�뙆�씪 �씠由꾩씠 媛숈� 寃쎌슦 以묐났�릺吏� �븡寃� �꽕�젙�븯�뒗 �깮�꽦�옄
	      
	      String study_title = 
	      multi.getParameter("study_title").trim();
	      
	      String studyboard_cont = 
	      multi.getParameter("study_cont").trim();
	      
	      int study_people = Integer.parseInt(multi.getParameter("study_people").trim());
	      String study_start = multi.getParameter("study_start").trim();
	      String study_end = multi.getParameter("study_end").trim();
	
	      
	      File studyboard_file = multi.getFile("study_file");
	      
	      //�엳�뱺�쑝濡� �꽆�뼱�삩 媛� 諛쏆븘二쇨린
	      int studyboard_no = 
	      Integer.parseInt(multi.getParameter("study_no").trim());
	      
	      //泥⑤��뙆�씪�씠 議댁옱�븯吏� �븡�� 寃쎌슦
			if (studyboard_file != null) {
				String study_file = multi.getFilesystemName("study_file");
				dto.setStudy_file(study_file);
			}
			
	      dto.setStudy_num(studyboard_no);
	      dto.setStudy_title(study_title);
	      dto.setStudy_cont(studyboard_cont);
	      dto.setStudy_people(study_people);
	      dto.setStudy_start(study_start);
	      dto.setStudy_end(study_end);
	         
	      StudyBoardDAO dao = StudyBoardDAO.getInstance();
	      
	      int res = dao.modifyStudyboard(dto);
	      
	      
	      ActionForward forward = new ActionForward();
	      
	     PrintWriter out = response.getWriter();
	     
	     if(res > 0) {
	    	  forward.setRedirect(true);
	    	  forward.setPath("studyBoard_content.do?no="+studyboard_no);
	     
	     }else {
	    	  out.println("<script>");
	    	  out.println("alert('�떎�뙣')");
	    	  out.println("history.back()");
	    	  out.println("</script>");
	      }
		return forward;
	}

}