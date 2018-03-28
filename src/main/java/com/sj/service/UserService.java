package com.sj.service;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.sj.dao.UserDAO;
import com.sj.vo.LoginDTO;
import com.sj.vo.UserVO;

@Service
public class UserService {
	
	@Inject private UserDAO dao;
	
	public void create(UserVO vo)
	{
		vo.setUserRegdate(new Date());
		vo.setUserFlag('Y');
		dao.create(vo);
	}
	
	public UserVO read(String userId)
	{
		return dao.read(userId);
	}
	
	public List<UserVO> listAll()
	{
		return dao.listAll();
	}
	
	public void update(UserVO vo)
	{
		dao.update(vo);
	}
	
	public void delete(String userId)
	{
		dao.delete(userId);
	}
	
	public UserVO login(LoginDTO dto)
	{
		return dao.login(dto);
	}

}
