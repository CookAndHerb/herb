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

}
