package com.cosengcosa.room.domain;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class MyClassMain {
	private int mymNo, mymPeriod, mymPrice;
	private String mymMid, mymCode, mymTitle, mymName, mymDone, mymYN, image;
	private Timestamp mymSdate, mymEdate;
	private String sdate, edate;
	private int num;
	private Double progress;
	
	
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public void setSdate() {
		SimpleDateFormat form = new SimpleDateFormat("yyyy/MM/dd");
		sdate = form.format(mymSdate);
	}
	public String getEdate() {
		return edate;
	}
	public void setEdate(String edate) {
		this.edate = edate;
	}
	public void setEdate() {
		SimpleDateFormat form = new SimpleDateFormat("yyyy/MM/dd");
		edate = form.format(mymEdate);
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getMymNo() {
		return mymNo;
	}
	public void setMymNo(int mymNo) {
		this.mymNo = mymNo;
	}
	public int getMymPeriod() {
		return mymPeriod;
	}
	public void setMymPeriod(int mymPeriod) {
		this.mymPeriod = mymPeriod;
	}
	public int getMymPrice() {
		return mymPrice;
	}
	public void setMymPrice(int mymPrice) {
		this.mymPrice = mymPrice;
	}
	public String getMymMid() {
		return mymMid;
	}
	public void setMymMid(String mymMid) {
		this.mymMid = mymMid;
	}
	public String getMymCode() {
		return mymCode;
	}
	public void setMymCode(String mymCode) {
		this.mymCode = mymCode;
	}
	public String getMymTitle() {
		return mymTitle;
	}
	public void setMymTitle(String mymTitle) {
		this.mymTitle = mymTitle;
	}
	public String getMymName() {
		return mymName;
	}
	public void setMymName(String mymName) {
		this.mymName = mymName;
	}
	public String getMymDone() {
		return mymDone;
	}
	public void setMymDone(String mymDone) {
		this.mymDone = mymDone;
	}
	public String getMymYN() {
		return mymYN;
	}
	public void setMymYN(String mymYN) {
		this.mymYN = mymYN;
	}
	public Timestamp getMymSdate() {
		return mymSdate;
	}
	public void setMymSdate(Timestamp mymSdate) {
		this.mymSdate = mymSdate;
		setSdate();
	}
	public Timestamp getMymEdate() {
		return mymEdate;
	}
	public void setMymEdate(Timestamp mymEdate) {
		this.mymEdate = mymEdate;
		setEdate();
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public Double getProgress() {
		return progress;
	}
	public void setProgress(Double progress) {
		this.progress = progress;
	}
	
	
	
}
