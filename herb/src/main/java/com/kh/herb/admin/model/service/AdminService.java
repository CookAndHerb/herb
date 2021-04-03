package com.kh.herb.admin.model.service;

import java.util.List;

import com.kh.herb.admin.model.vo.AdminOrder;
import com.kh.herb.member.model.vo.Member;
import com.kh.herb.notice.model.vo.Notice;
import com.kh.herb.product.model.vo.Product;
import com.kh.herb.product.model.vo.ProductFile;
import com.kh.herb.qa.model.vo.Qa;

public interface AdminService {

	public int insertProduct(Product product) throws Exception;
	public int memberCount() throws Exception;
	public List<Member> memberList(int startPage, int limit) throws Exception;
	public int searchMemberCount (String selectType, String keyword) throws Exception;
	public List<Member> searchMember(int startPage, int limit, String selectType, String keyword) throws Exception;
	public int insertFile(ProductFile pf) throws Exception;
	public int productCount() throws Exception;
	public List<Product> productList(int startPage, int limit) throws Exception;
	public Product selectProduct(int pNum) throws Exception;
	public List<ProductFile> selectFile(int pNum) throws Exception;
	public int updateProduct(Product product) throws Exception;
	public int updateFile(ProductFile pf) throws Exception;
	public int deleteProduct(int pNum) throws Exception;
	public int deleteFile(int pNum) throws Exception;
	public int searchProductCount (String selectType, String keyword) throws Exception;
	public List<Product> searchProduct(int startPage, int limit, String selectType, String keyword) throws Exception;
	public int orderCount() throws Exception;
	public List<AdminOrder> orderList(int startPage, int limit) throws Exception;
	public int searchOrderCount (String selectType, String keyword) throws Exception;
	public List<AdminOrder> searchOrder(int startPage, int limit, String selectType, String keyword) throws Exception;
	public List<AdminOrder> selectOrder(int orderNum) throws Exception;
	public int updateOrder(String orderStatus, int orderNum) throws Exception;
	public int sales3() throws Exception;
	public int sales4() throws Exception;
	public int sell3() throws Exception;
	public int sell4() throws Exception;
	public int totalSales() throws Exception;
	public List<Notice> adminNoticeList() throws Exception;
	public List<Qa> adminQaList() throws Exception;
}
