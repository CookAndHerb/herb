package com.kh.herb.notice.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.herb.notice.model.vo.Notice;
import com.kh.herb.notice.model.vo.NoticePage;

@Repository
public class NoticeDAO {

	 @Autowired
	 private SqlSession sqlSession;
	 
	 public int listCount() {
		 return sqlSession.selectOne("Notice.noticeListCount");
	 }
	 
	 public List<Notice> noticeList(int startPage, int limit) throws Exception{
		 int startRow = (startPage - 1) * limit;
 		 NoticePage noticePage = new NoticePage();
		 noticePage.setStart(startRow+1);
		 noticePage.setEnd(startRow+10);
		 return sqlSession.selectList("Notice.noticeList", noticePage);
	 }
	 
	 public int insertNotice(Notice notice) throws Exception{
		 return sqlSession.insert("Notice.insertNotice", notice);
	 }
	 
	 public int updateNotice(Notice notice) throws Exception{
		 return sqlSession.update("Notice.updateNotice", notice);
	 }
	 
	 public int deleteNotice(int noticeNum) throws Exception{
		 Notice notice = new Notice();
		 notice.setNoticeNum(noticeNum);
		 
		 return sqlSession.delete("Notice.deleteNotice", notice);
	 }
	 
	 public Notice selectNotice(int noticeNum) throws Exception{
		 Notice notice = new Notice();
		 notice.setNoticeNum(noticeNum);
		 
		 return sqlSession.selectOne("Notice.selectNotice", notice);
	 }
	 
	 public int readCount(Notice notice) throws Exception{
		 return sqlSession.update("Notice.readCount", notice);
	 }
}
