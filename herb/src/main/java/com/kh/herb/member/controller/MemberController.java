package com.kh.herb.member.controller;

import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.herb.member.model.service.MemberService;
import com.kh.herb.member.model.vo.Member;



@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
	

	
	// 로그인 폼으로 가는 주소
	@RequestMapping(value="memberLogin.do", method=RequestMethod.GET)
	public String memberLogin() {
		return "member/memberLoginForm";
	}
	
	// 회원가입 폼으로 가는 주소
	@RequestMapping(value="memberJoin.do", method=RequestMethod.GET)
	public String memberJoin() {
		return "member/memberJoinForm";
	}

	// 아이디 찾기 폼으로 가는 주소
	@RequestMapping(value="memberIdSearch.do", method=RequestMethod.GET)
	public String memberIdSearch() {
		return "member/memberIdSearch";
	}
	
	// 비밀번호 찾기 폼으로 가는 주소
	@RequestMapping(value="memberPwSearch.do", method=RequestMethod.GET)
	public String memberPwSearch() {
		return "member/memberPwSearch";
	}
	
	
	
	
	
	// 로그인 로직
	@RequestMapping(value="memberLogin.do", method=RequestMethod.POST)
	public ModelAndView memberLogin(
			Member member, 
			ModelAndView mv, 
			HttpSession session) throws Exception {

		System.out.println(member.getUserId());
		System.out.println(member.getUserPw());

		member = memberService.selectMember(member);

		session.setAttribute("member", member);
		mv.addObject("member", member);
		mv.setViewName("member/memberLoginComplete");

		return mv;
	}
	
	// 로그아웃 로직
	@RequestMapping(value="memberLogout.do", method=RequestMethod.GET)
	public ModelAndView memberLogout(
			ModelAndView mv, 
			HttpServletRequest request) throws Exception {
		
		//로그아웃하려면 세션을 가져오는게 우선
		HttpSession session = request.getSession();
		session.invalidate();
		mv.setViewName("index");
		return mv;
	}
	
	// 회원가입 로직
	@RequestMapping(value="memberJoin.do", method=RequestMethod.POST)
	public ModelAndView memberJoin(
			Member member, ModelAndView mv) throws Exception{
		
		int result = memberService.insertMember(member);
		
		if(result == 1) {
			mv.setViewName("home");
		}else {
			mv.setViewName("member/memberJoinFail");
		}
		return mv;
	}
	

}
