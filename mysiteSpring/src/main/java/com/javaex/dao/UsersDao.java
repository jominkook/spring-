package com.javaex.dao;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.javaex.vo.UsersVo;


@Repository
public class UsersDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insert(UsersVo vo) {
		System.out.println("user----> sqlSession.insert(vo)");
		System.out.println(sqlSession);
		return sqlSession.insert("UsersXml.insert",vo);
	}
	
	public UsersVo getUser(UsersVo vo) {
		System.out.println("----> sqlSession.getUser(vo)");
		System.out.println(sqlSession);
		System.out.println(vo.getEmail());
		System.out.println(vo.getPassword());
		System.out.println("로그인 성공!!");
		return vo;
		
	}
	public int update(UsersVo vo) {
		System.out.println("----> sqlSession.update(vo)");
		System.out.println(sqlSession);
		return sqlSession.update("UsersXml.update",vo);
		
	}

}
