package com.sj.dao;

import java.util.List;

import com.sj.vo.ReplyVO;

public interface ReplyDAO {

	public void create(ReplyVO vo);
	public ReplyVO read(int replyId);
	public List<ReplyVO> readDepth0(int postId);
	public List<ReplyVO> readDepth1(int replyId);
	public List<ReplyVO> readAll(int postId);
	public List<ReplyVO> read2Replies(int postId);
	public int readReplyReplycount(int replyId);
	public int replyCount(int postId);
	public void update(ReplyVO vo);
	public void updateReplycountInc(int replyId);
	public void updateReplycountDec(int replyId);
	public void delete(int replyId);
}
