package com.kh.herb.myherb.model.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpSession;

import org.hibernate.validator.internal.engine.messageinterpolation.el.MapBasedVariableMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.herb.member.model.vo.Member;
import com.kh.herb.myherb.model.service.MyHerbService;
import com.kh.herb.myherb.model.vo.OrderDetailList;

@Controller
public class MyHerbController {

	
	@Autowired
	MyHerbService myHerbService;
	
	public static final int LIMIT = 5;
	
	// 개인정보 수정 로직
	@RequestMapping(value="memberUpdate.do", method=RequestMethod.POST)
	public ModelAndView memberUpdate(Member member, ModelAndView mv, HttpServletRequest request) throws Exception{
		
		
		int result = myHerbService.updateMember(member);
		Member mb = new Member();
		mb = myHerbService.selectMember(member);
		
		if(result == 1) { // 수정 성공했을 때
			HttpSession session = request.getSession();
			session.setAttribute("member", mb);
			mv.addObject(request);
			mv.setViewName("myHerb/memberUpdateForm");
		}else { // 수정 실패했을 때
			mv.setViewName("myHerb/memberUpdateForm");
		}
		return mv;
	}
	
	// 회원 탈퇴 처리
	@RequestMapping(value="memberDelete.do", method =RequestMethod.POST)
	public ModelAndView memberDelete(Member member, ModelAndView mv, HttpServletRequest request) throws Exception{
		
		boolean result = myHerbService.checkPw(member);
		if(result == true) { // 비밀번호가 맞다면 삭제 후 메인페이지 이동
			myHerbService.deleteMember(member);
			HttpSession session = request.getSession();
			session.invalidate();
			mv.setViewName("index");
			return mv;
		}else {
			mv.setViewName("myHerb/memberDeleteResult");
			return mv;
		}
	}	
	
	
	
	@RequestMapping(value = "memberOrder.do", method=RequestMethod.GET)
	public ModelAndView orderList(@RequestParam(name="page", defaultValue="1") int page,
			HttpSession session, ModelAndView mv) throws Exception {
		try {
			int currentPage = page;
			// 한 페이지당 출력할 목록 갯수
			Member member = (Member)session.getAttribute("member");
			String userId = member.getUserId();
			int listCount = myHerbService.listCount(userId); // 주문 총 개수
			int maxPage = (int) ((double) listCount / LIMIT + 0.9);
		
			// <startNavi 구하는 공식>
			// startNavi = ((현재페이지-1)/보여질 navi 개수) * 보여질 navi 개수 +1;
			int naviCountPerPage = 5;
			int startNavi = ((currentPage-1)/naviCountPerPage)*naviCountPerPage+1;
			
			// <endNavi 구하는 공식>
			// endNavi = 시작 navi번호 + 보여질 navi 개수 -1;
			int endNavi = startNavi + naviCountPerPage -1;
			if(endNavi > maxPage) {
				endNavi = maxPage;
			}
			
			
			mv.addObject("orderList", myHerbService.orderList(userId, currentPage, LIMIT));
			mv.addObject("currentPage", currentPage); // 현재 페이지
			mv.addObject("maxPage", maxPage); // 완전 마지막 페이지
			mv.addObject("startNavi", startNavi);
			mv.addObject("endNavi", endNavi); 
			mv.addObject("listCount", listCount); // 주문 총 개수
			mv.setViewName("myHerb/memberOrder");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("myHerb/errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value = "memberOrderDetail.do", method=RequestMethod.GET)
	public ModelAndView orderDetailList(@RequestParam(name = "orderNum") String orderNumStr, HttpSession session, ModelAndView mv) throws Exception{
		System.out.println(orderNumStr);
		int orderNum = Integer.parseInt(orderNumStr);
		Member member = (Member)session.getAttribute("member");
		String userId = member.getUserId();
		
		OrderDetailList odl = new OrderDetailList();
		
		odl.setOrderUserId(userId);
		odl.setOrderNum(orderNum);
		
		mv.addObject("orderDetailList", myHerbService.orderDetailList(odl));
		mv.setViewName("myHerb/memberOrderDetail");
		return mv;
	}

	}
