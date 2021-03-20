package com.kh.herb.admin.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.herb.admin.model.dao.AdminDAO;
import com.kh.herb.product.model.vo.Product;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDAO ad;
	
	@Override
	public int insertProduct(Product product) throws Exception {
		return ad.insertProduct(product);
	}

}
