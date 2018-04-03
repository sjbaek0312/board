package com.sj.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.sj.vo.PostVO;

public interface PostService {

	public void create(String userId, PostVO postVO, MultipartFile file) throws IOException;
	public PostVO read(int postId);
	public List<PostVO> readAll();
	public List<PostVO> read5Posts(int pageNum);
	public List<PostVO> readMy5Posts(String userId, int pageNum);
	public int readPostReplycount(int postId);
	public int readPostHeart(int postId);
	public void update(PostVO postVO, MultipartFile file, int postId) throws IOException;
	public void updateReplycountInc(int postId);
	public void updateReplycountDec(int postId);
	public void updateHeartInc(int postId);
	public void updateHeartDec(int postId);
	public void delete(String userId, int postId);
	public boolean postValidationCheck(String loginUserId, String postUserId);
}
