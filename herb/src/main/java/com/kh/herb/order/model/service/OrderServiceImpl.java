package com.kh.herb.order.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.herb.cart.model.vo.CartList;
import com.kh.herb.myherb.model.vo.OrderDetailList;
import com.kh.herb.order.model.dao.OrderDAO;
import com.kh.herb.order.model.vo.Order;
import com.kh.herb.order.model.vo.OrderDetail;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderDAO orderDAO;
	
	// 카트 리스트
	@Override
	public List<CartList> cartList(String userId) throws Exception {
		return orderDAO.cartList(userId);
	}

	@Override
	public int insertOrder(Order order) throws Exception {
		return orderDAO.insertOrder(order);
	}

	@Override
	public int getOrderNum(String userId) throws Exception {
		return orderDAO.getOrderNum(userId);
	}

	/*@Override
	public int insertOrderDetail(int orderNum) throws Exception {
		return orderDAO.insertOrderDetail(orderNum);
	}*/
	
	@Override
	public int insertOrderDetail(OrderDetail orderDetail) throws Exception {
		return orderDAO.insertOrderDetail(orderDetail);
	}

	@Override
	public Order getOrder(int orderNum) throws Exception {
		return orderDAO.getOrder(orderNum);
	}

	@Override
	public int deleteCart(String userId) throws Exception {
		return orderDAO.deleteCart(userId);
	}

	@Override
	public List<OrderDetailList> orderDetailList(int orderNum) throws Exception {
		return orderDAO.orderDetailList(orderNum);
	}
}
