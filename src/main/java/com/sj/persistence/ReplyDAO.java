package com.sj.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sj.domain.ReplyVO;

@Repository
public class ReplyDAO {

	@Inject private SqlSession session;
	private static String namespace = "com.sj.mapper.ReplyMapper";
	
	public void create(ReplyVO vo)
	{
		session.insert(namespace + ".create", vo);
	}

	public List<ReplyVO> list(int postId)
	{
		return session.selectList(namespace + ".list", postId);
	}
	
	public List<ReplyVO> listAll()
	{
		return session.selectList(namespace + ".listAll");
	}
	/*
	public void update(ReplyVO vo)
	{
		session.update(namespace + ".update", vo);
	}
	*/
	public void delete(int replyId)
	{
		session.delete(namespace + ".delete", replyId);
	}
}
