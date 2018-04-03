package com.sj.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sj.vo.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Inject private SqlSession session;
	private static String namespace = "com.sj.mapper.ReplyMapper";
	
	public void create(ReplyVO vo)
	{
		session.insert(namespace + ".create", vo);
	}
	
	public ReplyVO read(int replyId)
	{
		return session.selectOne(namespace + ".read", replyId);
	}

	public List<ReplyVO> readDepth0(int postId)
	{
		return session.selectList(namespace + ".readDepth0", postId);
	}
	
	public List<ReplyVO> readDepth1(int replyId)
	{
		return session.selectList(namespace + ".readDepth1", replyId);
	}
	
	public List<ReplyVO> readAll(int postId)
	{
		return session.selectList(namespace + ".readAll", postId);
	}
	
	public List<ReplyVO> read2Replies(int postId)
	{
		return session.selectList(namespace + ".read2Replies", postId);
	}
	
	public int readReplyReplycount(int replyId)
	{
		return session.selectOne(namespace + ".readReplyReplycount", replyId);
	}
	
	public int replyCount(int postId)
	{
		return session.selectOne(namespace + ".replyCount", postId);
	}
	
	public void update(ReplyVO vo)
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
	
	public void delete(int replyId)
	{
		session.delete(namespace + ".delete", replyId);
	}
}