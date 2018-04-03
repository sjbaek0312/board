package com.sj.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sj.dao.PostDAO;
import com.sj.dao.ReplyDAO;
import com.sj.vo.PostVO;
import com.sj.vo.ReplyVO;

@Service
public class PostServiceImpl implements PostService {

	private static final Logger logger = LoggerFactory.getLogger(PostService.class);
	@Inject private PostDAO postDAO;
	@Inject private ReplyDAO replyDAO;
	
	public void create(String userId, PostVO postVO, MultipartFile file) throws IOException
	{
		UUID uuid = UUID.randomUUID();
		String newFilename = uuid.toString() + "_" + file.getOriginalFilename();
		File targetFile = new File("C:/Users/uploadfiles", newFilename);
		
		InputStream is = null;
		OutputStream os = null;
	
		if (file.getOriginalFilename().equals(""))
		{
			logger.info("there is no any files.");
			postVO.setFilename(null);
		}
		else
		{
			try
			{
				is = file.getInputStream();
				os = new FileOutputStream(targetFile);
				byte[] buffer = new byte[1024 * 8];		
				while(true)			
				{
					int count = is.read(buffer);
					if(count == -1)
						break;
					os.write(buffer, 0, count);
				}
			}	
			finally
			{
				try
				{
					is.close();
				}
				finally
				{
					os.close();
				}
			}
			logger.info("attachment : " + file.getOriginalFilename());
			postVO.setFilename(newFilename);
		}
		postVO.setUserId(userId);
		postVO.setPostRegdate(new Date());
		postVO.setPostUpdatedate(new Date());
		postVO.setPostFlag('Y');
		postDAO.create(postVO);
	}
	
	public PostVO read(int postId)
	{
		return postDAO.read(postId);
	}
	
	public List<PostVO> readAll()
	{
		return postDAO.readAll();
	}
	
	public List<PostVO> read5Posts(int pageNum)
	{
		return postDAO.read5Posts(pageNum);
	}
	
	public List<PostVO> readMy5Posts(String userId, int pageNum)
	{
		return postDAO.readMy5Posts(userId, pageNum);
	}
	
	public int readPostReplycount(int postId)
	{
		return postDAO.readPostReplycount(postId);
	}
	
	public int readPostHeart(int postId)
	{
		return postDAO.readPostHeart(postId);
	}
	
	public void update(PostVO postVO, MultipartFile file, int postId) throws IOException
	{
		logger.info("loginUserId and postUserId are matching... post updated.");
		String deleteFilename = postDAO.read(postId).getFilename();
		
		if (!file.getOriginalFilename().equals(""))
		{
			UUID uuid = UUID.randomUUID();
			String newFilename = uuid.toString() + "_" + file.getOriginalFilename();
			File targetFile = new File("C:/Users/uploadfiles", newFilename);
			
			InputStream is = null;
			OutputStream os = null;
			try
			{
				is = file.getInputStream();
				os = new FileOutputStream(targetFile);
				byte[] buffer = new byte[1024 * 8];		
				while(true)			
				{
					int count = is.read(buffer);
					if(count == -1)
						break;
					os.write(buffer, 0, count);
				}
			}	
			finally
			{
				try
				{
					is.close();
				}
				finally
				{
					os.close();
				}
			}
			logger.info("attachment : " + file.getOriginalFilename());
			postVO.setFilename(newFilename);
			
			if (deleteFilename != null)
			{
				logger.info("exist file deleted : " + deleteFilename);
				new File("C:/Users/uploadfiles", deleteFilename).delete();
			}
		}
		else
		{
			postVO.setFilename(deleteFilename);
		}

		postVO.setPostUpdatedate(new Date());
		postVO.setPostFlag('Y');
		postDAO.update(postVO);
	}
	
	public void updateReplycountInc(int postId)
	{
		postDAO.updateReplycountInc(postId);
	}
	public void updateReplycountDec(int postId)
	{
		postDAO.updateReplycountDec(postId);
	}
	
	public void updateHeartInc(int postId)
	{
		postDAO.updateHeartInc(postId);
	}
	public void updateHeartDec(int postId)
	{
		postDAO.updateHeartDec(postId);
	}
	
	public void delete(String userId, int postId)
	{
		logger.info("loginUserId and postUserId are matching... post deleted.");
		String deleteFilename = postDAO.read(postId).getFilename();
		List<ReplyVO> replyVOList = replyDAO.readAll(postId);
		
		if (deleteFilename != null)
		{
			logger.info("exist file deleted : " + deleteFilename);
			new File("C:/Users/uploadfiles", deleteFilename).delete();
		}
		postDAO.delete(postId);
		
		for (int i = 0; i < replyVOList.size(); i++)
		{
			replyDAO.delete(replyVOList.get(i).getReplyId());
		}
	}
	
	public boolean postValidationCheck(String loginUserId, String postUserId)
	{
		if (loginUserId.equals(postUserId))
		{
			return true;
		}
		return false;
	}
}
