package com.sj.dao;

import java.util.List;

import com.sj.vo.PostVO;

public interface PostDAO {

	public void create(PostVO vo);
	public PostVO read(int postId);
	public List<PostVO> readAll();
	public List<PostVO> read5Posts(int pageNum);
	public List<PostVO> readMy5Posts(String userId, int pageNum);
	public int readPostReplycount(int postId);
	public int readPostHeart(int postId);	
	public void update(PostVO vo);
	public void updateReplycountInc(int postId);
	public void updateReplycountDec(int postId);
	public void updateHeartInc(int postId);
	public void updateHeartDec(int postId);
	public void delete(int postId);
}
