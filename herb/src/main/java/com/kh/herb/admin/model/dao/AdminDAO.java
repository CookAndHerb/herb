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
	
	//상품 조회
	public List<Product> productList() throws Exception{
		List<Product> productList = sqlSession.selectList("adminProduct.productList");
		return productList;
	}
	
	//선택 상품 조회
	public Product selectProduct(int pNum) throws Exception{
		Product product = sqlSession.selectOne("adminProduct.selectProduct", pNum);
		return product;
	}
	
	//선택 상품에 해당하는 파일 조회
	public List<ProductFile> selectFile(int pNum) throws Exception{
		List<ProductFile> pfList = sqlSession.selectList("adminFile.selectFile", pNum);
		return pfList;
	}
	
	//상품 수정
	public int updateProudct(Product product) throws Exception{
		return sqlSession.update("adminProduct.updateProduct", product);
	}
	
	//파일 수정
	public int updateFile(ProductFile pf) throws Exception{
		return sqlSession.update("adminFile.updateFile", pf);
	}
	
	//상품 삭제
	public int deleteProduct(int pNum) throws Exception{
		return sqlSession.delete("adminProduct.deleteProduct", pNum);
	}
	
	//파일 삭제
	public int deleteFile(int pNum) throws Exception{
		return sqlSession.update("adminFile.deleteFile", pNum);
	}
}
