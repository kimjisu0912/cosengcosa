package com.cosengcosa.room.service;

/**
 * 추천이력 서비스 인터페이스
 * @author 김지수
 *
 */
public interface RecommendService {

	/*
	 * 추천이력을 RecommendDao에 호출 메소드
	 */
	public abstract String insertRecommend(String cmcode, String userid);
}
