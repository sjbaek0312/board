package com.sj.service;

import java.util.List;

import com.sj.dto.LoginDTO;
import com.sj.vo.UserVO;

public interface UserService {

	public void create(UserVO userVO);
	public UserVO read(String userId);
	public List<UserVO> readAll();
	public void update(UserVO userVO);
	public void delete(String userId);
	public UserVO login(LoginDTO loginDTO);
}
