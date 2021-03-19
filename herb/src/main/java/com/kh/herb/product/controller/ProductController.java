package com.kh.herb.product.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.herb.product.model.service.ProductService;
import com.kh.herb.product.model.vo.Product;

@Controller
public class ProductController {
	@Autowired
	ProductService proSe;
	
	@RequestMapping(value="product.do")
	public ModelAndView productAllList(ModelAndView modelAndView) throws Exception {
		List<Product> list = proSe.productAllList();
		modelAndView.addObject("list",list);
		modelAndView.setViewName("product/product");
		
		return modelAndView;
	}
	
	/*
	 * @RequestMapping("productInfo.do") public String shopInfo(Model
	 * model, @RequestParam("num") int num) throws Exception{ Product pro =
	 * proSe.productInfo(num); List<Review> review = shopSe.shopReAllList(num);
	 * model.addAttribute("vo",shop); model.addAttribute("review",review);
	 * 
	 * return "shopping/shopInfo";
	 * 
	 * }
	 */
	
}
