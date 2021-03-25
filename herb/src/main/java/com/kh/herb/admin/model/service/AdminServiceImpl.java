package com.kh.herb.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.herb.admin.model.dao.AdminDAO;
import com.kh.herb.admin.model.vo.Search;
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



}
