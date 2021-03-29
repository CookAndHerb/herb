package com.kh.herb.faq.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.herb.faq.model.vo.Faq;

@Repository
public class FaqDAO {

	@Autowired
	private SqlSession sqlSession;

	
	public List<Faq> listAll(String keyword, int start, int end) {
		// 맵에 자료 저장
		//Map<String,Object> map = new HashMap<>();
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		
		return sqlSession.selectList("Faq.listAll",map);
	} 

	public int insertFaq(Faq faq) {
		return sqlSession.insert("Faq.insertFaq",faq);
	}

	public void increaseViewcnt(int faqNum) {
		 sqlSession.update("Faq.increaseViewcnt", faqNum);
	}

	public Faq read(int faqNum) {
		return sqlSession.selectOne("Faq.read",faqNum);
	}
	
	public int deleteFaq(int faqNum) throws Exception {
		return sqlSession.delete("Faq.deleteFaq",faqNum);
	}

	public int getTotalNum() {
		return sqlSession.selectOne("Faq.getTotalNum");
	}

	public int updateFaq(Faq faq) {
		return sqlSession.update("Faq.updateFaq", faq);
	}

}