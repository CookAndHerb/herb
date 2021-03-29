package com.kh.herb.faq.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.herb.faq.model.vo.Faq;
import com.kh.herb.qa.model.vo.Pager;
import com.kh.herb.qa.model.vo.Qa;
import com.kh.herb.faq.model.service.FaqService;

@Controller
public class FaqController {

	@Autowired
	private FaqService faqService;
	
	// 로깅을 위한 변수
	//private static final Logger logger = LoggerFactory.getLogger(FaqController.class);
	
	// faq 리스트
	@RequestMapping(value="faqList.do")
	public ModelAndView faqList(@RequestParam(defaultValue="1") int curPage, ModelAndView modelAndView,
				@RequestParam(defaultValue="") String keyword,
				@RequestParam(defaultValue="전체")String faqCategory) throws Exception {
		
		// 전체 게시글 갯수
		int count = faqService.getTotalNum();
		int number = 0;
		number = count - (curPage - 1) * 10;
				
		//페이지 관련 설정, 시작번호와 끝번호를 구해서 각각 변수에 저장함
		Pager pager=new Pager(count, curPage); //레코드 번호와 원하는 페이지의 번호를 주게 되면 
		int start=pager.getPageBegin();
		int end=pager.getPageEnd();
		        
		// map에 담기 위해 리스트에 키워드, 시작과 끝번호를 저장
		List<Faq> list = faqService.listAll(keyword, start, end);
				
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("list", list); //map에 자료 저장
		map.put("count", count);
		map.put("pager", pager); //페이지 네비게이션을 위한 변수
		map.put("number", number);
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
	
	
	//faqWriteForm.jsp에서 입력한 내용들이 Faq에 저장됨
	@RequestMapping(value="faqInsert.do")
	public ModelAndView faqInsert (Faq faq, ModelAndView modelAndView) throws Exception {
		
		int result = faqService.insertFaq(faq);
		if (result > 0) {
			modelAndView.setViewName("faq/faqList");
		} else {
			modelAndView.setViewName("faq/faqWriteFail");
		}
		return modelAndView;
	}
	
	
	@RequestMapping(value="faqView.do", method=RequestMethod.GET)
	public ModelAndView faqView(@RequestParam int faqNum, ModelAndView modelAndView, HttpSession session)
					throws Exception {
		
		//조회수 증가 쿼리
        faqService.increaseViewcnt(faqNum, session);
		modelAndView.setViewName("faq/faqView");
		modelAndView.addObject("faq", faqService.read(faqNum)); // 상세보기 한 번 클릭하면 조회수 1 증가
		//modelAndView.addObject("curPage", curPage);
		//modelAndView.addObject("keyword",keyword);
		return modelAndView;
	}
	
	@RequestMapping(value="faqDelete.do", method=RequestMethod.GET)
	public ModelAndView faqDelete(@RequestParam int faqNum, ModelAndView modelAndView) throws Exception {
		
		int result = faqService.deleteFaq(faqNum);
		modelAndView.addObject("result",result);
		modelAndView.setViewName("faq/faqDelete");
		return modelAndView;
	}
	
	// 수정 뷰로 이동
	@RequestMapping(value="faqUpdateView.do")
	public ModelAndView updateView(@RequestParam int faqNum, ModelAndView modelAndView) throws Exception {
		
		modelAndView.addObject("faq",faqService.read(faqNum));
		modelAndView.setViewName("faq/faqUpdateForm");
		return modelAndView;
	}
	
	// 수정 결과
	@RequestMapping(value="faqUpdate.do", method=RequestMethod.POST)
	public ModelAndView faqUpdate(@RequestParam int faqNum, @RequestParam String faqTitle, @RequestParam String faqCategory,
				@RequestParam String faqContent, ModelAndView modelAndView) throws Exception {
		
		Faq faq = faqService.read(faqNum);
		faq.setFaqTitle(faqTitle);
		faq.setFaqCategory(faqCategory);
		faq.setFaqTitle(faqTitle);
		faq.setFaqContent(faqContent);
		int result = faqService.updateFaq(faq);
		
		if (result > 0) {
			modelAndView.addObject("faq", faq);
			modelAndView.setViewName("faq/faqView");
		} else {
			modelAndView.setViewName("faq/faqUpdateFail");
		}
		return modelAndView;
		
	}
	
}