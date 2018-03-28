package com.sj.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sj.vo.PostVO;

@Repository
public class PostDAO {

	@Inject private SqlSession session;
	private static String namespace = "com.sj.mapper.PostMapper";
	
	public void create(PostVO vo)
	{
		session.insert(namespace + ".create", vo);
	}
	
	public PostVO read(int postId)
	{
		return session.selectOne(namespace + ".read", postId);
	}
	
	public List<PostVO> listAll()
	{
		return session.selectList(namespace + ".listAll");
	}
	
	public List<PostVO> list5(int pageNum)
	{
		return session.selectList(namespace + ".list5", pageNum);
	}
	
	public void update(PostVO vo)
	{
		session.update(namespace + ".update", vo);
	}
	
	public void delete(int postId)
	{
		session.delete(namespace + ".delete", postId);
	}

}
