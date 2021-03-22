package com.kh.herb.myherb.model.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.validator.internal.engine.messageinterpolation.el.MapBasedVariableMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.herb.member.model.vo.Member;
import com.kh.herb.myherb.model.service.MyHerbService;

@Controller
public class MyHerbController {

	
	@Autowired
	MyHerbService myHerbService;
	
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
	
}
