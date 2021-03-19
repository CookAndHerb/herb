package com.kh.herb.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.herb.member.model.dao.MemberDAO;
import com.kh.herb.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAO memberDAO;

	@Override
	public Member selectMember(Member member) throws Exception {
		return memberDAO.selectMember(member);
	}

	@Override
	public int insertMember(Member member) throws Exception {
		return memberDAO.insertMember(member);
	}


}
