package com.kh.herb.review.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.herb.product.model.service.ProductService;
import com.kh.herb.review.model.service.ReviewService;
import com.kh.herb.review.model.vo.Review;
import com.kh.herb.review.model.vo.ReviewFile;



@Controller
public class ReviewController {

	@Autowired
	ReviewService reSe;
	
	@Autowired
	ProductService proSe;
	
	// 리뷰 등록
	@ResponseBody
	@RequestMapping(value="reviewInsert.do", method=RequestMethod.POST)
	public String reInsert(Review review, HttpServletRequest request) throws Exception{	
		
		//Review review = new Review();
		System.out.println(review.getrWriter());
		System.out.println(review.getpNum());
		System.out.println(review.getrContent());
		System.out.println("Controller reInsert 메서드 실행");
		
		List<MultipartFile> files = review.getFileName();
		List<ReviewFile> fList = new ArrayList<ReviewFile>();
		
		if(files != null) {
			for(MultipartFile file : files) {
				// 원래 파일명
				String fileName = file.getOriginalFilename();
				System.out.println("fileName: "+fileName);
				
				// 중복 제거를 위해 난수 발생 후 파일명을 db테이블에 저장
				UUID random = UUID.randomUUID();
				String filePath = request.getSession().getServletContext().getRealPath("resources");
				String saveDirectory = filePath + File.separator + "reviewImg";
				System.out.println("파일 루트: "+saveDirectory);
				
				File fe = new File(saveDirectory);
				if(!fe.exists()) {
					System.out.println("폴더 생성");
					fe.mkdir();
				}
				
				// fileName과 난수 합치기
				File ff = new File(saveDirectory, random +"_"+fileName);
				System.out.println("서버에 저장할 파일 이름: "+ff);
				
				// 파일 안에 있는 내용 읽어와서 서버에 저장
				try {
					FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(ff));
				}catch(FileNotFoundException e) {
					e.printStackTrace();
				}catch(IOException e) {
					e.printStackTrace();
				}
				
				// 파일 경로, 상품번호, 댓글번호 저장 후 mFilelist로 넘김
				ReviewFile reFile = new ReviewFile();
				reFile.setpNum(review.getpNum());
				reFile.setrFile(random +"_"+fileName);
				reFile.setrNum(review.getrNum());
				
				fList.add(reFile);
				review.setmFileList(fList); 
			}
		}
		int result = reSe.reviewInsert(review);
		System.out.println("추가된 리뷰 수:"+result);
		
		int count = proSe.starCount(review.getpNum()); // 리뷰 총 개수 업데이트
		int avg = proSe.starAvg(review.getpNum()); // 리뷰 평균 업데이트
		System.out.println("리뷰 개수 업데이트: "+count);
		System.out.println("리뷰 평균 업데이트: "+avg);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("num", review.getpNum());
		jsonObject.put("moveUrl", "productInfo.do");
		
		return jsonObject.toJSONString();
	}
	
	//리뷰 삭제
	@RequestMapping(value="reviewDelete.do", method=RequestMethod.GET)
	@ResponseBody
	public String reviewDelete(@RequestParam("rNum") int rNum, @RequestParam("num") int num) throws Exception{
		System.out.println("controller reviewDelete 메서드 실행");
		System.out.println("rNum: "+rNum);
		
		int rf = reSe.reviewFileDelete(rNum);
		int re = reSe.reviewDelete(rNum);
		String result = rf+re+"";
		
		int count = proSe.starCount(num); // 리뷰 총 개수 업데이트
		int avg = proSe.starAvg(num); // 리뷰 평균 업데이트
		System.out.println("리뷰 개수 업데이트: "+count);
		System.out.println("리뷰 평균 업데이트: "+avg);
		System.out.println("결과: "+result);
		JSONObject jo = new JSONObject();
		jo.put("result", result);
		jo.put("num", num);
		jo.put("moveUrl","productInfo.do");
		
		return jo.toJSONString();
	}
	@ResponseBody
	@RequestMapping(value="orderCheck.do", method=RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public String OrderCheck(@RequestParam("pNum") int pNum, @RequestParam("rWriter") String rWriter) throws Exception{		
		Review review = new Review();
		review.setpNum(pNum);
		review.setrWriter(rWriter);
		
		String order = reSe.reviewOrderCheck(review);
		System.out.println("주문상태: "+order);
		JSONObject jo = new JSONObject();
		jo.put("order",order);
		
		return jo.toJSONString();
	}
	
}
