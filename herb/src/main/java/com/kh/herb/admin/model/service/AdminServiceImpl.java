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
	public List<Member> memberList() throws Exception {
		return ad.memberList();
	}

	@Override
	public List<Member> searchMember(Search search) throws Exception {
		return ad.searchMember(search);
	}

	@Override
	public int insertFile(ProductFile pf) throws Exception {
		return ad.insertFile(pf);
	}

	@Override
	public List<Product> productList() throws Exception {
		return ad.productList();
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

}
