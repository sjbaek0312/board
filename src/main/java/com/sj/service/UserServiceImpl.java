package com.sj.service;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.sj.dao.UserDAO;
import com.sj.dto.LoginDTO;
import com.sj.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {
	
	@Inject private UserDAO userDAO;
	
	public void create(UserVO userVO)
	{
		userVO.setUserRegdate(new Date());
		userVO.setUserFlag('Y');
		userDAO.create(userVO);
	}
	
	public UserVO read(String userId)
	{
		return userDAO.read(userId);
	}
	
	public List<UserVO> readAll()
	{
		return userDAO.readAll();
	}
	
	public void update(UserVO userVO)
	{
		userVO.setUserFlag('Y');
		userDAO.update(userVO);
	}
	
	public void delete(String userId)
	{
		userDAO.delete(userId);
	}
	
	public UserVO login(LoginDTO loginDTO)
	{
		return userDAO.login(loginDTO);
	}

}
