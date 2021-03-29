package com.kh.herb.admin.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import com.kh.herb.admin.model.service.AdminService;
import com.kh.herb.admin.model.vo.AdminOrder;
import com.kh.herb.member.model.vo.Member;
import com.kh.herb.product.model.vo.Product;
import com.kh.herb.product.model.vo.ProductFile;

@Controller
public class AdminController {
	public static final int LIMIT = 10; //한 페이지에 보여질 정보의 수
	
	@Autowired
	private AdminService as;
	
	//관리자 페이지 메인
	@RequestMapping("adminMain.do")
	public ModelAndView adminMain(ModelAndView mav) throws Exception {
		int totalSales = as.totalSales();
		mav.addObject("totalSales", totalSales);
		mav.setViewName("admin/adminMain");
		//mav.setViewName("admin/adminChart");
		return mav;
	}
	
	//상품등록 페이지
	@RequestMapping("productIns.do")
	public String productInsPage() {
		return "product/productIns";
	}

	
	//상품등록
	@RequestMapping(value="productIns.do", method=RequestMethod.POST)
	public ModelAndView insertProduct(ModelAndView mav, Product product, ProductFile pf, 
			@RequestParam("pInfoFiles") MultipartFile pInfoFiles[], MultipartHttpServletRequest request) throws Exception {
		Product fileProduct = imageUplode(product, request);
		
		product.setImageName(fileProduct.getImageName());
		product.setImagePath(fileProduct.getImagePath());

		
		int result1 = as.insertProduct(product);
		//System.out.println(product.getpNum());
		
		ProductFile infoFile = new ProductFile();
		
		for(MultipartFile productInfo : pInfoFiles) {
			 infoFile = infoImage(productInfo, request);
			 pf.setpInfoFile(infoFile.getpInfoFile());
			 pf.setpInfoPath(infoFile.getpInfoPath());
			 int cnt = as.insertFile(pf);
		}
		
		
//		pf.setpInfoFile(infoFile.getpInfoFile());
//		pf.setpInfoPath(infoFile.getpInfoPath());
//		
//		int result2 = as.insertFile(pf);
		
		mav.addObject("result1", result1);
		mav.setViewName("product/productInsComplete");
		return mav;
	}
	
	//상품 수정
	@RequestMapping(value="productUpt.do", method=RequestMethod.POST)
	public ModelAndView updateProduct(ModelAndView mav, Product product, ProductFile pf,
			@RequestParam("pInfoFiles") MultipartFile pInfoFiles[], MultipartHttpServletRequest request) throws Exception {
		String image = request.getParameter("image");
		int pNum = Integer.parseInt(request.getParameter("pNum"));

		product.setpNum(pNum);
		
		if(image != null) {
			Product fileProduct = imageUplode(product, request);
			product.setImageName(fileProduct.getImageName());
			product.setImagePath(fileProduct.getImagePath());
		}else {
			String existImage = request.getParameter("existImage");
			String existImagePath = request.getParameter("existImagePath");
			product.setImageName(existImage);
			product.setImagePath(existImagePath);
		}
		
		int result = as.updateProduct(product);

		ProductFile infoFile = new ProductFile();
		pf.setpNum(pNum);
		
		if(pInfoFiles.length > 1) {
			for(MultipartFile productInfo : pInfoFiles) {
				infoFile = infoImage(productInfo, request);
				pf.setpInfoFile(infoFile.getpInfoFile());				
				System.out.println("파일업데이트 : "+infoFile.getpInfoFile());				
				pf.setpInfoPath(infoFile.getpInfoPath());				
				System.out.println("경로업데이트 : "+infoFile.getpInfoPath());				
				int cnt = as.updateFile(pf);
			}
		}else {
			String[] existInfoFile = request.getParameterValues("existInfoFile");
			String[] existInfoPath = request.getParameterValues("existInfoPath");
			for(int i = 0; i<existInfoFile.length; i++) {
				System.out.println(i+"번 기존 파일 이름 : "+existInfoFile[i]);		
				pf.setpInfoFile(existInfoFile[i]);
				System.out.println(i+"번 기존 파일 경로 : "+existInfoPath[i]);
				pf.setpInfoPath(existInfoPath[i]);
				int cnt = as.updateFile(pf);
			}
		}
			
		mav.addObject("result", result);
		mav.setViewName("product/productUptComplete");
		return mav;
	}
	
