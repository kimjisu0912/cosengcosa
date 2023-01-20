package com.cosengcosa.room.domain;

public class Basket {

	private int baNo;
	private String baMid;
	private String baName;
	private String baCmcode;
	private String baCname;
	private int baPrice;
	
	// 생성자
	public Basket() {}
	public Basket(int baNo, String baMid, String baName, String baCmcode, String baCname, int baPrice) {
		this.baNo = baNo;
		this.baMid = baMid;
		this.baName = baName;
		this.baCmcode = baCmcode;
		this.baCname = baCname;
		this.baPrice = baPrice;
	}
	public int getBaNo() {
		return baNo;
	}
	public void setBaNo(int baNo) {
		this.baNo = baNo;
	}
	public String getBaMid() {
		return baMid;
	}
	public void setBaMid(String baMid) {
		this.baMid = baMid;
	}
	public String getBaName() {
		return baName;
	}
	public void setBaName(String baName) {
		this.baName = baName;
	}
	public String getBaCmcode() {
		return baCmcode;
	}
	public void setBaCmcode(String baCmcode) {
		this.baCmcode = baCmcode;
	}
	public String getBaCname() {
		return baCname;
	}
	public void setBaCname(String baCname) {
		this.baCname = baCname;
	}
	public int getBaPrice() {
		return baPrice;
	}
	public void setBaPrice(int baPrice) {
		this.baPrice = baPrice;
	}
}
