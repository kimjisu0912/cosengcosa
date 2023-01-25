package com.cosengcosa.room.domain;

import java.sql.Timestamp;

public class RequestBoard {

	private int no;
	private String code, title, content, writer, answer, open, yn, rCount;
	private Timestamp cdate;
	
	public RequestBoard() {}
	public RequestBoard(int r_no,String r_code,String r_title,String r_content,String r_writer,String r_answer,String r_open,String r_yn, Timestamp r_cdate, String r_count) {
		this.no = r_no;
		this.code = r_code;
		this.title = r_title;
		this.content = r_content;
		this.writer = r_writer;
		this.answer = r_answer;
		this.open = r_open;
		this.yn = r_yn;
		this.cdate = r_cdate;
		this.rCount = r_count;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getOpen() {
		return open;
	}
	public void setOpen(String open) {
		this.open = open;
	}
	public String getYn() {
		return yn;
	}
	public void setYn(String yn) {
		this.yn = yn;
	}
	public Timestamp getCdate() {
		return cdate;
	}
	public void setCdate(Timestamp cdate) {
		this.cdate = cdate;
	}
	public String getrCount() {
		return rCount;
	}
	public void setrCount(String rCount) {
		this.rCount = rCount;
	}
	
	

}
