package com.cosengcosa.room.domain;

import java.sql.Timestamp;

public class FreeBoard {

	private int f_no;
	private String f_title, f_content, f_writer, f_yn; 
	private Timestamp f_cdate;
	
	public FreeBoard() {}
	public FreeBoard(int f_no,String f_title,String f_content,String f_writer,String f_yn, Timestamp f_cdate) {
		this.f_no = f_no;
		this.f_title = f_title;
		this.f_content = f_content;
		this.f_writer = f_writer;
		this.f_yn = f_yn;
		this.f_cdate = f_cdate;
	}

	public int getF_no() {
		return f_no;
	}

	public void setF_no(int f_no) {
		this.f_no = f_no;
	}

	public String getF_title() {
		return f_title;
	}

	public void setF_title(String f_title) {
		this.f_title = f_title;
	}

	public String getF_content() {
		return f_content;
	}

	public void setF_content(String f_content) {
		this.f_content = f_content;
	}

	public String getF_writer() {
		return f_writer;
	}

	public void setF_writer(String f_writer) {
		this.f_writer = f_writer;
	}

	public String getF_yn() {
		return f_yn;
	}

	public void setF_yn(String f_yn) {
		this.f_yn = f_yn;
	}

	public Timestamp getF_cdate() {
		return f_cdate;
	}

	public void setF_cdate(Timestamp f_cdate) {
		this.f_cdate = f_cdate;
	}
	

}
