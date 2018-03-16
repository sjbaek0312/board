package com.sj.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sj.domain.UserVO;
import com.sj.dto.LoginDTO;

@Repository
public class UserDAO {
	
	@Inject private SqlSession session;
	private static String namespace = "com.sj.mapper.UserMapper";
	
	public void create(UserVO vo)
	{
		session.insert(namespace + ".create", vo);
	}
	
	public UserVO read(String userId)
	{
		return session.selectOne(namespace + ".read", userId);
	}
	
	public List<UserVO> listAll()
	{
		return session.selectList(namespace + ".listAll");
	}
	
	public void update(UserVO vo)
	{
		session.update(namespace + ".update", vo);
	}
	
	public void delete(String userId)
	{
		session.delete(namespace + ".delete", userId);
	}
	
	public UserVO login(LoginDTO dto)
	{
		return session.selectOne(namespace + ".login", dto);
	}
}
