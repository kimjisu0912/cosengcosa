package com.cosengcosa.room.domain;

import java.sql.Timestamp;

public class FreeBoardCmt {

	private int fc_no, fc_fid, fc_grp, fc_grps, fc_grpl;
	private String fc_writer, fc_content, fc_yn;
	private Timestamp fc_cdate;
	
	public FreeBoardCmt() {}
	public FreeBoardCmt(int fc_no, int fc_fid, int fc_grp, int fc_grps, int fc_grpl, String fc_writer, String fc_content, String fc_yn,Timestamp fc_cdate) {
		this.fc_no = fc_no;
		this.fc_fid = fc_fid;
		this.fc_grp = fc_grp;
		this.fc_grps = fc_grps;
		this.fc_grpl = fc_grpl;
		this.fc_writer = fc_writer;
		this.fc_content = fc_content;
		this.fc_yn = fc_yn;
		this.fc_cdate = fc_cdate;
	}

	public int getFc_no() {
		return fc_no;
	}

	public void setFc_no(int fc_no) {
		this.fc_no = fc_no;
	}

	public int getFc_fid() {
		return fc_fid;
	}

	public void setFc_fid(int fc_fid) {
		this.fc_fid = fc_fid;
	}

	public int getFc_grp() {
		return fc_grp;
	}

	public void setFc_grp(int fc_grp) {
		this.fc_grp = fc_grp;
	}

	public int getFc_grps() {
		return fc_grps;
	}

	public void setFc_grps(int fc_grps) {
		this.fc_grps = fc_grps;
	}

	public int getFc_grpl() {
		return fc_grpl;
	}

	public void setFc_grpl(int fc_grpl) {
		this.fc_grpl = fc_grpl;
	}

	public String getFc_writer() {
		return fc_writer;
	}

	public void setFc_writer(String fc_writer) {
		this.fc_writer = fc_writer;
	}

	public String getFc_content() {
		return fc_content;
	}

	public void setFc_content(String fc_content) {
		this.fc_content = fc_content;
	}

	public String getFc_yn() {
		return fc_yn;
	}

	public void setFc_yn(String fc_yn) {
		this.fc_yn = fc_yn;
	}

	public Timestamp getFc_cdate() {
		return fc_cdate;
	}

	public void setFc_cdate(Timestamp fc_cdate) {
		this.fc_cdate = fc_cdate;
	}
	
	
	
}
