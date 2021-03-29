package com.kh.herb.faq.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.kh.herb.faq.model.vo.Faq;

public interface FaqService {

	// 목록 (페이지 나누기, 검색 기능 포함)
	// 매개변수는 시작 레코드 번호, 끝번호, 옵션과 키워드가 들어간다
	public List<Faq> listAll(String keyword, int start, int end) throws Exception;

	public int insertFaq(Faq faq) throws Exception;

	public void increaseViewcnt(int faqNum, HttpSession session) throws Exception;

	public Faq read(int faqNum) throws Exception;
	
	
	public int deleteFaq(int faqNum) throws Exception;

	public int getTotalNum() throws Exception;

	public int updateFaq(Faq faq) throws Exception;


}