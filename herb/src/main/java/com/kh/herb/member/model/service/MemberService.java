package com.kh.herb.member.model.service;

import com.kh.herb.member.model.vo.Member;

public interface MemberService {

	public Member selectMember(Member member) throws Exception;
	
	public int insertMember(Member member) throws Exception;

}
