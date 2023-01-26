package com.cosengcosa.room.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cosengcosa.room.dao.RecommendDao;

/**
 * 추천이력 서비스
 * @author 김지수
 *
 */
@Service
public class RecommendServiceImpl implements RecommendService {

	@Autowired
	private RecommendDao recommendDao;
	public void setRecommendDao(RecommendDao recommendDao) {
		this.recommendDao = recommendDao;
	}
	/*
	 * 추천 이력등록 서비스
	 */
	@Override
	public String insertRecommend(String cmcode, String userid) {
		
		String goodOk = "";
		// 추천 이력 확인
		int goodNum = recommendDao.recommendCount(cmcode, userid);
		if(goodNum > 0) {
			goodOk = "N";
		}else {
			// 추천 이력 등록
			int goodCnt = recommendDao.insertRecommend(cmcode, userid);
			if(goodCnt > 0) {
				// 추천 이력 등록 성공 시 해당 강의 추천수 올라감
				recommendDao.classMainRecommendUpdate(cmcode);
				goodOk = "Y";
			}else {
				goodOk = "F";
			}
		}
		
		return goodOk;
	}

}
