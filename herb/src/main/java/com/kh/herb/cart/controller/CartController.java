package com.kh.herb.cart.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.herb.cart.model.service.CartService;
import com.kh.herb.cart.model.vo.Cart;
import com.kh.herb.cart.model.vo.CartList;
import com.kh.herb.member.model.vo.Member;

@Controller
public class CartController {

	@Autowired
	CartService cartService;
	
	// 카트 담기
	@ResponseBody
	@RequestMapping(value="addCart.do", method=RequestMethod.GET)
	public String addCart(@RequestParam int cartPnum, int cartStock,HttpSession session) throws Exception {
		
		System.out.println("여기까지옴?");
		JSONObject obj = new JSONObject();
		System.out.println(cartPnum);
		System.out.println(cartStock);
		// session에 저장된 member 꺼내기
		Member member = (Member)session.getAttribute("member");
		
		if(member != null) { // 로그인 돼 있을 경우
			Cart cart = new Cart();
			
			cart.setCartUserId(member.getUserId());
			cart.setCartPnum(cartPnum);
			cart.setCartStock(cartStock);
			
			boolean data = cartService.searchCart(cart);
			
			if(data) { // 이미 카트에 같은 상품이 있을 때

				obj.put("result","dup");
			}else {
				
				int result = cartService.addCart(cart); 
				
				if(result > 0) { // 카트에 담겼다면
					
					obj.put("result", "ok");
				
				}else { // 안담김
					obj.put("result", "no");
				
				}
			}
			
			
		}else { // 로그인 안한 경우
			obj.put("result", "login");
		}
		
		return obj.toJSONString();
		
	}
	
	// 카트 목록
	@RequestMapping(value="cartList.do", method=RequestMethod.GET)
	public ModelAndView getCartList(HttpSession session, ModelAndView mv) throws Exception{
		
		Member member = (Member)session.getAttribute("member");
		
		if(member == null) { // 로그인 하지 않은 경우
	
			mv.setViewName("cart/noCart");
			
		}else { // 로그인 함
		
		String userId = member.getUserId();
		
		List<CartList> cartList = cartService.cartList(userId);
		
			if(cartList.size() == 0) { // 카트가 비어있음
				mv.setViewName("cart/noCart");
			}else {
				mv.addObject("cartList", cartList);
				mv.setViewName("cart/cartList");
			}
		}
		
		return mv;
	}


	// 카트 수량 수정
	@RequestMapping(value="updateCart.do", method=RequestMethod.GET)
	public @ResponseBody String updateCart(HttpSession session, int cartNum, int cartStock) throws Exception{

		Member member = (Member)session.getAttribute("member");
		String userId = member.getUserId();
		
		Cart cart = new Cart();
		cart.setCartNum(cartNum);
		cart.setCartStock(cartStock);
		cart.setCartUserId(userId);
		
		int result = cartService.updateCart(cart);
		
		JSONObject obj = new JSONObject();
		
		if(result > 0) { // 수량 수정 성공
			obj.put("result", "ok");
		
		}else {
			obj.put("result", "");
		}
		
		return obj.toJSONString();
	}
	
	// 카트 하나만 삭제
	@RequestMapping(value="deleteCart.do", method=RequestMethod.GET)
	public @ResponseBody String deleteCart(HttpSession session, int cartNum) throws Exception{
		

		Cart cart = new Cart();
		cart.setCartNum(cartNum);
		
		int result = cartService.deleteCart(cart);
		
		JSONObject obj = new JSONObject();
		
		if(result > 0) { // 카트 삭제 성공
			obj.put("result", "ok");
		
		}else {
			obj.put("result", "");
		}
		
		return obj.toJSONString();
	}
	
	// 선택된 카트 삭제
	@RequestMapping(value="deleteAllCart.do", method=RequestMethod.POST)
	public @ResponseBody String deleteAllCart(HttpSession session, @RequestParam(value= "chbox[]") List<String> chArr, Cart cart) throws Exception{
		
		Member member = (Member)session.getAttribute("member");
		String userId = member.getUserId();
		
		int result = 0;
		int cartNum = 0;
		
		JSONObject obj = new JSONObject();
		
		if(member != null) {
			cart.setCartUserId(userId);
			
			for(String i : chArr) {
				cartNum = Integer.parseInt(i);
				cart.setCartNum(cartNum);
				result = cartService.deleteCart(cart);
			}
			
			if(result > 0) {
				obj.put("result", "ok");
			}else {
				obj.put("result", "");
			}
			
		}else {
				obj.put("result", "");
		}
		return obj.toJSONString();
	}
	
	// 쇼핑 페이지로
	// template.jsp로 가는 주소
	@RequestMapping(value="goShop.do", method=RequestMethod.GET)
	public ModelAndView goShop(HttpSession session, ModelAndView mv) {
		Member member = (Member)session.getAttribute("member");
		if(member != null) {
			mv.setViewName("cart/login");
		}else {
			
			mv.setViewName("cart/noLogin");
		}
		return mv;
	}	
	
}