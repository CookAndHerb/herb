package com.kh.herb.qa.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.herb.qa.model.service.QaService;
import com.kh.herb.qa.model.vo.Pager;
import com.kh.herb.qa.model.vo.Qa;

@Controller
public class QaController {

	@Autowired
	private QaService qaService;
	
	// qa 리스트
	@RequestMapping(value="qaList.do")
	public ModelAndView qaList(@RequestParam(defaultValue="1") int curPage, ModelAndView modelAndView,
				@RequestParam(defaultValue="") String keyword,
				@RequestParam(defaultValue="전체")String selectMenu) throws Exception {
			
		
		// 전체 게시글 갯수
		int count = qaService.getTotalNum();
		int number = 0;
		number = count - (curPage - 1) * 10;
		
		//페이지 관련 설정, 시작번호와 끝번호를 구해서 각각 변수에 저장함
        Pager pager=new Pager(count, curPage); //레코드 번호와 원하는 페이지의 번호를 주게 되면 
        int start=pager.getPageBegin();
        int end=pager.getPageEnd();
        
        // map에 담기 위해 리스트에 키워드, 시작과 끝번호를 저장
        List<Qa> list = qaService.listAll(selectMenu, keyword, start, end);
		
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("list", list); //map에 자료 저장
        map.put("count", count);
        map.put("pager", pager); //페이지 네비게이션을 위한 변수
        map.put("number", number);
        map.put("selectMenu", selectMenu);
        map.put("keyword",keyword); 
        
        modelAndView.addObject("map",map);
		modelAndView.setViewName("qa/qaList");
		return modelAndView;
	}
		
	// 게시글 작성 : 글쓰기 버튼을 눌렀을 때 뷰에서 맵핑되는 메서드
	@RequestMapping(value="qaWrite.do")
	public String qaWrite() throws Exception {
		// 글쓰기 폼 페이지로 이동
		return "qa/qaWriteForm";
	}
	
	// 게시글 작성 : qaWriteForm.jsp에서 입력한 내용들이 Qa에 저장됨
	@RequestMapping(value="qaInsert.do")
	public ModelAndView qaInsert (Qa qa, ModelAndView modelAndView) throws Exception {
		
		int ref = 0;
		// ref 구하기
		if(qaService.getTotalNum() == 0) {
			ref = 1;
		} else {
			ref = qaService.getRef() + 1;
		}
		
		System.out.println("ref : " + ref);
		
		int reStep = 1;
		int reLevel = 1;
		int result = 0;
	
		qa.setRef(ref);
		qa.setReStep(reStep);
		qa.setReLevel(reLevel);
		qa.setReLevel(reLevel);
		//qa.setQaTitle(qaTitle);
		//qa.setQaWriter(qaWriter);
		
		result = qaService.insertQa(qa);
		if(result > 0) {
			modelAndView.addObject("qa",qa);
			modelAndView.setViewName("qa/qaView");
		} else {
			modelAndView.setViewName("qa/qaWriteFail");
		}
		
		return modelAndView;
	}
	
	// 게시글 보기 전 비밀번호 확인 폼 이동
	@RequestMapping(value="qaPwForm.do")
	public ModelAndView qaPwForm(ModelAndView modelAndView,
			HttpSession session, @RequestParam int qaNum) throws Exception {
		
		// TODO : 관리자일 경우 잘 안됨
		if(session.getAttribute("userNum")!=null && (int) (session.getAttribute("userNum")) < 1000) { 
			//관리자일 경우 비밀번호 입력 창 없이 바로 게시글 상세페이지로 이동
			modelAndView.addObject("qaNum",qaNum);
			modelAndView.addObject("qa", qaService.read(qaNum)); 
			modelAndView.setViewName("qa/qaView");
        	qaService.increaseViewcnt(qaNum, session);
		} else {
			// 비밀번호 입력 폼 페이지로 이동(관리자 아닐 경우)
			modelAndView.addObject("qaNum",qaNum);
			modelAndView.setViewName("qa/qaPwForm");
		}
		return modelAndView;
	}
	
