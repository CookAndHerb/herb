package com.kh.herb.cart.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.herb.cart.model.vo.Cart;
import com.kh.herb.cart.model.vo.CartList;

@Repository
public class CartDAO {

	@Autowired // 가지고 있는 자원이면 넣어줘 -> DI(이게 바로 DI 라는 것)
	private SqlSessionTemplate sqlSession;

	// 카트 담기
	public int addCart(Cart cart) throws Exception{
		return sqlSession.insert("Cart.addCart", cart);
	}
	
	// 카트 리스트
	public List<CartList> cartList(String userId) throws Exception{
		return sqlSession.selectList("Cart.cartList", userId);
	}
	
	// 카트 수량 수정
	public int updateCart(Cart cart) throws Exception{
		return sqlSession.update("Cart.updateCart", cart);
	}
	
	// 카트 삭제
	public int deleteCart(Cart cart) throws Exception{
		return sqlSession.delete("Cart.deleteCart", cart);
	}
}
