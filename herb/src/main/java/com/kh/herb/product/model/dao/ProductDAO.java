package com.kh.herb.product.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.herb.product.model.vo.Product;

@Repository
public class ProductDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 상품 리스트
	public List<Product> productAllList(){
		List<Product> list = sqlSession.selectList("Product.proAllList");
		return list;
	}
	
	// 상품 상세페이지
	public Product productInfo(int pNum) {
		Product vo = sqlSession.selectOne("Product.proInfo",pNum);
		return vo;
	}
	
}
