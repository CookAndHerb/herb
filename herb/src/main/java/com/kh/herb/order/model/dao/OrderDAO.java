package com.kh.herb.order.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.herb.cart.model.vo.CartList;
import com.kh.herb.myherb.model.vo.OrderDetailList;
import com.kh.herb.order.model.vo.Order;
import com.kh.herb.order.model.vo.OrderDetail;

@Repository
public class OrderDAO {

	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	// 카트 리스트
	public List<CartList> cartList(String userId) throws Exception{
		return sqlSession.selectList("Order.cartList", userId);
	}

	public int insertOrder(Order order) {
		return sqlSession.insert("Order.insertOrder", order);
	}

	public int getOrderNum(String userId) {
		return sqlSession.selectOne("Order.getOrderNum", userId);
	}

	
	public int insertOrderDetail(OrderDetail orderDetail) {
		return sqlSession.insert("Order.insertOrderDetail", orderDetail);
	}
	
	/*public int insertOrderDetail(int orderNum) {
		return sqlSession.insert("Order.insertOrderDetail", orderNum);
	}*/

	public Order getOrder(int orderNum) {
		return sqlSession.selectOne("Order.getOrder", orderNum);
	}

	public int deleteCart(String userId) {
		return sqlSession.delete("Order.deleteCart", userId);
	}

	public List<OrderDetailList> orderDetailList(int orderNum) {
		return sqlSession.selectList("Order.orderDetailList", orderNum);
	}
}
