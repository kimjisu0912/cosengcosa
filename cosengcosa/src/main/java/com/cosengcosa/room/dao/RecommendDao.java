package com.cosengcosa.room.dao;

/**
 * 추천이력 Dao 인터페이스
 * @author 김지수
 *
 */
public interface RecommendDao {

	// 추천이력 입력 ajax 요청시 호출되는 메소드
	public abstract int insertRecommend(String cmcode, String userid);
	
	// 추천이력 업데이트 ajax 요청시 호출되는 메소드
	public abstract void classMainRecommendUpdate(String cmcode);
	
	// 추천 이력 확인 ajax 요청시 호출되는 메소드
	public abstract int recommendCount(String cmcode, String userid);
}
