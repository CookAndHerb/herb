package com.kh.herb.order.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.herb.cart.model.vo.CartList;
import com.kh.herb.order.model.dao.OrderDAO;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderDAO orderDAO;
	
	// 카트 리스트
	@Override
	public List<CartList> cartList(String userId) throws Exception {
		return orderDAO.cartList(userId);
	}
}
