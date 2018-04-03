package com.sj.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sj.vo.PostVO;

@Repository
public class PostDAOImpl implements PostDAO {

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
	
	public List<PostVO> readAll()
	{
		return session.selectList(namespace + ".readAll");
	}
	
	public List<PostVO> read5Posts(int pageNum)
	{
		return session.selectList(namespace + ".read5Posts", pageNum);
	}
	
	public List<PostVO> readMy5Posts(String userId, int pageNum)
	{
		Map<String, Object> values = new HashMap<String, Object>();
		values.put("userId", userId);
		values.put("pageNum", pageNum);
		return session.selectList(namespace + ".readMy5Posts", values);
	}
	
	public int readPostReplycount(int postId)
	{
		return session.selectOne(namespace + ".readPostReplycount", postId);
	}
	public int readPostHeart(int postId)
	{
		return session.selectOne(namespace + ".readPostHeart", postId);
	}
	
	public void update(PostVO vo)
	{
		session.update(namespace + ".update", vo);
	}
	
	public void updateReplycountInc(int postId)
	{
		session.update(namespace + ".updateReplycountInc", postId);
	}
	public void updateReplycountDec(int postId)
	{
		session.update(namespace + ".updateReplycountDec", postId);
	}
	
	public void updateHeartInc(int postId)
	{
		session.update(namespace + ".updateHeartInc", postId);
	}
	public void updateHeartDec(int postId)
	{
		session.update(namespace + ".updateHeartDec", postId);
	}
	
	public void delete(int postId)
	{
		session.delete(namespace + ".delete", postId);
	}

}