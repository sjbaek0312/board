package com.sj.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.sj.domain.PostVO;
import com.sj.domain.UserVO;
import com.sj.service.PostService;
import com.sj.service.ReplyService;

@Controller
@RequestMapping(value = "/post")
public class PostController {
	
	private static final Logger logger = LoggerFactory.getLogger(PostController.class);
//	@Resource(name = "uploadPath") String uploadPath;
	@Inject private PostService service;
	@Inject private ReplyService rService;
	
	// create
	@GetMapping(value = "/create")
	public String createGET()
	{
		return "create";
	}
	@PostMapping(value = "/create")
	public String createPOST(HttpSession session, @RequestPart("file") MultipartFile file, PostVO vo) throws IOException
	{
		UserVO userVO = (UserVO) session.getAttribute("login");
		service.create(userVO.getUserId(), vo, file);
		return "redirect:listAll";
	}
	
	// read all
	@GetMapping(value = "/listAll")
	public String listAll(Model model)
	{
		model.addAttribute("listAllReply", rService.listAll());
		model.addAttribute("listAll", service.listAll());
		return "listAll";
	}
	
	// update
	@GetMapping(value = "/update")
	public String updateGET(HttpSession session, @RequestParam("postId") int postId, Model model)
	{
		UserVO userVO = (UserVO) session.getAttribute("login");
		PostVO vo = service.read(postId);
		if (userVO != null)
		{
			if (!service.postValidationCheck(userVO.getUserId(), vo.getUserId()))
			{
				logger.info("loginUserId(" + userVO.getUserId() + ") and postUserId(" + vo.getUserId() + ") are not matching...");
				return "validationfailed";
			}
			model.addAttribute(vo);
		}
		model.addAttribute("tmppostId", postId);
		return "update";
	}
	@PostMapping(value = "/update")
	public String updatePOST(HttpSession session, @RequestParam("postId") int postId, @RequestPart("file") MultipartFile file, PostVO vo) throws IOException
	{
		UserVO userVO = (UserVO) session.getAttribute("login");

		if (userVO != null)
		{
			service.update(vo, file, postId);
			return "redirect:/post/listAll";
		}
		else
		{
			return "update";
		}
	}
	
	// delete
	@GetMapping(value = "/delete")
	public String delete(HttpSession session, @RequestParam("postId") int postId)
	{
		UserVO userVO = (UserVO) session.getAttribute("login");
		PostVO vo = service.read(postId);
		if (userVO != null)
		{
			if (!service.postValidationCheck(userVO.getUserId(), vo.getUserId()))
			{
				logger.info("loginUserId(" + userVO.getUserId() + ") and postUserId(" + vo.getUserId() + ") are not matching...");
				return "validationfailed";
			}
			service.delete(userVO.getUserId(), postId);
			return "redirect:/post/listAll";
		}
		else
		{
			return "update";
		}
	}

	// download
	@GetMapping(value = "/download")
	public void download(HttpServletResponse response, @RequestParam("postId") int postId) throws IOException
	{
		File file = new File("C:/Users/uploadfiles/" + service.read(postId).getFilename());
		InputStream is = null;
		OutputStream os = null;
		
		response.setHeader("Content-Disposition", "attachment; filename=\"" + new String(service.read(postId).getFilename().getBytes("UTF-8"), "ISO-8859-1").substring(37) + "\"");

		try
		{
			is = new FileInputStream(file);
			os = response.getOutputStream();
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
				os.flush();
				os.close();
			}
		}
	}
}