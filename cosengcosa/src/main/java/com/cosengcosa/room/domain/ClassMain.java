package com.cosengcosa.room.domain;

import java.sql.Timestamp;

/**
 * 메인강의
 * @author 박예준
 *
 */

public class ClassMain {

	private int cmNo;
	private String cmId;
	private String cmCode;
	private String cmTitle;
	private String cmName;
	private Timestamp cmSdate;
	private Timestamp cmEdate;
	private int cmPrice;
	private int cmCount;
	private int cmRecommend;
	private int cmStar;
	private String file1;
	private String video;
	private String cmYn;
	
	// 생성자
	public ClassMain() {}
	public ClassMain(int cmNo, String cmId, String cmCode, String cmTitle, String cmName, Timestamp cmSdate, Timestamp cmEdate,
			 int cmPrice, int cmCount, int cmRecommend, int cmStar, String file1, String video, String cmYn) {
		this.cmNo = cmNo;
		this.cmId = cmId;
		this.cmCode = cmCode;
		this.cmTitle = cmTitle;
		this.cmName = cmName;
		this.cmSdate = cmSdate;
		this.cmEdate = cmEdate;
		this.cmPrice = cmPrice;
		this.cmCount = cmCount;
		this.cmRecommend = cmRecommend;
		this.cmStar = cmStar;
		this.file1 = file1;
		this.video = video;
		this.cmYn = cmYn;
	}
	public int getCmNo() {
		return cmNo;
	}
	public void setCmNo(int cmNo) {
		this.cmNo = cmNo;
	}
	public String getCmId() {
		return cmId;
	}
	public void setCmId(String cmId) {
		this.cmId = cmId;
	}
	public String getCmCode() {
		return cmCode;
	}
	public void setCmCode(String cmCode) {
		this.cmCode = cmCode;
	}
	public String getCmName() {
		return cmName;
	}
	public void setCmName(String cmName) {
		this.cmName = cmName;
	}
	public Timestamp getCmSdate() {
		return cmSdate;
	}
	public void setCmSdate(Timestamp cmSdate) {
		this.cmSdate = cmSdate;
	}
	public Timestamp getCmEdate() {
		return cmEdate;
	}
	public void setCmEdate(Timestamp cmEdate) {
		this.cmEdate = cmEdate;
	}
	public int getCmPrice() {
		return cmPrice;
	}
	public void setCmPrice(int cmPrice) {
		this.cmPrice = cmPrice;
	}
	public int getCmCount() {
		return cmCount;
	}
	public void setCmCount(int cmCount) {
		this.cmCount = cmCount;
	}
	public int getCmRecommend() {
		return cmRecommend;
	}
	public void setCmRecommend(int cmRecommend) {
		this.cmRecommend = cmRecommend;
	}
	public int getCmStar() {
		return cmStar;
	}
	public void setCmStar(int cmStar) {
		this.cmStar = cmStar;
	}
	public String getFile1() {
		return file1;
	}
	public void setFile1(String file1) {
		this.file1 = file1;
	}
	public String getVideo() {
		return video;
	}
	public void setVideo(String video) {
		this.video = video;
	}
	public String getCmYn() {
		return cmYn;
	}
	public void setCmYn(String cmYn) {
		this.cmYn = cmYn;
	}
	public String getCmTitle() {
		return cmTitle;
	}
	public void setCmTitle(String cmTitle) {
		this.cmTitle = cmTitle;
	}
	
}
