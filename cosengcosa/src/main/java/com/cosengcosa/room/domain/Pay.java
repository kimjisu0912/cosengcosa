package com.cosengcosa.room.domain;

import java.sql.Timestamp;

/**
 * 결재
 * @author 김지수
 *
 */

public class Pay {
	
	private int pNo;
	private String pId;
	private String pMid;
	private int pCmno;
	private String pCmcode;
	private String pCname;
	private String pChk;
	private int pPrice;
	private Timestamp pCdate;
	private String pYn;
	
	// 생성자
	public Pay() {}
	public Pay(int pNo, String pId, String pMid, int pCmno, String pCmcode, 
			String pCname, String pChk, int pPrice, Timestamp pCdate, String pYn) {
		this.pNo = pNo;
		this.pId = pId;
		this.pMid = pMid;
		this.pCmno = pCmno;
		this.pCmcode = pCmcode;
		this.pCname = pCname;
		this.pChk = pChk;
		this.pPrice = pPrice;
		this.pCdate = pCdate;
		this.pYn = pYn;
	}
	public int getpNo() {
		return pNo;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
	public String getpId() {
		return pId;
	}
	public void setpId(String pId) {
		this.pId = pId;
	}
	public String getpMid() {
		return pMid;
	}
	public void setpMid(String pMid) {
		this.pMid = pMid;
	}
	public int getpCmno() {
		return pCmno;
	}
	public void setpCmno(int pCmno) {
		this.pCmno = pCmno;
	}
	public String getpCmcode() {
		return pCmcode;
	}
	public void setpCmcode(String pCmcode) {
		this.pCmcode = pCmcode;
	}
	public String getpCname() {
		return pCname;
	}
	public void setpCname(String pCname) {
		this.pCname = pCname;
	}
	public String getpChk() {
		return pChk;
	}
	public void setpChk(String pChk) {
		this.pChk = pChk;
	}
	public int getpPrice() {
		return pPrice;
	}
	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}
	public Timestamp getpCdate() {
		return pCdate;
	}
	public void setpCdate(Timestamp pCdate) {
		this.pCdate = pCdate;
	}
	public String getpYn() {
		return pYn;
	}
	public void setpYn(String pYn) {
		this.pYn = pYn;
	}
}