	//상품 대표 이미지 업로드
	private Product imageUplode(Product product, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		//String root = "C:\\finalproject\\herb\\herb\\herb\\src\\main\\webapp\\resources";
		String savePath = root+"\\productImg";
		String filePath = null;
		MultipartFile image = product.getImage();
		File folder = new File(savePath);
		if(!folder.exists())
			folder.mkdir();
		filePath = savePath+"\\"+image.getOriginalFilename();
		//product.setImagePath(filePath);
		//product.setInfoImagePath(filePath);
		try {
			image.transferTo(new File(filePath));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		product = new Product();
		product.setImageName(image.getOriginalFilename());
		product.setImagePath(savePath);
		return product;
	}
	
	//상품 정보 이미지 업로드
	private ProductFile infoImage(MultipartFile infoImage, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		//String root = "C:\\finalproject\\herb\\herb\\herb\\src\\main\\webapp\\resources";
		String savePath = root+"\\productImg";
		String filePath = null;
		MultipartFile image = infoImage;
		File folder = new File(savePath);
		if(!folder.exists())
			folder.mkdir();
		
		//product.setImagePath(filePath);
		//product.setInfoImagePath(filePath);
		try {
			filePath = savePath+"\\"+image.getOriginalFilename();
			image.transferTo(new File(filePath));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		ProductFile pf = new ProductFile();
		pf.setpInfoFile(image.getOriginalFilename());
		pf.setpInfoPath(savePath);
		return pf;
	}
	
	
	//회원관리
	@RequestMapping("adminMember.do")
	public ModelAndView memberList(@RequestParam(name = "page", defaultValue = "1") int page, ModelAndView mav) throws Exception{		
		int currentPage = page;
		//한 페이지당 출력할 목록 갯수
		int listCount = as.memberCount();
		int maxPage = (int) ((double)listCount/LIMIT + 0.9);
		int naviCountPerPage = 5;
		int startNavi = ((currentPage-1)/naviCountPerPage)*naviCountPerPage+1;
		int endNavi = startNavi + naviCountPerPage -1;
		if(endNavi > maxPage) {
			endNavi = maxPage;
		}
		mav.addObject("startPage", startNavi);
		mav.addObject("endPage", endNavi);
		mav.addObject("memberList", as.memberList(currentPage, LIMIT));
		mav.addObject("currentPage", currentPage);
		mav.addObject("maxPage", maxPage);
		mav.addObject("listCount", listCount);
		mav.setViewName("admin/adminMember");
		return mav;
	}
	
	//회원 검색
	@RequestMapping("searchMember.do")
	public ModelAndView searchMember(ModelAndView mav, @RequestParam(value="selectType", required=false) String selectType, 
			@RequestParam(value="keyword", required=false) String keyword, @RequestParam(name = "page", defaultValue = "1") int page) throws Exception{		
		int currentPage = page;
		//한 페이지당 출력할 목록 갯수
		int listCount = as.searchMemberCount(selectType, keyword);
		int maxPage = (int) ((double)listCount/LIMIT + 0.9);
		int naviCountPerPage = 5;
		int startNavi = ((currentPage-1)/naviCountPerPage)*naviCountPerPage+1;
		int endNavi = startNavi + naviCountPerPage -1;
		if(endNavi > maxPage) {
			endNavi = maxPage;
		}
		mav.addObject("startPage", startNavi);
		mav.addObject("endPage", endNavi);
		mav.addObject("memberList", as.searchMember(currentPage, LIMIT, selectType, keyword));
		mav.addObject("currentPage", currentPage);
		mav.addObject("maxPage", maxPage);
		mav.addObject("listCount", listCount);
		mav.addObject("keyword", keyword);
		mav.addObject("selectType", selectType);
		mav.setViewName("admin/searchMember");
		return mav;
	}

	
	//상품 조회
	@RequestMapping("adminProduct.do")
	public ModelAndView productList(@RequestParam(name = "page", defaultValue = "1") int page, ModelAndView mav) throws Exception{
//		List<Product> productList = as.productList();
//		mav.addObject("productList", productList);
//		mav.setViewName("admin/adminProduct");
//		return mav;
		
		int currentPage = page;
		//한 페이지당 출력할 목록 갯수
		int listCount = as.productCount();
		int maxPage = (int) ((double)listCount/LIMIT + 0.9);
		
		int naviCountPerPage = 5;
		int startNavi = ((currentPage-1)/naviCountPerPage)*naviCountPerPage+1;
		int endNavi = startNavi + naviCountPerPage -1;
		if(endNavi > maxPage) {
			endNavi = maxPage;
		}
		mav.addObject("startPage", startNavi);
		mav.addObject("endPage", endNavi);
		mav.addObject("productList", as.productList(currentPage, LIMIT));
		mav.addObject("currentPage", currentPage);
		mav.addObject("maxPage", maxPage);
		mav.addObject("listCount", listCount);
		mav.setViewName("admin/adminProduct");
		return mav;
	}
	
	//상품 수정 페이지
	@RequestMapping("productUpt.do")
	public ModelAndView updateProductPage(ModelAndView mav, int pNum) throws Exception{
		Product product = as.selectProduct(pNum);
		List<ProductFile> pfList = as.selectFile(pNum);
		mav.addObject("product", product);
		mav.addObject("productFile", pfList);
		mav.setViewName("product/productUpt");
		return mav;
	}
	
	//상품 삭제
	@RequestMapping("productDel.do")
	public ModelAndView deleteProduct(ModelAndView mav, int pNum) throws Exception{
		int result = as.deleteProduct(pNum);
		
		mav.addObject("result", result);
		mav.setViewName("product/productDelComplete");
		return mav;
	}
	
	//상품 검색
	@RequestMapping("searchProduct.do")
	public ModelAndView searchProduct(ModelAndView mav, @RequestParam(value="selectType", required=false) String selectType, 
			@RequestParam(value="keyword", required=false) String keyword, @RequestParam(name = "page", defaultValue = "1") int page) throws Exception{
	
		int currentPage = page;
		//한 페이지당 출력할 목록 갯수
		int listCount = as.searchProductCount(selectType, keyword);
		int maxPage = (int) ((double)listCount/LIMIT + 0.9);
		
		int naviCountPerPage = 5;
		int startNavi = ((currentPage-1)/naviCountPerPage)*naviCountPerPage+1;
		int endNavi = startNavi + naviCountPerPage -1;
		if(endNavi > maxPage) {
			endNavi = maxPage;
		}
		mav.addObject("startPage", startNavi);
		mav.addObject("endPage", endNavi);
		mav.addObject("productList", as.searchProduct(currentPage, LIMIT, selectType, keyword));
		mav.addObject("currentPage", currentPage);
		mav.addObject("maxPage", maxPage);
		mav.addObject("listCount", listCount);
		mav.addObject("keyword", keyword);
		mav.addObject("selectType", selectType);
		mav.setViewName("admin/searchProduct");
		return mav;
	}
	
	//주문 조회
	@RequestMapping("adminOrder.do")
	public ModelAndView orderList(@RequestParam(name = "page", defaultValue = "1") int page, ModelAndView mav) throws Exception{
		int currentPage = page;
		//한 페이지당 출력할 목록 갯수
		int listCount = as.orderCount();
		int maxPage = (int) ((double)listCount/LIMIT + 0.9);
		
		int naviCountPerPage = 5;
		int startNavi = ((currentPage-1)/naviCountPerPage)*naviCountPerPage+1;
		int endNavi = startNavi + naviCountPerPage -1;
		if(endNavi > maxPage) {
			endNavi = maxPage;
		}
		mav.addObject("startPage", startNavi);
		mav.addObject("endPage", endNavi);
		mav.addObject("orderList", as.orderList(currentPage, LIMIT));
		mav.addObject("currentPage", currentPage);
		mav.addObject("maxPage", maxPage);
		mav.addObject("listCount", listCount);
		mav.setViewName("admin/adminOrder");
		return mav;
	}
	
	//주문 검색
	@RequestMapping("searchOrder.do")
	public ModelAndView searchOrder(ModelAndView mav, @RequestParam(value="selectType", required=false) String selectType, 
			@RequestParam(value="keyword", required=false) String keyword, @RequestParam(name = "page", defaultValue = "1") int page) throws Exception{
	
		int currentPage = page;
		//한 페이지당 출력할 목록 갯수
		int listCount = as.searchOrderCount(selectType, keyword);
		int maxPage = (int) ((double)listCount/LIMIT + 0.9);
		int naviCountPerPage = 5;
		int startNavi = ((currentPage-1)/naviCountPerPage)*naviCountPerPage+1;
		int endNavi = startNavi + naviCountPerPage -1;
		if(endNavi > maxPage) {
			endNavi = maxPage;
		}
		mav.addObject("startPage", startNavi);
		mav.addObject("endPage", endNavi);
		mav.addObject("orderList", as.searchOrder(currentPage, LIMIT, selectType, keyword));
		mav.addObject("currentPage", currentPage);
		mav.addObject("maxPage", maxPage);
		mav.addObject("listCount", listCount);
		mav.addObject("keyword", keyword);
		mav.addObject("selectType", selectType);
		mav.setViewName("admin/searchOrder");
		return mav;
	}
	
	//주문 상세 페이지
	@RequestMapping("adminOrderDetail.do")
	public ModelAndView selectOrder(ModelAndView mav, int orderNum) throws Exception {
		List<AdminOrder> order = as.selectOrder(orderNum);
		mav.addObject("order", order);
		mav.setViewName("admin/adminOrderDetail");
		return mav;
	}
	
	//배송상태수정
	@RequestMapping(value="orderUpt.do", method=RequestMethod.POST)
	@ResponseBody
	public String updateOrder(@RequestParam(value="orderStatus", required=false) String orderStatus, @RequestParam(value="orderNum", required=false) int orderNum) throws Exception{
		int result = as.updateOrder(orderStatus, orderNum);
		
		JSONObject jsonData = new JSONObject();
		if(result==0){
			jsonData.put("ok", "");
		} else {
			jsonData.put("ok", "dup");
		}
		
		return jsonData.toJSONString();
	}
}
