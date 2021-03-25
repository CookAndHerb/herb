package com.kh.herb.product.model.service;

import java.util.List;

import com.kh.herb.product.model.vo.Product;
import com.kh.herb.product.model.vo.ProductFile;

public interface ProductService {
	
	public List<Product> productAllList() throws Exception;
	
	public Product productInfo(int num) throws Exception;
	
	public List<ProductFile> productInfoFile(int num) throws Exception;
}
