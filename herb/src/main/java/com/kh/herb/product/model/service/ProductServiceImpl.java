package com.kh.herb.product.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.herb.product.model.dao.ProductDAO;
import com.kh.herb.product.model.vo.Product;
import com.kh.herb.product.model.vo.ProductFile;
import com.kh.herb.product.model.vo.ProductPage;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	ProductDAO dao;
	
	@Override
	public List<Product> productAllList(int startRow, int endRow) throws Exception {
		List<Product> list = dao.productAllList(startRow, endRow);
		return list;
	}

	@Override
	public Product productInfo(int num) throws Exception {
		Product vo = dao.productInfo(num);
		return vo;
	}

	@Override
	public List<ProductFile> productInfoFile(int num) throws Exception {
		List<ProductFile> file = dao.productInfoFile(num);
		return file;
	}

	@Override
	public void proStarCount(int num) throws Exception {
		dao.proStarCount(num);
	}

	@Override
	public int proCount() throws Exception {
		return dao.proCount();
	}

	@Override
	public List<Product> productCateList(ProductPage page) throws Exception {
		return dao.productCateList(page);
	}

	@Override
	public int proCategoryCount(String category) throws Exception {
		return dao.proCategoryCount(category);
	}

	@Override
	public List<Product> productSearchList(ProductPage page) throws Exception {
		return dao.productSearchList(page);
	}

	@Override
	public int proSearchCount(String keyword) throws Exception {
		return dao.proSearchCount(keyword);
	}

}
