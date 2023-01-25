package com.cosengcosa.room.domain;

import java.sql.Timestamp;

public class FreeBoard {

	private int fNo;
	private String fTitle, fContent, fWriter, fYn; 
	private Timestamp fCdate;
	
	public FreeBoard() {}
	public FreeBoard(int f_no,String f_title,String f_content,String f_writer,String f_yn, Timestamp f_cdate) {
		this.fNo = f_no;
		this.fTitle = f_title;
		this.fContent = f_content;
		this.fWriter = f_writer;
		this.fYn = f_yn;
		this.fCdate = f_cdate;
	}
	public int getfNo() {
		return fNo;
	}
	public void setfNo(int fNo) {
		this.fNo = fNo;
	}
	public String getfTitle() {
		return fTitle;
	}
	public void setfTitle(String fTitle) {
		this.fTitle = fTitle;
	}
	public String getfContent() {
		return fContent;
	}
	public void setfContent(String fContent) {
		this.fContent = fContent;
	}
	public String getfWriter() {
		return fWriter;
	}
	public void setfWriter(String fWriter) {
		this.fWriter = fWriter;
	}
	public String getfYn() {
		return fYn;
	}
	public void setfYn(String fYn) {
		this.fYn = fYn;
	}
	public Timestamp getfCdate() {
		return fCdate;
	}
	public void setfCdate(Timestamp fCdate) {
		this.fCdate = fCdate;
	}
	
	
	
}
