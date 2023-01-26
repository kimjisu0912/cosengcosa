package com.cosengcosa.room.domain;

import java.sql.Timestamp;

/**
 * 추천이력
 * @author 김지수
 *
 */
public class Recommend {

	private int rcdNo;
	private String rcdMid;
	private String rcdCmcode;
	private Timestamp rcdCdate;
	private String rcdGood;
	
	// 생성자
	public Recommend() {}
	public Recommend(int rcdNo, String rcdMid, String rcdCmcode, Timestamp rcdCdate, String rcdGood) {
		this.rcdNo = rcdNo;
		this.rcdMid = rcdMid;
		this.rcdCmcode = rcdCmcode;
		this.rcdCdate = rcdCdate;
		this.rcdGood = rcdGood;
	}
	public int getRcdNo() {
		return rcdNo;
	}
	public void setRcdNo(int rcdNo) {
		this.rcdNo = rcdNo;
	}
	public String getRcdMid() {
		return rcdMid;
	}
	public void setRcdMid(String rcdMid) {
		this.rcdMid = rcdMid;
	}
	public String getRcdCmcode() {
		return rcdCmcode;
	}
	public void setRcdCmcode(String rcdCmcode) {
		this.rcdCmcode = rcdCmcode;
	}
	public Timestamp getRcdCdate() {
		return rcdCdate;
	}
	public void setRcdCdate(Timestamp rcdCdate) {
		this.rcdCdate = rcdCdate;
	}
	public String getRcdGood() {
		return rcdGood;
	}
	public void setRcdGood(String rcdGood) {
		this.rcdGood = rcdGood;
	}
	
}
