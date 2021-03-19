package com.kh.herb.product.model.service;

import java.util.List;

import com.kh.herb.product.model.vo.Product;

public interface ProductService {
	
	public List<Product> productAllList() throws Exception;
	
	public Product productInfo(int num) throws Exception;
}
