package com.kh.herb.admin.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

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
import com.kh.herb.notice.model.vo.Notice;
import com.kh.herb.product.model.vo.Product;
import com.kh.herb.product.model.vo.ProductFile;
import com.kh.herb.qa.model.vo.Qa;

@Controller 
public class AdminController {
	public static final int LIMIT = 10; //한 페이지에 보여질 정보의 수

	@Autowired
	private AdminService as;

	//관리자 페이지 메인
	@RequestMapping("adminMain.do")
	public ModelAndView adminMain(ModelAndView mav) throws Exception {
		int totalSales = as.totalSales(); //총 매출
		int sales3 = as.sales3(); //3월 매출
		int sales4 = as.sales4(); //4월 매출
		int sell3 = as.sell3(); //3월 판매량
		int sell4 = as.sell4(); //4월 판매량
		
		//공지사항 리스트
		List<Notice> notice = as.adminNoticeList();
		
		//QA 리스트
		List<Qa> Qa = as.adminQaList();
		
		mav.addObject("totalSales", totalSales);
		mav.addObject("sales3", sales3);
		mav.addObject("sales4", sales4);
		mav.addObject("sell3", sell3);
		mav.addObject("sell4", sell4);
		mav.addObject("notice", notice);
		mav.addObject("Qa", Qa);
		mav.setViewName("admin/adminMain");
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

		//단일 이미지와 그 외 정보들 DB전송 및 서버 저장
		int result1 = as.insertProduct(product);
		
		//다중 이미지 DB전송 및 서버 저정
		ProductFile infoFile = new ProductFile();
		for(MultipartFile productInfo : pInfoFiles) {
			infoFile = infoImage(productInfo, request);
			pf.setpInfoFile(infoFile.getpInfoFile());
			pf.setpInfoPath(infoFile.getpInfoPath());
			int cnt = as.insertFile(pf);
		}

		mav.addObject("result1", result1);
		mav.setViewName("product/productInsComplete");
		return mav;
	}

	//상품 수정
	@RequestMapping(value="productUpt.do", method=RequestMethod.POST)
	public ModelAndView updateProduct(ModelAndView mav, Product product, ProductFile pf,
			@RequestParam("pInfoFiles") MultipartFile pInfoFiles[], MultipartHttpServletRequest request) throws Exception {
		MultipartFile image = request.getFile("image");
		int pNum = Integer.parseInt(request.getParameter("pNum"));

		System.out.println("대표 이미지 : "+image.getSize());

		product.setpNum(pNum);

		//상품 대표 이미지
		if(image.getSize() != 0) { //사이즈로 업로드 여부 판단
			Product fileProduct = imageUplode(product, request);
			product.setImageName(fileProduct.getImageName());
			product.setImagePath(fileProduct.getImagePath());
		}else { //product 테이블의 image는 not null 속성을 가지기 때문에 해줘야함
			String existImage = request.getParameter("existImage");
			String existImagePath = request.getParameter("existImagePath");
			product.setImageName(existImage);
			product.setImagePath(existImagePath);
		}
		int result = as.updateProduct(product);

		
		////////////////////////////////////파일테이블 다중 파일 업로드 수정 처리 시작//////////////////////////////////
		//파일 번호 변환을 위한 int형 배열 선언
		//상품 정보 이미지의 번호를 배열로 받아옴
		String[] pInfoNum = request.getParameterValues("pInfoNum");
		int[] pInfoNumArr = null;
		if(pInfoNum!=null) { //업로드한 파일이 없을 수도 잇어서 if문 처리함
			pInfoNumArr = new int[pInfoNum.length];
		}

		for(int i = 0; i<pInfoFiles.length; i++) {
			if(pInfoFiles[i].getSize() != 0) { //업로드한 파일이 있을때
				ProductFile infoFile = new ProductFile();
				pf.setpNum(pNum);
				int cnt = as.deleteFile(pNum); //DB에서 기존 파일 삭제	
				//이전에 서버에 올린 이미지의 이름을 가져옴
				String[] existInfoFile = request.getParameterValues("existInfoFile");
				//가져온 이미지들의 서버 경로를 구함
				if(pInfoNumArr!=null) {
					for(int j = 0; j<pInfoNumArr.length; j++){
						//반복문을 이용해 기존 파일 서버에서 하나씩 삭제
						String root = request.getSession().getServletContext().getRealPath("resources");
						String savePath = root+"\\productImg";

						//기존 파일 이름 가져와서 서버에서 삭제
						File file = new File(savePath+"\\"+existInfoFile[j]);
						if( file.exists() ){ //파일이 존재하면
							if(file.delete()){ //삭제하기!
								System.out.println("파일삭제 성공"); 
							}else{ 
								System.out.println("파일삭제 실패"); 
							} 
						}else{ 
							System.out.println("파일이 존재하지 않습니다."); 
						}	
					}
				}
				System.out.println("delete 결과 : "+cnt);
				for(MultipartFile productInfo : pInfoFiles) {
					infoFile = infoImage(productInfo, request);
					pf.setpInfoFile(infoFile.getpInfoFile());
					pf.setpInfoPath(infoFile.getpInfoPath());
					as.insertFile(pf);
				}
				break; //이중 for문 실행하고 for문은 아예 빠져 나옴
			}
		}
		////////////////////////////////////파일테이블 다중 파일 업로드 수정 처리 끝//////////////////////////////////

		mav.addObject("result", result);
		mav.setViewName("product/productUptComplete");
		return mav;
	}

	//상품 대표 이미지 업로드
	private Product imageUplode(Product product, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		//String root2 = "C:\\finalproject\\herb\\herb\\herb\\src\\main\\webapp\\resources";
		String savePath = root+"\\productImg";
		String filePath = null;
		MultipartFile image = product.getImage();

		//원본이름 저장
		String savedName = image.getOriginalFilename();
		//랜덤생성+파일이름 저장
		String fileName = (int)(Math.random()*1000)+"_"+savedName;

		File folder = new File(savePath);
		if(!folder.exists())
			folder.mkdir();
		filePath = savePath+"\\"+fileName;
		try {
			image.transferTo(new File(filePath));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		product = new Product();
		product.setImageName(fileName);
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

		//원본이름 저장
		String savedName = image.getOriginalFilename();
		//랜덤생성+파일이름 저장
		String fileName = (int)(Math.random()*1000)+"_"+savedName;

		File folder = new File(savePath);
		if(!folder.exists())
			folder.mkdir();

		try {
			filePath = savePath+"\\"+fileName;
			image.transferTo(new File(filePath));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		ProductFile pf = new ProductFile();
		pf.setpInfoFile(fileName);
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
	@RequestMapping(value="orderUpt.do", method=RequestMethod.GET)
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
