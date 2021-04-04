package com.kh.herb.order.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.herb.cart.model.service.CartService;
import com.kh.herb.cart.model.vo.CartList;
import com.kh.herb.member.model.vo.Member;
import com.kh.herb.myherb.model.service.MyHerbService;
import com.kh.herb.myherb.model.vo.OrderDetailList;
import com.kh.herb.order.model.service.OrderService;
import com.kh.herb.order.model.vo.Order;
import com.kh.herb.order.model.vo.OrderDetail;

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
	
	// [결제하기] 버튼 누른 후 주문 정보 삽입
	@RequestMapping(value="orderInsert.do")
	public ModelAndView orderInsert(ModelAndView modelAndView, @RequestParam int orderAmount,
			Order order, HttpSession session) throws Exception {
		
		Member member = (Member)session.getAttribute("member");
		String userId = member.getUserId();
		order.setOrderUserId(userId);
		order.setOrderAmount(orderAmount);
		int result = orderService.insertOrder(order);
		
		if(result > 0) { //주문 정보가 삽입되면
			int orderNum = orderService.getOrderNum(userId);
			System.out.println(orderNum);
			
			// orderDetail vo넣어서 삽입
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setOrderNum(orderNum);
			orderDetail.setUserId(userId);
			
			int result3 = orderService.insertOrderDetail(orderDetail);
					
			//result2 = orderService.insertOrderDetail(orderNum);
			if (result3 > 0) { // 주문 상세 정보 삽입 완료
				List<CartList> cartList = orderService.cartList(userId);
				order = orderService.getOrder(orderNum);
				
				modelAndView.addObject("cartList",cartList);
				modelAndView.addObject("order",order);
				modelAndView.setViewName("order/orderPage");
			} else { // 주문 상세 정보 삽입되지 않으면
				modelAndView.setViewName("order/orderFail");
			}
			
		} else { // 주문 정보 삽입 실패하면
			modelAndView.setViewName("order/orderFail");
		}
		return modelAndView;
	}
	
	// 결제 성공 후 데이터 처리
		@RequestMapping(value="paySuccess.do")
		public ModelAndView paySuccess(ModelAndView mv,
				Order order, HttpSession session) throws Exception {
		
			// 1. orderDetail list 가져오기 - 주문 목록
			//List<CartList> cartList = orderService.cartList(userId)
			Member member = (Member)session.getAttribute("member");
			String userId = member.getUserId();
			
			//OrderDetailList odl = new OrderDetailList();
			int orderNum = orderService.getOrderNum(userId);
			//odl.setOrderUserId(userId);
			//odl.setOrderNum(orderNum);
			
			List<OrderDetailList> orderDetailList = orderService.orderDetailList(orderNum);
			mv.addObject("orderDetailList",orderDetailList);
			
			// 2. psell 업데이트
		/*
		 * [결제 완료 후 총 판매량 업데이트 하기] 
		 *  장바구니 : userId로 리스트 가져옴 
		 *  pNum으로 psell 조회 
		 *  장바구니에 있는 psell = cartStock + psell 더하기. psell update시키기
		 */
			for(OrderDetailList od : orderDetailList){
				   orderService.updatePSell(od);
				}

			
			
			// 3. cart 비우기
			int result = orderService.deleteCart(userId);
			mv.setViewName("order/orderList");
			
			return mv;
		}
		
}
