package com.cosengcosa.room.domain;

import java.sql.Timestamp;

public class Study {
	
	private int s_no, s_id, s_count, s_recommend, s_star;
	private String s_code, s_title, s_askcontent, s_askimg, s_answer, s_answerimg, s_askid, s_answerid, s_file, s_open, s_clear, s_yn;
	private Timestamp s_cdate;
	
	public Study() {}
	public Study(int s_no, int s_id, int s_count, int s_recommend, int s_star, String s_code, String s_title, String s_askcontent, String s_askimg, 
			String s_answer, String s_answerimg, String s_askid, String s_answerid, String s_file, String s_open, String s_clear, String s_yn, Timestamp s_cdate ) {
		
		this.s_no = s_no;
		this.s_id = s_id;
		this.s_count = s_count;
		this.s_recommend = s_recommend;
		this.s_star = s_star;
		this.s_code = s_code;
		this.s_title = s_title;
		this.s_askcontent = s_askcontent;
		this.s_askimg = s_askimg;
		this.s_answer = s_answer;
		this.s_answerimg = s_answerimg;
		this.s_askid = s_askid;
		this.s_answerid = s_answerid;
		this.s_file = s_file;
		this.s_open = s_open;
		this.s_clear = s_clear;
		this.s_yn = s_yn;
		this.s_cdate = s_cdate;
				
		
	}
	
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	public int getS_id() {
		return s_id;
	}
	public void setS_id(int s_id) {
		this.s_id = s_id;
	}
	public int getS_count() {
		return s_count;
	}
	public void setS_count(int s_count) {
		this.s_count = s_count;
	}
	public int getS_recommend() {
		return s_recommend;
	}
	public void setS_recommend(int s_recommend) {
		this.s_recommend = s_recommend;
	}
	public int getS_star() {
		return s_star;
	}
	public void setS_star(int s_star) {
		this.s_star = s_star;
	}
	public String getS_code() {
		return s_code;
	}
	public void setS_code(String s_code) {
		this.s_code = s_code;
	}
	public String getS_title() {
		return s_title;
	}
	public void setS_title(String s_title) {
		this.s_title = s_title;
	}
	public String getS_askcontent() {
		return s_askcontent;
	}
	public void setS_askcontent(String s_askcontent) {
		this.s_askcontent = s_askcontent;
	}
	public String getS_askimg() {
		return s_askimg;
	}
	public void setS_askimg(String s_askimg) {
		this.s_askimg = s_askimg;
	}
	public String getS_answer() {
		return s_answer;
	}
	public void setS_answer(String s_answer) {
		this.s_answer = s_answer;
	}
	public String getS_answerimg() {
		return s_answerimg;
	}
	public void setS_answerimg(String s_answerimg) {
		this.s_answerimg = s_answerimg;
	}
	public String getS_askid() {
		return s_askid;
	}
	public void setS_askid(String s_askid) {
		this.s_askid = s_askid;
	}
	public String getS_answerid() {
		return s_answerid;
	}
	public void setS_answerid(String s_answerid) {
		this.s_answerid = s_answerid;
	}
	public String getS_file() {
		return s_file;
	}
	public void setS_file(String s_file) {
		this.s_file = s_file;
	}
	public String getS_open() {
		return s_open;
	}
	public void setS_open(String s_open) {
		this.s_open = s_open;
	}
	public String getS_clear() {
		return s_clear;
	}
	public void setS_clear(String s_clear) {
		this.s_clear = s_clear;
	}
	public String getS_yn() {
		return s_yn;
	}
	public void setS_yn(String s_yn) {
		this.s_yn = s_yn;
	}
	public Timestamp getS_cdate() {
		return s_cdate;
	}
	public void setS_cdate(Timestamp s_cdate) {
		this.s_cdate = s_cdate;
	}

	
}
