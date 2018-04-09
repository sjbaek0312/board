package com.sj.service;

import java.util.List;

import com.sj.vo.ReplyVO;

public interface ReplyService {
	
	public void create(ReplyVO replyVO, int postId);
	public ReplyVO read(int replyId);
	public List<ReplyVO> readDepth0(int postId);
	public List<ReplyVO> readDepth1(int replyId);
	public List<ReplyVO> readAll(int postId);
	public int readReplyReplycount(int replyId);
	public void update(ReplyVO replyVO);
	public void updateReplycountInc(int replyId);
	public void updateReplycountDec(int replyId);
	public void delete(int replyId, int parentReplyId, int postId);
	public boolean validateReply(String loginUserId, String postUserId);
}
