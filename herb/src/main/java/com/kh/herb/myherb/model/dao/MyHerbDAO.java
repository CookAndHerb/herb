package com.kh.herb.myherb.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.herb.member.model.vo.Member;

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
}
