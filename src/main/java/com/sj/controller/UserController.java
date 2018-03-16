package com.sj.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sj.domain.UserVO;
import com.sj.dto.LoginDTO;
import com.sj.service.UserService;

@Controller
@RequestMapping(value = "/user")
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	@Inject UserService service;
	
	// login logout
	@GetMapping(value = "/login")
	public String loginGET(@ModelAttribute("dto") LoginDTO dto)
	{
		return "login";
	}
	@PostMapping(value = "/loginpost")
	public String loginPOST(LoginDTO dto, HttpSession session, Model model)
	{
		UserVO vo = service.login(dto);
		model.addAttribute("userVO", vo);
		logger.info("attribute userVO added");
		return "loginpost";
	}
	@GetMapping(value = "/logout")
	public String logout(HttpSession session)
	{
		UserVO userVO = (UserVO) session.getAttribute("login");
		if (userVO != null)
		{
			session.removeAttribute("login");
			session.invalidate();
		}
		logger.info(userVO.getUserId() + " logout...");
		return "logout";
	}
	
	// create
	@GetMapping(value = "/join")
	public String joinGET()
	{
		return "join";
	}
	@PostMapping(value = "/join")
	public String joinPOST(UserVO vo)
	{
		service.create(vo);
		return "redirect:/";
	}

	// update
	@GetMapping(value = "/modify")
	public String modifyGET()
	{
		return "modify";
	}
	@PostMapping(value = "/modify")
	public String modifyPOST(HttpSession session, UserVO vo)
	{
		UserVO userVO = (UserVO) session.getAttribute("login");
		if (userVO != null)
		{
			service.update(vo);
			return "redirect:/post/listAll";
		}
		else
		{
			return "modify";
		}
	}
	
	// delete
	@GetMapping(value = "/withdrawconfirm")
	public String withdraw()
	{
		return "withdrawconfirm";
	}
	@GetMapping(value = "/withdraw")
	public String withdrawGET(@RequestParam("userId") String userId)
	{
		service.delete(userId);
		return "redirect:/";
	}
}
