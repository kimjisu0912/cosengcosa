package com.cosengcosa.room.domain;

import java.sql.Timestamp;

/**
 * 서브강의
 * @author 김지수
 *
 */

public class ClassSub {
	
	private int csNo;
	private String csCode;
	private String csGroup;
	private String csTitle;
	private String csContent;
	private String csVideo;
	private String csRuntime;
	private String csYn;
	
	// 생성자
	public ClassSub() {}
	public ClassSub(int csNo, String csCode, String csGroup, String csTitle, String csContent,
			String csVideo, String csRuntime, String csYn) {
		this.csNo = csNo;
		this.csCode = csCode;
		this.csGroup = csGroup;
		this.csTitle = csTitle;
		this.csContent = csContent;
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
	public String getCsTitle() {
		return csTitle;
	}
	public void setCsTitle(String csTitle) {
		this.csTitle = csTitle;
	}
	public String getCsContent() {
		return csContent;
	}
	public void setCsContent(String csContent) {
		this.csContent = csContent;
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
