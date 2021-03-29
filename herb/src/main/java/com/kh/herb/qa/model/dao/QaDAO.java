package com.kh.herb.qa.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.herb.qa.model.vo.Qa;

@Repository
public class QaDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public int getTotalNum() {
		return sqlSession.selectOne("Qa.getTotalNum");
	}

	public List<Qa> listAll(String selectMenu, String keyword, int start, int end) {
		// map에 자료 저장
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("selectMenu", selectMenu);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		
		return sqlSession.selectList("Qa.listAll",map);
	}

	public int insertQa(Qa qa) {
		return sqlSession.insert("Qa.insertQa",qa);
	}

	public int getRef() {
		return sqlSession.selectOne("Qa.getRef");
	}

	public void increaseViewcnt(int qaNum) {
		sqlSession.update("Qa.increaseViewcnt",qaNum);
	}

	public Qa read(int qaNum) {
		return sqlSession.selectOne("Qa.read",qaNum);
	}

	public String getQaPassword(int qaNum) {
		return sqlSession.selectOne("Qa.getQaPassword",qaNum);
	}

	public int updateQa(Qa qa) {
		return sqlSession.update("Qa.updateQa",qa);
	}

	public int deleteQa(int qaNum) {
		return sqlSession.delete("Qa.deleteQa",qaNum);
	}

	public void reStepCount(Qa qa) {
		sqlSession.update("Qa.reStepCount",qa);
	}

	public int reInsert(Qa qa) {
		return sqlSession.insert("Qa.reInsert",qa);
	}


}
