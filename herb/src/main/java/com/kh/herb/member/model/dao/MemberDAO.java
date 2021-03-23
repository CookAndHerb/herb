package com.kh.herb.member.model.dao;

import java.util.List; 

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.herb.member.model.vo.Member;


@Repository
public class MemberDAO {

	@Autowired // 가지고 있는 자원이면 넣어줘 -> DI(이게 바로 DI 라는 것)
	private SqlSessionTemplate sqlSession;

	public Member selectMember(Member member) throws Exception{
		return sqlSession.selectOne("Member.selectMember",member);
	}
	
	public int insertMember(Member member) throws Exception{
		return sqlSession.insert("Member.insertMember", member);
	}
	
	public int idCheckMethod(String userId) {
		return sqlSession.selectOne("Member.idCheck", userId);

	}
	
	public String idSearch(Member member) {
		return sqlSession.selectOne("Member.idSearch", member);

	}
	
	public Member idEmail(Member member) {
		return sqlSession.selectOne("Member.idEmail", member);
	}
	
	public int updatePw(Member member) {
		return sqlSession.update("Member.updatePw", member);
	}
}
