package com.kh.herb.product.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.herb.product.model.vo.Product;
import com.kh.herb.product.model.vo.ProductFile;
import com.kh.herb.product.model.vo.ProductPage;

@Repository
public class ProductDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 상품 리스트
	public List<Product> productAllList(int startRow, int endRow){
		ProductPage page = new ProductPage();
		page.setStartPage(startRow);
		page.setEndPage(endRow);
		
		List<Product> list = sqlSession.selectList("Product.proAllList", page);
		return list;
	}
	// 상품 카테고리별 리스트
	public List<Product> productCateList(ProductPage page){
		List<Product> list = sqlSession.selectList("Product.proCategoryList", page);
		return list;
	}
	// 상풍 검색 리스트
	public List<Product> productSearchList(ProductPage page){
		List<Product> list = sqlSession.selectList("Product.ProductSearchList", page);
		return list;
	}
	// 상품 상세페이지
	public Product productInfo(int pNum) {
		Product vo = sqlSession.selectOne("Product.proInfo",pNum);
		return vo;
	}
	// 상품 상세페이지 파일 가져오기
	public List<ProductFile> productInfoFile(int pNum) {
		List<ProductFile> file = sqlSession.selectList("ProductFile.selectFile", pNum);
		return file;
	}
	// 리뷰 총 개수
	public void proStarCount(int num) {
		sqlSession.update("Product.proStarCount",num);
	}
	// 상품 총 개수
	public int proCount() {
		return sqlSession.selectOne("Product.proCount"); 
	}
	// 카테고리 총 개수
	public int proCategoryCount(String category) {
		return sqlSession.selectOne("Product.proCategoryCount",category);
	}
	// 검색 총 개수
	public int proSearchCount(ProductPage page) {
		return sqlSession.selectOne("Product.proSearchCount",page);
	}
}
