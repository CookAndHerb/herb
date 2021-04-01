package com.kh.herb.chat.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.herb.member.model.vo.Member;

@Controller
public class ChatController {
	
	private static final Logger log = LoggerFactory.getLogger(ChatController.class);
	
	@GetMapping("chat")
	public String chat(Model model, HttpSession session) {
		
		Member user = (Member)session.getAttribute("member");
		String userId = user.getUserId();
		session.setAttribute("userId", userId);
		
		
		log.info("==================================");
		log.info("@ChatController, GET Chat / Username : " + user.getUserId());
		
		model.addAttribute("userId", userId);
		
		return "chat/chat";
	}
}
