package com.cosengcosa.room.domain;

import java.sql.Timestamp;

/**
 * 서브강의
 * @author 김지수
 *
 */

public class ClassSub {
	
	private int csNo;
	private String csId;
	private String csCode;
	private String csGroup;
	private String csName;
	private String csContent;
	private Timestamp csSdate;
	private Timestamp csEdate;
	private int csCount;
	private int csRecommend;
	private int csStar;
	private String csVideo;
	private String csRuntime;
	private String csYn;
	
	// 생성자
	public ClassSub() {}
	public ClassSub(int csNo, String csId, String csCode, String csGroup, String csName, String csContent,
			Timestamp csSdate, Timestamp csEdate, int csCount, int csRecommend, int csStar, String csVideo,
			String csRuntime, String csYn) {
		this.csNo = csNo;
		this.csId = csId;
		this.csCode = csCode;
		this.csGroup = csGroup;
		this.csName = csName;
		this.csContent = csContent;
		this.csSdate = csSdate;
		this.csEdate = csEdate;
		this.csCount = csCount;
		this.csRecommend = csRecommend;
		this.csStar = csStar;
		this.csVideo = csVideo;
		this.csRuntime = csRuntime;
		this.csYn = csYn;
	}
	public int getCsNo() {
		return csNo;
	}
	public void setCsNo(int csNo) {
		this.csNo = csNo;
	}
	public String getCsId() {
		return csId;
	}
	public void setCsId(String csId) {
		this.csId = csId;
	}
	public String getCsCode() {
		return csCode;
	}
	public void setCsCode(String csCode) {
		this.csCode = csCode;
	}
	public String getCsGroup() {
		return csGroup;
	}
	public void setCsGroup(String csGroup) {
		this.csGroup = csGroup;
	}
	public String getCsName() {
		return csName;
	}
	public void setCsName(String csName) {
		this.csName = csName;
	}
	public String getCsContent() {
		return csContent;
	}
	public void setCsContent(String csContent) {
		this.csContent = csContent;
	}
	public Timestamp getCsSdate() {
		return csSdate;
	}
	public void setCsSdate(Timestamp csSdate) {
		this.csSdate = csSdate;
	}
	public Timestamp getCsEdate() {
		return csEdate;
	}
	public void setCsEdate(Timestamp csEdate) {
		this.csEdate = csEdate;
	}
	public int getCsCount() {
		return csCount;
	}
	public void setCsCount(int csCount) {
		this.csCount = csCount;
	}
	public int getCsRecommend() {
		return csRecommend;
	}
	public void setCsRecommend(int csRecommend) {
		this.csRecommend = csRecommend;
	}
	public int getCsStar() {
		return csStar;
	}
	public void setCsStar(int csStar) {
		this.csStar = csStar;
	}
	public String getCsVideo() {
		return csVideo;
	}
	public void setCsVideo(String csVideo) {
		this.csVideo = csVideo;
	}
	public String getCsRuntime() {
		return csRuntime;
	}
	public void setCsRuntime(String csRuntime) {
		this.csRuntime = csRuntime;
	}
	public String getCsYn() {
		return csYn;
	}
	public void setCsYn(String csYn) {
		this.csYn = csYn;
	}
}
