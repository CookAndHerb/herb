package com.kh.herb.qa.model.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.herb.qa.model.dao.QaDAO;
import com.kh.herb.qa.model.vo.Qa;

@Service
public class QaServiceImpl implements QaService {

	@Autowired
	QaDAO qaDao;
	
	@Override
	public int getTotalNum() throws Exception {
		return qaDao.getTotalNum();
	}

	@Override
	public List<Qa> listAll(String selectMenu, String keyword, int start, int end) throws Exception {
		return qaDao.listAll(selectMenu,keyword,start,end);
	}

	@Override
	public int insertQa(Qa qa) throws Exception {
		return qaDao.insertQa(qa);
	}

	@Override
	public int getRef() throws Exception {
		return qaDao.getRef();
	}

	@Override
	public void increaseViewcnt(int qaNum, HttpSession session) throws Exception {
		// 조회수 증가 처리
		long updateTime = 0; //null 방지 위해 초기값을 null로 설정
		if(session.getAttribute("updateTime"+qaNum)!=null) {
			// 최근에 조회수를 올린 시간이 null이 아니면
			updateTime = (long)session.getAttribute("updateTime"+qaNum);
		}
		long currentTime = System.currentTimeMillis();
		// 일정 시간이 경과한 후 조회수 증가 처리
		if(currentTime - updateTime > 3 * 1000) {
			//조회수가 1 증가했을 때 3초 후에 다시 클릭해야 조회수가 다시 1 증가
			qaDao.increaseViewcnt(qaNum);
			// 조회수 올린 시간 저장
			session.setAttribute("updateTime"+qaNum,currentTime);
		}
		
	}

	@Override
	public Qa read(int qaNum) throws Exception {
		return qaDao.read(qaNum);
	}

	@Override
	public String getQaPassword(int qaNum) throws Exception {
		return qaDao.getQaPassword(qaNum);
	}

	@Override
	public int updateQa(Qa qa) throws Exception {
		return qaDao.updateQa(qa);
	}

	@Override
	public int deleteQa(int qaNum) throws Exception {
		return qaDao.deleteQa(qaNum);
	}

	@Override
	public void reStepCount(Qa qa) throws Exception {
		qaDao.reStepCount(qa);
	}

	@Override
	public int reInsert(Qa qa) throws Exception {
		return qaDao.reInsert(qa);
	}


	

}
