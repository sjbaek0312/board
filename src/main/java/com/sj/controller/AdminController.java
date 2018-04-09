package com.sj.controller;

import java.io.IOException;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.sj.service.PostService;
import com.sj.service.UserService;
import com.sj.vo.PostVO;
import com.sj.vo.UserVO;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {

	@Inject UserService userService;
	@Inject PostService postService;
	
	@GetMapping(value = "/main")
	public String main(Model model)
	{
		model.addAttribute("adminId", "admin");
		model.addAttribute("adminPw", "admin");
		return "main";
	}
	
	// posts
	@GetMapping(value = "/posts")
	public String posts(Model model)
	{
		model.addAttribute("posts", postService.readAll());
		return "posts";
	}
	
	@GetMapping(value = "/updateAdmin")
	public String updateGET(@RequestParam("postId") int postId, Model model)
	{
		model.addAttribute("postVO", postService.read(postId));
		return "updateAdmin";
	}
	
	@PostMapping(value = "/updateAdmin")
	public String updatePOST(@RequestParam("postId") int postId, @RequestPart("file") MultipartFile file, PostVO postVO) throws IOException
	{
		postService.update(postVO, file, postId);
		return "redirect:/admin/posts";
	}
	
	@GetMapping(value = "/delete")
	public String delete(@RequestParam("postId") int postId, @RequestParam("userId") String userId)
	{
		postService.delete(userId, postId);
		return "redirect:/admin/posts";
	}
	
	
	
	// users
	@GetMapping(value = "/users")
	public String users(Model model)
	{
		model.addAttribute("users", userService.readAll());
		return "users";
	}
	
	@GetMapping(value = "/joinAdmin")
	public String joinGET()
	{
		return "joinAdmin";
	}
	@PostMapping(value = "/joinAdmin")
	public String joinPOST(UserVO userVO)
	{
		userService.create(userVO);
		return "redirect:/admin/users";
	}
	
	@GetMapping(value = "/modifyAdmin")
	public String modifyGET(@RequestParam("userId") String userId, Model model)
	{
		model.addAttribute("userVO", userService.read(userId));
		return "modifyAdmin";
	}
	@PostMapping(value = "/modifyAdmin")
	public String modifyPOST(UserVO userVO)
	{
		userService.update(userVO);
		return "redirect:/admin/users";
	}
	
	@GetMapping(value = "/withdraw")
	public String withdraw(@RequestParam("userId") String userId)
	{
		userService.delete(userId);
		return "redirect:/admin/users";
	}
}
