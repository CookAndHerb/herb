package com.kh.herb.order.model.service;

import java.util.List;

import com.kh.herb.cart.model.vo.CartList;
import com.kh.herb.order.model.vo.Order;
import com.kh.herb.order.model.vo.OrderDetail;

public interface OrderService {

	// 카트 리스트
	public List<CartList> cartList(String userId) throws Exception;

	public int insertOrder(Order order) throws Exception;

	public int getOrderNum(String userId) throws Exception;
	
	public int insertOrderDetail(OrderDetail orderDetail) throws Exception;
	
	//public int insertOrderDetail(int orderNum) throws Exception;

	public Order getOrder(int orderNum) throws Exception;

	public int deleteCart(String userId) throws Exception;
	
	
}
