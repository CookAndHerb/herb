package com.kh.herb.order.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.herb.cart.model.vo.CartList;
import com.kh.herb.member.model.vo.Member;
import com.kh.herb.order.model.service.OrderService;
import com.kh.herb.order.model.vo.Order;

@Controller
public class OrderController {

	@Autowired
	OrderService orderService;
	
	
	// 카트 목록 불러와서 결제페이지로 이동하기
	@RequestMapping(value="orderForm.do", method=RequestMethod.GET)
	public ModelAndView goOrder(HttpSession session, ModelAndView mv) throws Exception{
		
		Member member = (Member)session.getAttribute("member");
		
		if(member == null) { // 로그인 하지 않은 경우
	
			mv.setViewName("index.do");
			
		}else { // 로그인 함
		
		String userId = member.getUserId();
		
		List<CartList> cartList = orderService.cartList(userId);
		
			if(cartList.size() == 0) { // 카트가 비어있음
				mv.setViewName("cart/noCart");
			}else { // 결제하기 버튼 누르면 결제 폼으로 
				mv.addObject("member");
				mv.addObject("cartList", cartList);
				mv.setViewName("order/orderForm");
			}
		}
		
		return mv;
	}
	
	@RequestMapping(value="orderInsert.do")
	public String orderInsert(ModelAndView modelAndView, Order order) {
		return "member/memberLoginForm";
	}
}
