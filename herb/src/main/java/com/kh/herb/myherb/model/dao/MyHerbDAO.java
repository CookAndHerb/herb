package com.kh.herb.myherb.model.dao;

import java.util.List; 

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.herb.member.model.vo.Member;
import com.kh.herb.myherb.model.vo.OrderDetailList;
import com.kh.herb.myherb.model.vo.OrderList;
import com.kh.herb.myherb.model.vo.OrderListPage;

@Repository
public class MyHerbDAO {

	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	// 회원 정보 가져오기
	public Member selectMember(Member member) throws Exception{
		return sqlSession.selectOne("Member.selectMember",member);
	}
	
	// 회원 정보 수정
	public int updateMember(Member member)throws Exception{
		return sqlSession.update("Myherb.updateMember", member);
	}
	
	// 회원 아이디, 비밀번호 확인
	public boolean checkPw(Member member) throws Exception{
		boolean result = false;
		int count = sqlSession.selectOne("Myherb.checkPw", member);
		if(count == 1)
			result = true;
		
		return result;
	}
	
	// 회원 탈퇴
	public int deleteMember(Member member) throws Exception{
		return sqlSession.delete("Myherb.deleteMember", member);
	}
	
	
	// 주문 개수 불러오기
	public int listCount(String userId) throws Exception {
		 return sqlSession.selectOne("Myherb.listCount", userId);
	 }
	 
	 
	// 주문 목록 불러오기
	 public List<OrderList> orderList(String userId, int startPage, int limit) throws Exception{
		 int startRow = (startPage - 1) * limit;
		 OrderListPage orderListPage = new OrderListPage();
		 orderListPage.setOrderUserId(userId);
		 orderListPage.setStart(startRow+1);
		 orderListPage.setEnd(startRow+5);
		 return sqlSession.selectList("Myherb.orderList", orderListPage);
	 }
	 
	 // 주문 상세 목록 불러오기
	 public List<OrderDetailList> orderDetailList(OrderDetailList orderDetailList) throws Exception{
		 return sqlSession.selectList("Myherb.orderDetailList", orderDetailList);
	 }
	 
	 // 주문 취소하기
	public int orderDel(int orderNum)throws Exception{
			return sqlSession.update("Myherb.orderDel", orderNum);
		}
	 
}
