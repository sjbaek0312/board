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

import com.sj.domain.PostVO;
import com.sj.persistence.PostDAO;

@Service
public class PostService {

	private static final Logger logger = LoggerFactory.getLogger(PostService.class);
	@Inject private PostDAO dao;
	
	public void create(String userId, PostVO vo, MultipartFile file) throws IOException
	{
		UUID uuid = UUID.randomUUID();
		String newFilename = uuid.toString() + "_" + file.getOriginalFilename();
		File targetFile = new File("C:/Users/uploadfiles", newFilename);
		
		InputStream is = null;
		OutputStream os = null;
	
		if (file.getOriginalFilename().equals(""))
		{
			logger.info("there is no any files.");
			vo.setFilename(null);
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

				vo.setUserId(userId);
				vo.setPostRegdate(new Date());
				vo.setPostUpdatedate(new Date());
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
			vo.setFilename(newFilename);
		}
		dao.create(vo);
	}
	
	public PostVO read(int postId)
	{
		return dao.read(postId);
	}
	
	public List<PostVO> listAll()
	{
		return dao.listAll();
	}
	
	public void update(PostVO vo, MultipartFile file, int postId) throws IOException
	{
		logger.info("loginUserId and postUserId are matching... post updated.");

		String deleteFilename = dao.read(postId).getFilename();
		
		vo.setPostUpdatedate(new Date());

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
			vo.setFilename(newFilename);
			
			if (deleteFilename != null)
			{
				logger.info("exist file deleted : " + deleteFilename);
				new File("C:/Users/uploadfiles", deleteFilename).delete();
			}
		}
		else
		{
			vo.setFilename(deleteFilename);
		}

		dao.update(vo);
	}
	
	public void delete(String userId, int postId)
	{
		logger.info("loginUserId and postUserId are matching... post deleted.");
		String deleteFilename = dao.read(postId).getFilename();
		if (deleteFilename != null)
		{
			logger.info("exist file deleted : " + deleteFilename);
			new File("C:/Users/uploadfiles", deleteFilename).delete();
		}
		else logger.info("there is no file in this post.");
		dao.delete(postId);
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
