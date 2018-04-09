package com.sj.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.sj.service.PostService;
import com.sj.vo.PostVO;
import com.sj.vo.UserVO;

@Controller
@RequestMapping(value = "/post")
public class PostController {

	//	@Resource(name = "uploadPath") String uploadPath;
	@Inject private PostService postService;
	
	// create
	@GetMapping(value = "/create")
	public String createGET()
	{
		return "create";
	}
	@PostMapping(value = "/create")
	public String createPOST(HttpSession session, @RequestPart("file") MultipartFile file, PostVO postVO) throws IOException
	{
		UserVO userVO = (UserVO) session.getAttribute("login");
		
		postService.create(userVO.getUserId(), postVO, file);
		return "redirect:readAll";
	}
	
	// read all
	@GetMapping(value = "/readAll")
	public String readAll(Model model)
	{
		model.addAttribute("readAll", postService.read5Posts(0));
		return "readAll";
	}	
	@GetMapping(value = "/read5Posts")
	public ResponseEntity<?> read5Posts(@RequestParam(value = "pageNum", defaultValue = "0") int pageNum)
	{
		return new ResponseEntity<>(postService.read5Posts(pageNum * 5), HttpStatus.OK);
	}
	// read my
	@GetMapping(value = "/readMy")
	public String readMy(HttpSession session, Model model)
	{
		UserVO userVO = (UserVO) session.getAttribute("login");
		
		model.addAttribute("readMy", postService.readMy5Posts(userVO.getUserId(), 0));
		return "readMy";
	}	
	@GetMapping(value = "/readMy5Posts")
	public ResponseEntity<?> readMy5Posts(HttpSession session, @RequestParam(value = "pageNum", defaultValue = "0") int pageNum)
	{
		UserVO userVO = (UserVO) session.getAttribute("login");
		
		return new ResponseEntity<>(postService.readMy5Posts(userVO.getUserId(), pageNum * 5), HttpStatus.OK);
	}
	
	@GetMapping(value = "/postReplycount")
	public ResponseEntity<?> readPostReplycount(@RequestParam("postId") int postId)
	{
		return new ResponseEntity<>(postService.readPostReplycount(postId), HttpStatus.OK);
	}
	@GetMapping(value = "/postHeart")
	public ResponseEntity<?> readPostHeart(@RequestParam("postId") int postId)
	{
		return new ResponseEntity<>(postService.readPostHeart(postId), HttpStatus.OK);
	}
	
	// update
	@GetMapping(value = "/update")
	public String updateGET(HttpSession session, @RequestParam("postId") int postId, Model model)
	{
		UserVO userVO = (UserVO) session.getAttribute("login");
		PostVO postVO = postService.read(postId);
		
		if (userVO != null)
		{
			if (!postService.postValidationCheck(userVO.getUserId(), postVO.getUserId()))
			{
				return "validationfailed";
			}
			model.addAttribute(postVO);
		}
		model.addAttribute("tmppostId", postId);
		return "update";
	}
	@PostMapping(value = "/update")
	public String updatePOST(HttpSession session, @RequestParam("postId") int postId, @RequestPart("file") MultipartFile file, PostVO postVO) throws IOException
	{
		UserVO userVO = (UserVO) session.getAttribute("login");

		if (userVO != null)
		{
			postService.update(postVO, file, postId);
			return "redirect:/post/readAll";
		}
		else
		{
			return "update";
		}
	}
	
	@GetMapping(value = "/postHeartInc")
	public ResponseEntity<?> postHeartInc(@RequestParam("postId") int postId)
	{
		postService.updateHeartInc(postId);
		return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	}
	@GetMapping(value = "/postHeartDec")
	public ResponseEntity<?> postHeartDec(@RequestParam("postId") int postId)
	{
		postService.updateHeartDec(postId);
		return new ResponseEntity<>(HttpStatus.NO_CONTENT);
	}
	
	// delete
	@GetMapping(value = "/delete")
	public String delete(HttpSession session, @RequestParam("postId") int postId)
	{
		UserVO userVO = (UserVO) session.getAttribute("login");
		PostVO postVO = postService.read(postId);
		
		if (userVO != null)
		{
			if (!postService.postValidationCheck(userVO.getUserId(), postVO.getUserId()))
			{
				return "validationfailed";
			}
			postService.delete(userVO.getUserId(), postId);
			return "delete";
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
		File file = new File("C:/Users/uploadfiles/" + postService.read(postId).getFilename());
		InputStream is = null;
		OutputStream os = null;	
		response.setHeader("Content-Disposition", "attachment; filename=\"" + new String(postService.read(postId).getFilename().getBytes("UTF-8"), "ISO-8859-1").substring(37) + "\"");

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