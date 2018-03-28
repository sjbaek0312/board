package com.sj.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.sj.dao.ReplyDAO;
import com.sj.vo.ReplyVO;

@Service
public class ReplyService {

	@Inject private ReplyDAO dao;
	private static final Logger logger = LoggerFactory.getLogger(ReplyService.class);
	
	public void create(ReplyVO vo)
	{
		dao.create(vo);
	}
	
	public List<ReplyVO> list(int postId)
	{
		return dao.list(postId);
	}
	
	public List<ReplyVO> listDepth1(int replyId)
	{
		return dao.listDepth1(replyId);
	}
	
	public List<ReplyVO> listAll()
	{
		return dao.listAll();
	}
	
	public void update(ReplyVO vo)
	{
		dao.update(vo);
	}
	
	public void delete(int replyId)
	{
		dao.delete(replyId);
	}
}
