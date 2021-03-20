package com.kh.herb.admin.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.herb.product.model.vo.Product;

@Repository
public class AdminDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//상품 등록
	public int insertProduct(Product product) throws Exception{
		return sqlSession.insert("adminProduct", product);
	}
}
