package com.kh.herb.cart.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.herb.cart.model.dao.CartDAO;
import com.kh.herb.cart.model.vo.Cart;
import com.kh.herb.cart.model.vo.CartList;
import com.kh.herb.cart.model.vo.TopList;

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

	// 카트 삭제
	@Override
	public int deleteCart(Cart cart) throws Exception {
		return cartDAO.deleteCart(cart);
	}

	// 카트에 있는 상품인가 확인
	@Override
	public boolean searchCart(Cart cart) throws Exception {
		return cartDAO.searchCart(cart);
	}
	
	// TOP4 조회
	@Override
	public List<TopList> topList() throws Exception {
		return cartDAO.topList();
	}

	
	
}