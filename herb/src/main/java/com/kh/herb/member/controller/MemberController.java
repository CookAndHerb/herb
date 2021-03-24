package com.kh.herb.member.controller;

import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
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
	
	@Autowired
	private JavaMailSender mailSender;
	
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
			mv.setViewName("member/memberJoinSuccess");
		}else {
			mv.setViewName("member/memberJoinFail");
		}
		return mv;
	}
	
	// 아이디 중복확인
	@RequestMapping("idCheck.do")
	@ResponseBody
	public String idCheck(@RequestBody String userId) throws Exception {
		int count = 0;
		JSONObject obj = new JSONObject();

		count = memberService.idCheckProcess(userId);
		System.out.println(count);
		obj.put("cnt", count);

		return obj.toJSONString();
	}// end idCheck()

	@RequestMapping(value="memberEmail.do", method=RequestMethod.GET)
	@ResponseBody
	public String mailCheckGET(String userEmail) throws Exception{
		
		// 뷰(View)로 부터 넘어온 데이터 확인
		System.out.println("이메일 데이터 전송 확인");
		System.out.println("인증 번호"+userEmail);
		
		
		// 인증번호 (난수) 생성
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		System.out.println(checkNum);
		
		// 이메일 보내기
		String setFrom = "wncld@naver.com";
		String toMail = userEmail;
		String title = "어른허브 인증 이메일 입니다.";
		String content = 
				"홈페이지를 방문해주셔서 감사합니다."+
				"<br><br>"+
				"인증 번호는"+checkNum+"입니다."+
				"<br>"+
				"해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message,true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		String num = Integer.toString(checkNum);
		
		return num;
	}
	
	// 아이디 찾기 처리
	@RequestMapping(value="memberIdSearch.do", method=RequestMethod.POST)
	public ModelAndView memberIdSearch(
			HttpServletResponse resp, Member member, ModelAndView mv) throws Exception{
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		
		String userId = memberService.idSearch(member);
		
		mv.addObject("userId", userId);
		
		if(userId == null) {
			out.println("<script>");
			out.println("alert('이름 또는 휴대폰 번호를 확인하세요.');");
			out.println("history.go(-1);");
			out.println("</script>");
			return null;
		}else {
			mv.setViewName("member/memberIdSearchSuccess");
		}
		return mv;
	}
	
	// 비밀번호 찾기 처리 1
	@RequestMapping(value="memberFindPwEmail.do", method=RequestMethod.POST)
	@ResponseBody
	public String mailCheckGET(Member member) throws Exception{
		
		// 뷰(View)로 부터 넘어온 데이터 확인
		System.out.println(member.getUserId());
		System.out.println(member.getUserEmail());
		
		Member mb = memberService.idEmail(member);
		JSONObject obj = new JSONObject();
		
		if(mb == null) {
			obj.put("ok","");
		}else {
			String num = mailCheckGET(mb.getUserEmail());
			obj.put("code", num);
		}
		
		return obj.toJSONString();
	}	

	// 비밀번호 찾기 처리2
	@RequestMapping(value="memberPwSearch.do", method=RequestMethod.POST)
	public ModelAndView memberPwSearch(Member member, ModelAndView mv) throws Exception {
		
		mv.addObject("userId", member.getUserId());
		mv.setViewName("member/memberPwUpdateForm");
		
		return mv;
	}
	
	// 비밀번호 변경하기
	@RequestMapping(value="memberPwUpdate.do", method=RequestMethod.POST)
	public ModelAndView memberPwUpdate(HttpServletResponse resp, Member member, ModelAndView mv) throws Exception{
		resp.setContentType("text/html;charset=utf-8");
		
		int result = memberService.updatePw(member);
		
		PrintWriter out = resp.getWriter();
		
		if(result == 0) {
			out.println("<script>");
			out.println("alert('비밀번호 변경 실패. 관리자에게 문의해주세요.');");
			out.println("history.go(-1);");
			out.println("</script>");
			return null;
		}else {
			mv.setViewName("member/memberPwUpdateSuccess");
		}
		return mv;	
	}
}
