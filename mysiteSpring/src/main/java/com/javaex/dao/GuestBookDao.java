package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.javaex.vo.GuestBookVo;

@Repository
public class GuestBookDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<GuestBookVo> getlist() {
		 System.out.println("----> sqlSession.selectList()");
		 System.out.println(sqlSession);
		 return sqlSession.selectList("GuestBookXml.selectList");
	}
	
	public int insert(GuestBookVo vo) {
		 System.out.println("----> sqlSession.insert(vo)");
		 System.out.println(sqlSession);
		 return sqlSession.insert("GuestBookXml.insert",vo);
	}
	
	public int delete(GuestBookVo vo) {
		 System.out.println("----> sqlSession.delete(vo)");
		 System.out.println(sqlSession);
		 return sqlSession.delete("GuestBookXml.delete",vo);
	}
	
	
}
