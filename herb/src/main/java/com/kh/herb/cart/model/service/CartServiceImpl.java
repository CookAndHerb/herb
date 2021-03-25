package com.kh.herb.cart.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.herb.cart.model.dao.CartDAO;
import com.kh.herb.cart.model.vo.Cart;
import com.kh.herb.cart.model.vo.CartList;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	CartDAO cartDAO;
	
	// 카트 담기
	@Override
	public int addCart(Cart cart) throws Exception {
		return cartDAO.addCart(cart);
	}

	// 카트 리스트
	@Override
	public List<CartList> cartList(String userId) throws Exception {
		return cartDAO.cartList(userId);
	}
	
	// 카트 수량 수정
	@Override
	public int updateCart(Cart cart) throws Exception {
		return cartDAO.updateCart(cart);
	}

	@Override
	public int deleteCart(Cart cart) throws Exception {
		return cartDAO.deleteCart(cart);
	}

	
}
