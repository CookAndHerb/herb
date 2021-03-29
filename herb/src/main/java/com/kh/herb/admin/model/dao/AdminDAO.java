package com.kh.herb.admin.model.dao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.herb.admin.model.vo.AdminOrder;
import com.kh.herb.admin.model.vo.Pagination;
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
	
	//전체 회원 수
	public int memberCount() throws Exception{
		return sqlSession.selectOne("adminMember.memberCount");
	}
	
	//회원관리(조회)
	public List<Member> memberList(int startPage, int limit) throws Exception{
		int startRow = (startPage-1)*limit;
		Pagination page = new Pagination();
		page.setStart(startRow+1);
		page.setEnd(startRow+10);
		return sqlSession.selectList("adminMember.memberList", page);
	}
	
	//회원검색
	public List<Member> searchMember(int startPage, int limit, String selectType, String keyword) throws Exception{
		int startRow = (startPage-1)*limit;
		Pagination page = new Pagination();
		page.setStart(startRow+1);
		page.setEnd(startRow+10);
		page.setSelectType(selectType);
		page.setKeyword(keyword);
		return sqlSession.selectList("adminMember.searchMember", page);
	}
	
	//검색 결과 개수
	public int searchMemberCount (String selectType, String keyword) throws Exception {
		Pagination page = new Pagination();
		page.setSelectType(selectType);
		page.setKeyword(keyword);
		return sqlSession.selectOne("adminMember.searchMemberCount", page);
	}
	
	//파일 등록
	public int insertFile(ProductFile pf) throws Exception{
		return sqlSession.insert("adminFile.insertFile", pf);
	}

	
	//상품 총 갯수 조회
	public int productCount() throws Exception {
		return sqlSession.selectOne("adminProduct.productCount");
	}
	
	//상품 조회
	public List<Product> productList(int startPage, int limit) throws Exception{
		int startRow = (startPage-1)*limit;
		Pagination page = new Pagination();
		page.setStart(startRow+1);
		page.setEnd(startRow+10);
		return sqlSession.selectList("adminProduct.productList", page);
	}

	
	//선택 상품 조회
	public Product selectProduct(int pNum) throws Exception{
		Product product = sqlSession.selectOne("adminProduct.selectProduct", pNum);
		return product;
	}
	
	//선택 상품에 해당하는 파일 조회
	public List<ProductFile> selectFile(int pNum) throws Exception{
		return sqlSession.selectList("adminFile.selectFile", pNum);
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
	
	//상품검색
	public List<Product> searchProduct(int startPage, int limit, String selectType, String keyword) throws Exception{
		int startRow = (startPage-1)*limit;
		Pagination page = new Pagination();
		page.setStart(startRow+1);
		page.setEnd(startRow+10);
		page.setSelectType(selectType);
		page.setKeyword(keyword);
		return sqlSession.selectList("adminProduct.searchProduct", page);
	}
	
	//상품 검색 결과 개수
	public int searchProductCount (String selectType, String keyword) throws Exception {
		Pagination page = new Pagination();
		page.setSelectType(selectType);
		page.setKeyword(keyword);
		return sqlSession.selectOne("adminProduct.searchProductCount", page);
	}

	//주문 총 갯수 조회
	public int orderCount() throws Exception {
		return sqlSession.selectOne("adminOrder.orderCount");
	}

	//주문 조회
	public List<AdminOrder> orderList(int startPage, int limit) throws Exception{
		int startRow = (startPage-1)*limit;
		Pagination page = new Pagination();
		page.setStart(startRow+1);
		page.setEnd(startRow+10);
		return sqlSession.selectList("adminOrder.orderList", page);
	}
	
	//주문 검색 결과 개수
	public int searchOrderCount (String selectType, String keyword) throws Exception {
		Pagination page = new Pagination();
		page.setSelectType(selectType);
		page.setKeyword(keyword);
		return sqlSession.selectOne("adminOrder.searchOrderCount", page);
	}

	//주문 검색
	public List<AdminOrder> searchOrder(int startPage, int limit, String selectType, String keyword) throws Exception{
		int startRow = (startPage-1)*limit;
		Pagination page = new Pagination();
		page.setStart(startRow+1);
		page.setEnd(startRow+10);
		page.setSelectType(selectType);
		page.setKeyword(keyword);
		return sqlSession.selectList("adminOrder.searchOrder", page);
	}
	
	//주문 상세
	public List<AdminOrder> selectOrder(int orderNum) throws Exception{
		return sqlSession.selectList("adminOrder.selectOrder", orderNum);
	}
	
	//배송 상태 수정
	public int updateOrder(String orderStatus, int orderNum) throws Exception{
		AdminOrder ao = new AdminOrder();
		ao.setOrderStatus(orderStatus);
		ao.setOrderNum(orderNum);
		return sqlSession.update("adminOrder.updateOrder", ao);
	}
	
	//3월 매출
	public int totalSales() throws Exception{
		return sqlSession.selectOne("adminOrder.totalSales");
	}

}
