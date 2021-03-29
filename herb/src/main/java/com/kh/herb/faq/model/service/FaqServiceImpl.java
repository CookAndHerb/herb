package com.kh.herb.faq.model.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.herb.faq.model.dao.FaqDAO;
import com.kh.herb.faq.model.vo.Faq;

@Service
public class FaqServiceImpl implements FaqService {

	@Autowired
	private FaqDAO faqDao;

	
	@Override
	public List<Faq> listAll(String keyword, int start, int end) throws Exception {
		return faqDao.listAll(keyword, start, end);
	} 

	
	@Override
	public int insertFaq(Faq faq) throws Exception {
		return faqDao.insertFaq(faq);
	}


	@Override
	public void increaseViewcnt(int faqNum, HttpSession session) throws Exception {
		// 조회수 증가 처리
		long updateTime = 0; //null 방지 위해 초기값을 null로 설정
		if(session.getAttribute("updateTime"+faqNum)!=null) {
			// 최근에 조회수를 올린 시간이 null이 아니면
			updateTime = (long)session.getAttribute("updateTime"+faqNum);
		}
		long currentTime = System.currentTimeMillis();
		// 일정 시간이 경과한 후 조회수 증가 처리
		if(currentTime - updateTime > 3 * 1000) {
			//조회수가 1 증가했을 때 3초 후에 다시 클릭해야 조회수가 다시 1 증가
			faqDao.increaseViewcnt(faqNum);
			// 조회수 올린 시간 저장
			session.setAttribute("updateTime"+faqNum,currentTime);
		}
	}


	@Override
	public Faq read(int faqNum) throws Exception {
		return faqDao.read(faqNum);
	}


	@Override
	public int deleteFaq(int faqNum) throws Exception {
		return faqDao.deleteFaq(faqNum);
	}


	@Override
	public int getTotalNum() throws Exception {
		return faqDao.getTotalNum();
	}


	@Override
	public int updateFaq(Faq faq) throws Exception {
		return faqDao.updateFaq(faq);
	}



	
	
	
}
