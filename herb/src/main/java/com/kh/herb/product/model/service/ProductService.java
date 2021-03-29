package com.kh.herb.product.model.service;

import java.util.List;

import com.kh.herb.product.model.vo.Product;
import com.kh.herb.product.model.vo.ProductFile;
import com.kh.herb.product.model.vo.ProductPage;

public interface ProductService {
	
	public List<Product> productAllList(ProductPage page) throws Exception;
	
	public List<Product> productCateList(ProductPage page) throws Exception;
	
	public List<Product> productSearchList(ProductPage page) throws Exception;
	
	public Product productInfo(int num) throws Exception;
	
	public List<ProductFile> productInfoFile(int num) throws Exception;
	
	public int starCount(int num) throws Exception;
	
	public int starAvg(int num) throws Exception;
	
	public int proCount() throws Exception;
	
	public int proCategoryCount(String category) throws Exception;
	
	public int proSearchCount(ProductPage page) throws Exception;
	
}
