package com.kh.herb.order.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.herb.cart.model.vo.CartList;

@Repository
public class OrderDAO {

	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	// 카트 리스트
	public List<CartList> cartList(String userId) throws Exception{
		return sqlSession.selectList("Order.cartList", userId);
	}
}
