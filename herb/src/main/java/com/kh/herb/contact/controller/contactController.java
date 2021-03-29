package com.kh.herb.contact.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class contactController {
	
	@RequestMapping("contact.do")
	public String companyInfo() {
		return "contact/contact";
	}
}
