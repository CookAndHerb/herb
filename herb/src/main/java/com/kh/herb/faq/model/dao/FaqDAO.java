package com.kh.herb.faq.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.herb.faq.model.vo.Pager;
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
}