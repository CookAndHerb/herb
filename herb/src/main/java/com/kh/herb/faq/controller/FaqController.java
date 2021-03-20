package com.kh.herb.faq.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.herb.faq.model.vo.Faq;
import com.kh.herb.faq.model.vo.Pager;
import com.kh.herb.faq.model.service.FaqService;

@Controller
public class FaqController {

	@Autowired
	private FaqService faqService;
	
	// 로깅을 위한 변수
	//private static final Logger logger = LoggerFactory.getLogger(FaqController.class);
	
	// faq 리스트
	@RequestMapping(value="faqList.do", method=RequestMethod.GET)
	public ModelAndView faqList(@RequestParam(defaultValue="1") int curPage,
				@RequestParam(defaultValue="") String keyword) throws Exception {
		
		// 레코드 갯수를 계산   -- > TODO : 수정하기!!!!
		int count = 1000;
		
		// 페이지 관련 설정, 시작 번호와 끝번호를 구해서 각각 변수에 저장한다
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		// map에 담기 위해 리스트에 키워드, 시작과 끝번호를 저장
		List<Faq> list = faqService.listAll(keyword, start, end);
		
		ModelAndView modelAndView = new ModelAndView();
		// Map<String, Object> map = new HashMap<>();
		Map<String,Object> map = new HashMap<String, Object>(); //넘길 데이터가 많기 때문에 해쉬맵에 저장한 후에 modelAndView로 값을 넣고 페이지를 지정
		
		map.put("list",list);
		map.put("pager",pager);
		map.put("count",count);
		map.put("keyword",keyword);
		modelAndView.addObject("map",map);
		
		modelAndView.setViewName("faq/faqList");
		return modelAndView;
	}
	
	// 글쓰기 버튼을 눌렀을 때 뷰에서 맵핑되는 메서드
	@RequestMapping(value="faqWrite.do")
	public String faqWrite() throws Exception {
		// 글쓰기 폼 페이지로 이동
		return "faq/faqWriteForm";
	}
	
	/*
	//faqWriteForm.jsp에서 입력한 내용들이 Faq에 저장됨
	@RequestMapping(value="faqInsert.do", method=RequestMethod.POST)
	public ModelAndView faqInsert (Faq faq, ModelAndView modelAndView) throws Exception {
		
		int result = faqService.insertFaq(faq);
		modelAndView.addObject("result",result);
		//modelAndView.setViewName("");
	}
	*/
	
}