	// 게시글 보기 : 비밀번호 확인한 경우
	@RequestMapping(value="qaView.do")
	public ModelAndView qaView(HttpServletRequest request, 
			ModelAndView modelAndView, HttpSession session)
					throws Exception {
		
		//String keyword = "";
		//int curPage = 1;
		//String selectMenu = "";
		int qaNum = Integer.parseInt(request.getParameter("qaNum").trim());
		String inputPw = request.getParameter("inputPw");
		String pw = qaService.getQaPassword(qaNum);
		
		/*if(request.getParameter("keyword") == null) {
			keyword="";
		} else {
			keyword = request.getParameter("keyword");
		}
		
		if(request.getParameter("selectMenu") == null) {
			selectMenu = "";
		} else {
			selectMenu = request.getParameter("selectMenu");
		}
		curPage = Integer.parseInt(request.getParameter("curPage")); */ 
		//조회수 증가 쿼리
        // 비밀번호 일치 여부 확인 -> TODO : AJAX방식으로 변경하기
        if(inputPw.equals(pw)) { //inputPw.equals(pw)
        	modelAndView.setViewName("qa/qaView");
        	modelAndView.addObject("qa", qaService.read(qaNum)); // 상세보기 한 번 클릭하면 조회수 1 증가
        	qaService.increaseViewcnt(qaNum, session);
        } else {
        	modelAndView.setViewName("qa/qaViewFail");
        }
        
		//modelAndView.setViewName("qa/qaView");
		//modelAndView.addObject("qa", qaService.read(qaNum)); // 상세보기 한 번 클릭하면 조회수 1 증가
		//modelAndView.addObject("curPage", curPage);
		//modelAndView.addObject("keyword",keyword);
		//modelAndView.addObject("selectMenu",selectMenu);
		return modelAndView;
	}
	
	// 게시글 수정 뷰로 이동
	@RequestMapping(value="qaUpdateView.do")
	public ModelAndView updateView(@RequestParam int qaNum, ModelAndView modelAndView) throws Exception {
		
		modelAndView.addObject("qa",qaService.read(qaNum));
		modelAndView.setViewName("qa/qaUpdateForm");
		return modelAndView;
	}
	
	// 수정 결과
	@RequestMapping(value="qaUpdate.do", method=RequestMethod.POST)
	public ModelAndView qaUpdate(@RequestParam int qaNum, @RequestParam String qaTitle,
				@RequestParam String qaContent, ModelAndView modelAndView) throws Exception {
			
		Qa qa = qaService.read(qaNum);
		qa.setQaTitle(qaTitle);
		qa.setQaContent(qaContent);
		int result = qaService.updateQa(qa);
			
		if (result > 0) {
			modelAndView.addObject("qa", qa);
			modelAndView.setViewName("qa/qaView");
		} else {
			modelAndView.setViewName("qa/qaUpdateFail");
		}
		return modelAndView;
			
	}
	
	// 게시글 삭제
	@RequestMapping(value="qaDelete.do", method=RequestMethod.GET)
	public ModelAndView qaDelete(@RequestParam int qaNum, ModelAndView modelAndView) throws Exception {
		
		int result = qaService.deleteQa(qaNum);
		modelAndView.addObject("result",result);
		modelAndView.setViewName("qa/qaDelete");
		return modelAndView;
	}
	
	// 게시글 답변 작성 폼으로 이동 : qaView.jsp에서 [답변 작성]버튼 클릭
	@RequestMapping(value="qaReWriteForm.do")
	public ModelAndView qaReWriteForm(@RequestParam String qaPw, @RequestParam int qaNum, @RequestParam int ref,
			@RequestParam int reStep, @RequestParam int reLevel, ModelAndView modelAndView) throws Exception {
		
		modelAndView.addObject("qaNum",qaNum);
		modelAndView.addObject("ref",ref);
		modelAndView.addObject("reStep",reStep);
		modelAndView.addObject("reLevel",reLevel);
		modelAndView.addObject("qaPw",qaPw);
		modelAndView.setViewName("qa/qaReWriteForm");
		return modelAndView;
	}
	
	// 게시글 답변 작성 : qaReWriteForm.jsp에서 [등록]버튼 누르면 실행됨
	@RequestMapping(value="qaReInsert.do")
	public ModelAndView qaReInsert (Qa qa, @RequestParam int ref, @RequestParam int reLevel,
			@RequestParam int reStep, @RequestParam String qaPw, ModelAndView modelAndView) throws Exception {
		
		qa.setRef(ref);
		qa.setReStep(reStep);
		qa.setReLevel(reLevel);
		qa.setQaPw(qaPw);
		
		/*
		 * 답변 글을 작성할 때, 이 작업을 먼저 해줘야 함 ref는 부모 글의 ref와 똑같이,
		 *  reStep이 부모의 reStep에 1을 더하는 것,
		 * 부모 글 레벨보다 큰 글의 reLevel은 reLevel = reLevel + 1 처리, 
		 * 그리고 새로 작성하는 글의 reLevel은
		 * 부모의 reLevel + 1해줌
		 */
		
		// 부모 글보다 큰 reLevel의 값을 전부 1씩 증가시킴
		qaService.reStepCount(qa);
		qa.setReStep(reStep+1);
		qa.setReLevel(reLevel+1);
		
		//int result = qaService.reInsert(qa);
		int result = qaService.insertQa(qa);
		if(result > 0) {
			modelAndView.addObject("qa",qa);
			modelAndView.setViewName("qa/qaView");
		} else {
			modelAndView.setViewName("qa/qaWriteFail");
		}
		
		return modelAndView;
	}
}
