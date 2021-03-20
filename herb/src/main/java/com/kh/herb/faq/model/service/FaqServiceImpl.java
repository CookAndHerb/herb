package com.kh.herb.faq.model.service;

import java.util.List;

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

	/*
	@Override
	public int insertFaq(Faq faq) {
		// TODO Auto-generated method stub
		return 0;
	}*/
	
}
