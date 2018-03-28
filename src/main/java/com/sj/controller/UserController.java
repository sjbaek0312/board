package com.sj.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sj.service.UserService;
import com.sj.vo.LoginDTO;
import com.sj.vo.UserVO;

@Controller
@RequestMapping(value = "/user")
public class UserController {

	@Inject UserService service;
	
	// login, logout
	@GetMapping(value = "/login")
	public String loginGET(@ModelAttribute("dto") LoginDTO dto)
	{
		return "login";
	}
	@PostMapping(value = "/loginpost")
	public String loginPOST(LoginDTO dto, Model model)
	{
		UserVO vo = service.login(dto);

		if (vo != null)
		{
			if (vo.getUserFlag() == 'Y')
			{
				model.addAttribute("userVO", vo);
			}
		}
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
		return "logout";
	}
	
	// error
	@GetMapping(value = "/sessioninvalidated")
	public String sessionInvalidated()
	{
		return "sessioninvalidated";
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
		return "redirect:/user/login";
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
		
		vo.setUserId(userVO.getUserId());
		service.update(vo);
		return "redirect:/post/listAll";
	}
	
	// delete
	@GetMapping(value = "/withdrawconfirm")
	public String withdraw()
	{
		return "withdrawconfirm";
	}
	@GetMapping(value = "/withdrawconfirm30")
	public String withdraw30()
	{
		return "withdrawconfirm30";
	}
	@GetMapping(value = "/withdraw")
	public String withdrawGET(@RequestParam("userId") String userId)
	{
		service.delete(userId);
		return "redirect:/";
	}
	@GetMapping(value = "/withdraw30")
	public String withdraw30GET(HttpSession session, UserVO vo)
	{
		UserVO userVO = (UserVO) session.getAttribute("login");
		
		vo.setUserId(userVO.getUserId());
		vo.setUserPw(userVO.getUserPw());
		vo.setUserName(userVO.getUserName());
		vo.setEmail(userVO.getEmail());
		vo.setUserFlag('N');
		service.update(vo);
		return "redirect:/";
	}
}
