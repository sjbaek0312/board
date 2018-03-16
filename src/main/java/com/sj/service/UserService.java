package com.sj.service;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.sj.domain.UserVO;
import com.sj.dto.LoginDTO;
import com.sj.persistence.UserDAO;

@Service
public class UserService {

//	private static final Logger logger = LoggerFactory.getLogger(UserService.class);
	@Inject private UserDAO dao;
	
	public void create(UserVO vo)
	{
		vo.setUserRegdate(new Date());
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
