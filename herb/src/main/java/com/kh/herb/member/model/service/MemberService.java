package com.kh.herb.member.model.service;

import com.kh.herb.member.model.vo.Member;

public interface MemberService {

	public Member selectMember(Member member) throws Exception;
	
	public int insertMember(Member member) throws Exception;

	public int idCheckProcess(String userId) throws Exception;
	
	public String idSearch(Member member) throws Exception;
	
	public Member idEmail(Member member) throws Exception;
	
	public int updatePw(Member member) throws Exception;
}
