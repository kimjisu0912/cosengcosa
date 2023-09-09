package com.cosengcosa.room.domain;

public class Dmtb {

	private int dmtbNo;
	private String dmtbName;
	private String dmtbCode;
	
	// 생성자
	public Dmtb() {}
	
	public Dmtb(int dmtbNo, String dmtbName, String dmtbCode) {
		this.dmtbNo = dmtbNo;
		this.dmtbName = dmtbName;
		this.dmtbCode = dmtbCode;
	}
	
	public int getDmtbNo() {
		return dmtbNo;
	}

	public void setDmtbNo(int dmtbNo) {
		this.dmtbNo = dmtbNo;
	}

	public String getDmtbName() {
		return dmtbName;
	}

	public void setDmtbName(String dmtbName) {
		this.dmtbName = dmtbName;
	}

	public String getDmtbCode() {
		return dmtbCode;
	}

	public void setDmtbCode(String dmtbCode) {
		this.dmtbCode = dmtbCode;
	}
	
}
