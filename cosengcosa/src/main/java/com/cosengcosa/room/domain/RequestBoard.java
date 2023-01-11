package com.cosengcosa.room.domain;

import java.sql.Timestamp;

public class RequestBoard {

	private int r_no;
	private String r_code, r_title, r_content, r_writer, r_answer, r_open, r_yn;
	private Timestamp r_cdate;
	
	public RequestBoard() {}
	public RequestBoard(int r_no,String r_code,String r_title,String r_content,String r_writer,String r_answer,String r_open,String r_yn, Timestamp r_cdate) {
		this.r_no = r_no;
		this.r_code = r_code;
		this.r_title = r_title;
		this.r_content = r_content;
		this.r_writer = r_writer;
		this.r_answer = r_answer;
		this.r_open = r_open;
		this.r_yn = r_yn;
		this.r_cdate = r_cdate;
	}

	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public String getR_code() {
		return r_code;
	}

	public void setR_code(String r_code) {
		this.r_code = r_code;
	}

	public String getR_title() {
		return r_title;
	}

	public void setR_title(String r_title) {
		this.r_title = r_title;
	}

	public String getR_content() {
		return r_content;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content;
	}

	public String getR_writer() {
		return r_writer;
	}

	public void setR_writer(String r_writer) {
		this.r_writer = r_writer;
	}

	public String getR_answer() {
		return r_answer;
	}

	public void setR_answer(String r_answer) {
		this.r_answer = r_answer;
	}

	public String getR_open() {
		return r_open;
	}

	public void setR_open(String r_open) {
		this.r_open = r_open;
	}

	public String getR_yn() {
		return r_yn;
	}

	public void setR_yn(String r_yn) {
		this.r_yn = r_yn;
	}

	public Timestamp getR_cdate() {
		return r_cdate;
	}

	public void setR_cdate(Timestamp r_cdate) {
		this.r_cdate = r_cdate;
	}
	
	
	

}
