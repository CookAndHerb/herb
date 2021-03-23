package com.kh.herb.admin.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.herb.admin.model.vo.Search;
import com.kh.herb.member.model.vo.Member;
import com.kh.herb.product.model.vo.Product;
import com.kh.herb.product.model.vo.ProductFile;

@Repository
public class AdminDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//상품 등록
	public int insertProduct(Product product) throws Exception{
		return sqlSession.insert("adminProduct.insertProduct", product);
	}
	
	//회원관리(조회)
	public List<Member> memberList() throws Exception{
		List<Member> memberList = sqlSession.selectList("adminMember.memberList");
		return memberList;
	}
	
	//회원검색
	public List<Member> searchMember(Search search) throws Exception{
		List<Member> searchMember = sqlSession.selectList("adminMember.searchMember", search);
		return searchMember;
	}
	
	//파일 등록
	public int insertFile(ProductFile pf) throws Exception{
		return sqlSession.insert("adminFile.insertFile", pf);
	}
}
