package com.kh.herb.myherb.model.service;

import java.util.List;

import com.kh.herb.member.model.vo.Member;
import com.kh.herb.myherb.model.vo.OrderDetailList;
import com.kh.herb.myherb.model.vo.OrderList;

public interface MyHerbService {

	public Member selectMember(Member member) throws Exception;
	
	public int updateMember(Member member) throws Exception;
	
	public boolean checkPw(Member member) throws Exception;

	public int deleteMember(Member member) throws Exception;
	
	public int listCount(String userId) throws Exception;
	
	public List<OrderList> orderList(String userId, int startPage, int limit) throws Exception;
	
	public List<OrderDetailList> orderDetailList(OrderDetailList orderDetailList) throws Exception;
	
	public int orderDel(int orderNum) throws Exception;
}
