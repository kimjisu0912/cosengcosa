package com.cosengcosa.room.domain;

import java.sql.Timestamp;

public class Study {
	
	private int sNo, sCount, sRecommend;
	private String sError,sCode, sTitle, sAskcontent, sAskimg, sAnswer, sAnswerimg, sAskid, sAnswerid, sFile, sOpen, sClear, sYn;
	private Timestamp sCdate;
	
	public Study() {}
	public Study(int s_no, int s_id, int s_count, int s_recommend, int s_star, String s_code, String s_title,String s_error, String s_askcontent, String s_askimg, 
			String s_answer, String s_answerimg, String s_askid, String s_answerid, String s_file, String s_open, String s_clear, String s_yn, Timestamp s_cdate ) {
		
		this.sNo = s_no;
		this.sCount = s_count;
		this.sRecommend = s_recommend;
		this.sCode = s_code;
		this.sError = s_error;
		this.sTitle = s_title;
		this.sAskcontent = s_askcontent;
		this.sAskimg = s_askimg;
		this.sAnswer = s_answer;
		this.sAnswerimg = s_answerimg;
		this.sAskid = s_askid;
		this.sAnswerid = s_answerid;
		this.sFile = s_file;
		this.sOpen = s_open;
		this.sClear = s_clear;
		this.sYn = s_yn;
		this.sCdate = s_cdate;
				
		
	}
	public int getsNo() {
		return sNo;
	}
	public void setsNo(int sNo) {
		this.sNo = sNo;
	}
	public int getsCount() {
		return sCount;
	}
	public void setsCount(int sCount) {
		this.sCount = sCount;
	}
	public int getsRecommend() {
		return sRecommend;
	}
	public void setsRecommend(int sRecommend) {
		this.sRecommend = sRecommend;
	}
	public String getsError() {
		return sError;
	}
	public void setsError(String sError) {
		this.sError = sError;
	}
	public String getsCode() {
		return sCode;
	}
	public void setsCode(String sCode) {
		this.sCode = sCode;
	}
	public String getsTitle() {
		return sTitle;
	}
	public void setsTitle(String sTitle) {
		this.sTitle = sTitle;
	}
	public String getsAskcontent() {
		return sAskcontent;
	}
	public void setsAskcontent(String sAskcontent) {
		this.sAskcontent = sAskcontent;
	}
	public String getsAskimg() {
		return sAskimg;
	}
	public void setsAskimg(String sAskimg) {
		this.sAskimg = sAskimg;
	}
	public String getsAnswer() {
		return sAnswer;
	}
	public void setsAnswer(String sAnswer) {
		this.sAnswer = sAnswer;
	}
	public String getsAnswerimg() {
		return sAnswerimg;
	}
	public void setsAnswerimg(String sAnswerimg) {
		this.sAnswerimg = sAnswerimg;
	}
	public String getsAskid() {
		return sAskid;
	}
	public void setsAskid(String sAskid) {
		this.sAskid = sAskid;
	}
	public String getsAnswerid() {
		return sAnswerid;
	}
	public void setsAnswerid(String sAnswerid) {
		this.sAnswerid = sAnswerid;
	}
	public String getsFile() {
		return sFile;
	}
	public void setsFile(String sFile) {
		this.sFile = sFile;
	}
	public String getsOpen() {
		return sOpen;
	}
	public void setsOpen(String sOpen) {
		this.sOpen = sOpen;
	}
	public String getsClear() {
		return sClear;
	}
	public void setsClear(String sClear) {
		this.sClear = sClear;
	}
	public String getsYn() {
		return sYn;
	}
	public void setsYn(String sYn) {
		this.sYn = sYn;
	}
	public Timestamp getsCdate() {
		return sCdate;
	}
	public void setsCdate(Timestamp sCdate) {
		this.sCdate = sCdate;
	}
	
	
	
}
