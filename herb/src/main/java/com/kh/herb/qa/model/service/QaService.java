package com.kh.herb.qa.model.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.kh.herb.qa.model.vo.Qa;

public interface QaService {

	public int getTotalNum() throws Exception;

	public List<Qa> listAll(String selectMenu, String keyword, int start, int end) throws Exception;

	public int insertQa(Qa qa) throws Exception;

	public int getRef() throws Exception;

	public void increaseViewcnt(int qaNum, HttpSession session) throws Exception;

	public Qa read(int qaNum) throws Exception;

	public String getQaPassword(int qaNum) throws Exception;

	public int updateQa(Qa qa) throws Exception;

	public int deleteQa(int qaNum) throws Exception;

	public void reStepCount(Qa qa) throws Exception;

	public int reInsert(Qa qa) throws Exception;


}
