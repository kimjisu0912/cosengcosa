package com.cosengcosa.room.domain;

import java.sql.Timestamp;

public class FreeBoardCmt {

	private int fcNo, fcFid, fcGrp, fcGrps, fcGrpl;
	private String fcWriter, fcContent, fcYn;
	private Timestamp fcCdate;
	
	public FreeBoardCmt() {}
	public FreeBoardCmt(int fc_no, int fc_fid, int fc_grp, int fc_grps, int fc_grpl, String fc_writer, String fc_content, String fc_yn,Timestamp fc_cdate) {
		this.fcNo = fc_no;
		this.fcFid = fc_fid;
		this.fcGrp = fc_grp;
		this.fcGrps = fc_grps;
		this.fcGrpl = fc_grpl;
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
	public int getFcFfid() {
		return fcFid;
	}
	public void setFcFfid(int fcFfid) {
		this.fcFid = fcFfid;
	}
	public int getFcGrp() {
		return fcGrp;
	}
	public void setFcGrp(int fcGrp) {
		this.fcGrp = fcGrp;
	}
	public int getFcGrps() {
		return fcGrps;
	}
	public void setFcGrps(int fcGrps) {
		this.fcGrps = fcGrps;
	}
	public int getFcGrpl() {
		return fcGrpl;
	}
	public void setFcGrpl(int fcGrpl) {
		this.fcGrpl = fcGrpl;
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

	
}
