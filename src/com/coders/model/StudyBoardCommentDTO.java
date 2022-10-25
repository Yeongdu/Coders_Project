package com.coders.model;

public class StudyBoardCommentDTO {

	private int scomment_num;
	private int study_num;
	private String scomment_writer;
	private String scomment_cont;
	private String scomment_date;
	private String scomment_update;
	
	   
	public int getScomment_num() {
		return scomment_num;
	}
	public void setScomment_num(int scomment_num) {
		this.scomment_num = scomment_num;
	}
	public int getStudy_num() {
		return study_num;
	}
	public void setStudy_num(int study_num) {
		this.study_num = study_num;
	}
	public String getScomment_writer() {
		return scomment_writer;
	}
	public void setScomment_writer(String scomment_writer) {
		this.scomment_writer = scomment_writer;
	}
	public String getScomment_cont() {
		return scomment_cont;
	}
	public void setScomment_cont(String scomment_cont) {
		this.scomment_cont = scomment_cont;
	}
	public String getScomment_date() {
		return scomment_date;
	}
	public void setScomment_date(String scomment_date) {
		this.scomment_date = scomment_date;
	}
	public String getScomment_update() {
		return scomment_update;
	}
	public void setScomment_update(String scomment_update) {
		this.scomment_update = scomment_update;
	}
	
}