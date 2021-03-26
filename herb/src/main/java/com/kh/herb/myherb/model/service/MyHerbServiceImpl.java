package com.kh.herb.myherb.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.herb.member.model.vo.Member;
import com.kh.herb.myherb.model.dao.MyHerbDAO;
import com.kh.herb.myherb.model.vo.OrderDetailList;
import com.kh.herb.myherb.model.vo.OrderList;

@Service
public class MyHerbServiceImpl implements MyHerbService {
	
	@Autowired
	MyHerbDAO myHerbDAO;
	
	@Override
	public Member selectMember(Member member) throws Exception {
		return myHerbDAO.selectMember(member);
	}
	
	@Override
	public int updateMember(Member member) throws Exception {
		return myHerbDAO.updateMember(member);
	}

	@Override
	public boolean checkPw(Member member) throws Exception {
		return myHerbDAO.checkPw(member);
	}

	@Override
	public int deleteMember(Member member) throws Exception {
		return myHerbDAO.deleteMember(member);
	}

	@Override
	public int listCount(String userId) throws Exception {
		return myHerbDAO.listCount(userId);
	}

	@Override
	public List<OrderList> orderList(String userId, int startPage, int limit) throws Exception {
		return myHerbDAO.orderList(userId, startPage, limit);
	}

	@Override
	public List<OrderDetailList> orderDetailList(OrderDetailList orderDetailList) throws Exception {
		return myHerbDAO.orderDetailList(orderDetailList);
	}

	
}
