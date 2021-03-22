package com.kh.herb.myherb.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.herb.member.model.vo.Member;
import com.kh.herb.myherb.model.dao.MyHerbDAO;

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

}
