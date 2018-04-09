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

import com.sj.dto.LoginDTO;
import com.sj.service.UserService;
import com.sj.vo.UserVO;

@Controller
@RequestMapping(value = "/user")
public class UserController {

	@Inject UserService userService;
	
	// login, logout
	@GetMapping(value = "/login")
	public String loginGET(@ModelAttribute("dto") LoginDTO loginDTO)
	{
		return "login";
	}
	@PostMapping(value = "/login")
	public String loginPOST(LoginDTO loginDTO, Model model)
	{
		UserVO userVO = userService.login(loginDTO);
		System.out.println("1 : "+userVO.getUserId());
		System.out.println("2 : "+loginDTO.getUserId());
		if (userVO != null)
		{
			if (userVO.getUserFlag() == 'Y')
			{
				model.addAttribute("userVO", userVO);
			}
		}
		return "login";
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
	public String joinPOST(UserVO userVO)
	{
		userService.create(userVO);
		return "redirect:/user/login";
	}

	// update
	@GetMapping(value = "/modify")
	public String modifyGET()
	{
		return "modify";
	}
	@PostMapping(value = "/modify")
	public String modifyPOST(HttpSession session, UserVO userVOByForm)
	{
		UserVO userVO = (UserVO) session.getAttribute("login");
		
		userVOByForm.setUserId(userVO.getUserId());
		userService.update(userVOByForm);
		return "redirect:/post/readAll";
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
		userService.delete(userId);
		return "redirect:/";
	}
	@GetMapping(value = "/withdraw30")
	public String withdraw30GET(HttpSession session, UserVO userVOByForm)
	{
		UserVO userVO = (UserVO) session.getAttribute("login");
		
		userVOByForm.setUserId(userVO.getUserId());
		userVOByForm.setUserPw(userVO.getUserPw());
		userVOByForm.setUserName(userVO.getUserName());
		userVOByForm.setEmail(userVO.getEmail());
		userVOByForm.setUserFlag('N');
		userService.update(userVOByForm);
		return "redirect:/";
	}
}
