package com.kh.herb.notice.model.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.herb.notice.model.service.NoticeService;
import com.kh.herb.notice.model.vo.Notice;


@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	public static final int LIMIT = 5;
	
	// 글 목록
	@RequestMapping(value = "noticeList.do", method=RequestMethod.GET)
	public ModelAndView boardListService(@RequestParam(name="page", defaultValue="1") int page,
			ModelAndView mv) {
		try {
			int currentPage = page;
			
			// 한 페이지당 출력할 목록 갯수
			int listCount = noticeService.totalCount();
			
			int maxPage = (int) ((double) listCount / LIMIT + 0.9);
			int naviCountPerPage = 5;
			int startNavi = ((currentPage-1)/naviCountPerPage)*naviCountPerPage+1;
			int endNavi = startNavi + naviCountPerPage -1;
			if(endNavi > maxPage) {
				endNavi = maxPage;
			}
			mv.addObject("startPage", startNavi);
			mv.addObject("endPage", endNavi);
			mv.addObject("noticeList", noticeService.noticeList(currentPage, LIMIT));
			mv.addObject("currentPage", currentPage);
			mv.addObject("maxPage", maxPage);
			mv.addObject("listCount", listCount);
			mv.setViewName("notice/noticeList");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("notice/errorPage");
		}
		return mv;
	}
	
	// 글 작성 페이지로 보내기
	@RequestMapping(value="noticeWriteForm.do", method=RequestMethod.GET)
	public String goNoticeWriteForm() throws Exception{
		
		return "notice/noticeWriteForm";
	}
	
	// 글 작성
	@RequestMapping(value="noticeWriteForm.do", method=RequestMethod.POST)
	public ModelAndView noticeWriteForm(Notice notice, ModelAndView mv) throws Exception{
		
		int result = noticeService.insertNotice(notice);

		if(result > 0) {
			mv.addObject("result", 1);
			mv.setViewName("notice/noticeWriteComplete");
		}else {
			mv.addObject("result", 0);
			mv.setViewName("notice/noticeWriteComplete");
		}
		
		return mv;
	}
	
	// 글 상세 페이지 가기
	@RequestMapping(value="noticePage.do", method=RequestMethod.GET)
	public ModelAndView noticePage(int noticeNum, int page, ModelAndView mv) throws Exception{
		Notice notice = noticeService.selectNotice(noticeNum);
		
		noticeService.readCount(notice);
		
		Notice notice2 = noticeService.selectNotice(noticeNum);
		mv.addObject("notice" , notice2);
		mv.addObject("currentPage", page);
		mv.setViewName("notice/noticePage");
		return mv;
	}
	// 글 수정 폼으로 가기
	@RequestMapping(value="noticeUpdateForm.do", method=RequestMethod.GET)
	public ModelAndView goNoticeUpdateForm(int noticeNum, ModelAndView mv) throws Exception{
		Notice notice = noticeService.selectNotice(noticeNum);
		
		mv.addObject("notice", notice);
		mv.setViewName("notice/noticeUpdateForm");
		return mv;
	}
	
	// 글 수정 로직
	@RequestMapping(value="noticeUpdateForm.do", method=RequestMethod.POST)
	public ModelAndView noticeUpdateForm(Notice notice, ModelAndView mv) throws Exception{
		int result = noticeService.updateNotice(notice);
	
		if(result > 0) {
			mv.addObject("result", 1);
			mv.setViewName("notice/noticeUpdateComplete");
		}else {
			mv.addObject("result", 0);
			mv.setViewName("notice/noticeUpdateComplete");
		}
		
		return mv;
	}
	
	// 글 삭제
	@RequestMapping(value="noticeDelete.do", method=RequestMethod.GET)
	public ModelAndView noticeDelete(int noticeNum, ModelAndView mv) throws Exception{
		
		int result = noticeService.deleteNotice(noticeNum);
		
		if(result > 0) {
			mv.addObject("result", 1);
			mv.setViewName("notice/noticeDeleteComplete");
		}else {
			mv.addObject("result", 0);
			mv.setViewName("notice/noticeDeleteComplete");
		}
		
		return mv;
	}
}
