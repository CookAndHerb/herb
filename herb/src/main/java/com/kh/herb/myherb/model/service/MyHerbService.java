package com.kh.herb.myherb.model.service;

import com.kh.herb.member.model.vo.Member;

public interface MyHerbService {

	public Member selectMember(Member member) throws Exception;
	
	public int updateMember(Member member) throws Exception;
	
	public boolean checkPw(Member member) throws Exception;

	public int deleteMember(Member member) throws Exception;
}
