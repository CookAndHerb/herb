package com.kh.herb.cart.model.service;

import java.util.List;

import com.kh.herb.cart.model.vo.Cart;
import com.kh.herb.cart.model.vo.CartList;
import com.kh.herb.cart.model.vo.TopList;

public interface CartService {
	
	// 카트 담기
	public int addCart(Cart cart) throws Exception;
	
	// 카트에 있는 상품인지 확인
	public boolean searchCart(Cart cart) throws Exception;
	
	// 카트 리스트
	public List<CartList> cartList(String userId) throws Exception;

	// 카드 옵션 수정
	public int updateCart(Cart cart) throws Exception;
	
	// 카트 삭제
	public int deleteCart(Cart cart) throws Exception;
	
	// top4 조회
	public List<TopList> topList() throws Exception;
}
