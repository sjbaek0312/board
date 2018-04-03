package com.sj.dao;

import java.util.List;

import com.sj.dto.LoginDTO;
import com.sj.vo.UserVO;

public interface UserDAO {

	public void create(UserVO vo);
	public UserVO read(String userId);
	public List<UserVO> readAll();
	public void update(UserVO vo);
	public void delete(String userId);
	public UserVO login(LoginDTO dto);
}
