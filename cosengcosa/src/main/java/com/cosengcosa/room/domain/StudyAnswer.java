package com.cosengcosa.room.domain;

import java.sql.Timestamp;

public class StudyAnswer {

	private int saNo, saNum; 
	private String saAnswer, saAnswerimg, saAnswerid;
	private Timestamp saCdate;
	
	public StudyAnswer() { }
	public StudyAnswer(int saNum, String saAnswer, String saAnswerimg, String saAnswerid) { 
		this.saNum = saNum;
		this.saAnswer = saAnswer;
		this.saAnswerimg = saAnswerimg;
		this.saAnswerid = saAnswerid;
	}
	
	public StudyAnswer(int sa_no,int sa_num,String sa_answer,String  sa_answerimg,String  sa_answerid,Timestamp sa_cdate) {
		this.saNo = sa_no;
		this.saNum = sa_num;
		this.saAnswer = sa_answer;
		this.saAnswerimg = sa_answerimg;
		this.saAnswerid = sa_answerid;
		this.saCdate = sa_cdate;
		
	}

	public int getSaNo() {
		return saNo;
	}

	public void setSaNo(int saNo) {
		this.saNo = saNo;
	}

	public int getSaNum() {
		return saNum;
	}

	public void setSaNum(int saNum) {
		this.saNum = saNum;
	}

	public String getSaAnswer() {
		return saAnswer;
	}

	public void setSaAnswer(String saAnswer) {
		this.saAnswer = saAnswer;
	}

	public String getSaAnswerimg() {
		return saAnswerimg;
	}

	public void setSaAnswerimg(String saAnswerimg) {
		this.saAnswerimg = saAnswerimg;
	}

	public String getSaAnswerid() {
		return saAnswerid;
	}

	public void setSaAnswerid(String saAnswerid) {
		this.saAnswerid = saAnswerid;
	}

	public Timestamp getSaCdate() {
		return saCdate;
	}

	public void setSaCdate(Timestamp saCdate) {
		this.saCdate = saCdate;
	}

	
	
}
