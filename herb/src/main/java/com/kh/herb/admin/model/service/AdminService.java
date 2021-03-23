package com.kh.herb.admin.model.service;

import java.util.List;

import com.kh.herb.admin.model.vo.Search;
import com.kh.herb.member.model.vo.Member;
import com.kh.herb.product.model.vo.Product;
import com.kh.herb.product.model.vo.ProductFile;

public interface AdminService {
	public int insertProduct(Product product) throws Exception;
	public List<Member> memberList() throws Exception;
	public List<Member> searchMember(Search search) throws Exception;
	public int insertFile(ProductFile pf) throws Exception;
}
