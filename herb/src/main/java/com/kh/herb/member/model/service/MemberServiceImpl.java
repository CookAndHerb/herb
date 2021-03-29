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

	@Override
	public int idCheckProcess(String userId) throws Exception{
		return memberDAO.idCheckMethod(userId);

	}

	@Override
	public String idSearch(Member member) throws Exception {
		return memberDAO.idSearch(member);
	}

	@Override
	public Member idEmail(Member member) throws Exception {
		return memberDAO.idEmail(member);
	}

	@Override
	public int updatePw(Member member) throws Exception {
		return memberDAO.updatePw(member);
	}

	
}
