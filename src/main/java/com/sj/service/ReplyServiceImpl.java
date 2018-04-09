package com.sj.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.sj.dao.PostDAO;
import com.sj.dao.ReplyDAO;
import com.sj.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject private ReplyDAO replyDAO;
	@Inject private PostDAO postDAO;
	
	public void create(ReplyVO replyVO, int postId)
	{
		int parentReplyId = replyVO.getParentReplyId();
		
		replyDAO.create(replyVO);
		postDAO.updateReplycountInc(postId);
		if (parentReplyId != 0)
		{
			replyDAO.updateReplycountInc(parentReplyId);
		}
	}
	
	public ReplyVO read(int replyId)
	{
		return replyDAO.read(replyId);
	}
	
	public List<ReplyVO> readDepth0(int postId)
	{
		return replyDAO.readDepth0(postId);
	}
	
	public List<ReplyVO> readDepth1(int replyId)
	{
		return replyDAO.readDepth1(replyId);
	}
	
	public List<ReplyVO> readAll(int postId)
	{
		return replyDAO.readAll(postId);
	}
	
	public int readReplyReplycount(int replyId)
	{
		return replyDAO.readReplyReplycount(replyId);
	}
	
	public void update(ReplyVO replyVO)
	{
		replyDAO.update(replyVO);
	}
	
	public void updateReplycountInc(int replyId)
	{
		replyDAO.updateReplycountInc(replyId);
	}
	public void updateReplycountDec(int replyId)
	{
		replyDAO.updateReplycountDec(replyId);
	}
	
	public void delete(int replyId, int parentReplyId, int postId)
	{
		replyDAO.delete(replyId);
		postDAO.updateReplycountDec(postId);
		if (parentReplyId != 0)
		{
			replyDAO.updateReplycountDec(parentReplyId);
		}
	}
	
	public boolean validateReply(String loginUserId, String postUserId)
	{
		if (loginUserId.equals(postUserId))
		{
			return true;
		}
		return false;
	}
}
