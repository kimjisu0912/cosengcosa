package com.cosengcosa.room.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cosengcosa.room.dao.DmtbDao;
import com.cosengcosa.room.domain.Dmtb;

/**
 * 장바구니 서비스
 * @author 박예준/김지수
 *
 */
@Service
public class DmtbServiceImpl implements DmtbService {

	// DAO 생성자 생성
	@Autowired
	private DmtbDao dmtbDao;
	
	public void setDmtbDao(DmtbDao dmtbDao) {
		this.dmtbDao = dmtbDao;
	}
	
	/*
	 * 리스트 서비스
	 */
	@Override
	public List<Dmtb> dmtbList(String userId, String userName) {
		return dmtbDao.dmtbList(userId, userName);
	}

	@Override
	public void dmtbDel() {
		dmtbDao.dmtbDel();
	}

	@Override
	public void dmtbAdd(String[] dmtbNameArr, String[] dmtbCodeArr) {
		int arrLength = dmtbNameArr.length;
		for(int i=0; i<arrLength; i++) {
			int dmtbNumber = i+1;
			String dmtbNo = String.valueOf(dmtbNumber);
			String dmtbName = dmtbNameArr[i];
			String dmtbCode = dmtbCodeArr[i];
			dmtbDao.dmtbAdd(dmtbNo, dmtbName, dmtbCode);
		}
		
	}

	
}
