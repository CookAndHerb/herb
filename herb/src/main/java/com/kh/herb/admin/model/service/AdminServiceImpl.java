package com.kh.herb.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.herb.admin.model.dao.AdminDAO;
import com.kh.herb.admin.model.vo.AdminOrder;
import com.kh.herb.member.model.vo.Member;
import com.kh.herb.product.model.vo.Product;
import com.kh.herb.product.model.vo.ProductFile;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDAO ad;
	
	@Override
	public int insertProduct(Product product) throws Exception {
		return ad.insertProduct(product);
	}
	
	@Override
	public int memberCount() throws Exception {
		return ad.memberCount();
	}
	
	@Override
	public List<Member> memberList(int startPage, int limit) throws Exception {
		return ad.memberList(startPage, limit);
	}

	@Override
	public List<Member> searchMember(int startPage, int limit, String selectType, String keyword) throws Exception {
		return ad.searchMember(startPage, limit, selectType, keyword);
	}
	
	public int searchMemberCount (String selectType, String keyword) throws Exception{
		return ad.searchMemberCount(selectType, keyword);
	}

	@Override
	public int insertFile(ProductFile pf) throws Exception {
		return ad.insertFile(pf);
	}

	@Override
	public List<Product> productList(int startPage, int limit) throws Exception {
		return ad.productList(startPage, limit);
	}

	@Override
	public Product selectProduct(int pNum) throws Exception {
		return ad.selectProduct(pNum);
	}

	@Override
	public List<ProductFile> selectFile(int pNum) throws Exception {
		return ad.selectFile(pNum);
	}

	@Override
	public int updateProduct(Product product) throws Exception {
		return ad.updateProudct(product);
	}

	@Override
	public int updateFile(ProductFile pf) throws Exception {
		return ad.updateFile(pf);
	}

	@Override
	public int deleteProduct(int pNum) throws Exception {
		return ad.deleteProduct(pNum);
	}

	@Override
	public int deleteFile(int pNum) throws Exception {
		return ad.deleteFile(pNum);
	}

	@Override
	public int productCount() throws Exception {
		return ad.productCount();
	}

	@Override
	public int searchProductCount(String selectType, String keyword) throws Exception {
		return ad.searchProductCount(selectType, keyword);
	}

	@Override
	public List<Product> searchProduct(int startPage, int limit, String selectType, String keyword) throws Exception {
		return ad.searchProduct(startPage, limit, selectType, keyword);
	}

	@Override
	public int orderCount() throws Exception {
		return ad.orderCount();
	}

	@Override
	public List<AdminOrder> orderList(int startPage, int limit) throws Exception {
		return ad.orderList(startPage, limit);
	}

	@Override
	public int searchOrderCount(String selectType, String keyword) throws Exception {
		return ad.searchOrderCount(selectType, keyword);
	}

	@Override
	public List<AdminOrder> searchOrder(int startPage, int limit, String selectType, String keyword) throws Exception {
		return ad.searchOrder(startPage, limit, selectType, keyword);
	}

	@Override
	public List<AdminOrder> selectOrder(int orderNum) throws Exception {
		return ad.selectOrder(orderNum);
	}

	@Override
	public int updateOrder(String orderStatus, int orderNum) throws Exception {
		return ad.updateOrder(orderStatus, orderNum);
	}

	@Override
	public int totalSales() throws Exception {
		return ad.totalSales();
	}

	@Override
	public int deleteOne(int pInfoNum) throws Exception {
		return ad.deleteOne(pInfoNum);
	}
	
}

