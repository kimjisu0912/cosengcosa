package com.cosengcosa.room.domain;

import java.sql.Timestamp;

public class FreeBoardCmt {

	private int fcNo, fcNum;
	private String fcWriter, fcContent, fcYn;
	private Timestamp fcCdate;
	
	public FreeBoardCmt() {}
	public FreeBoardCmt(int fc_no, int fc_num, String fc_writer, String fc_content, String fc_yn,Timestamp fc_cdate) {
		this.fcNo = fc_no;
		this.fcNum = fc_num;
		this.fcWriter = fc_writer;
		this.fcContent = fc_content;
		this.fcYn = fc_yn;
		this.fcCdate = fc_cdate;
	}
	public int getFcNo() {
		return fcNo;
	}
	public void setFcNo(int fcNo) {
		this.fcNo = fcNo;
	}
	public String getFcWriter() {
		return fcWriter;
	}
	public void setFcWriter(String fcWriter) {
		this.fcWriter = fcWriter;
	}
	public String getFcContent() {
		return fcContent;
	}
	public void setFcContent(String fcContent) {
		this.fcContent = fcContent;
	}
	public String getFcYn() {
		return fcYn;
	}
	public void setFcYn(String fcYn) {
		this.fcYn = fcYn;
	}
	public Timestamp getFcCdate() {
		return fcCdate;
	}
	public void setFcCdate(Timestamp fcCdate) {
		this.fcCdate = fcCdate;
	}
	public int getFcNum() {
		return fcNum;
	}
	public void setFcNum(int fcNum) {
		this.fcNum = fcNum;
	}

	
}
