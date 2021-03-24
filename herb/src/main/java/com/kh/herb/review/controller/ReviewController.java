package com.kh.herb.review.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

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

import com.kh.herb.review.model.service.ReviewService;
import com.kh.herb.review.model.vo.Review;
import com.kh.herb.review.model.vo.ReviewFile;



@Controller
public class ReviewController {

	@Autowired
	ReviewService reSe;
	
	// 리뷰 등록
	@ResponseBody
	@RequestMapping(value="reviewInsert.do", method=RequestMethod.POST)
	public String reInsert(Review review) throws Exception{	
		
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
				String saveDirectory = "C:\\Temp";
				
				// temp 폴더 없는 경우 만들기
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
		reSe.reviewInsert(review);
		//modelAndView.addObject("num", review.getpNum()); // 상품인포 주소에 들어갈 번호
		//modelAndView.setViewName("product/reviewComplete");
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("num", review.getpNum());
		jsonObject.put("moveUrl", "productInfo.do");
		
		return jsonObject.toJSONString();
	}
	
}
