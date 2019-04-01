package kr.co.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import kr.co.domain.UserDTO;

public interface UserService {

	public void join(UserDTO dto);
	public String loginCheck(UserDTO dto, HttpSession session);
	public void logout(HttpSession session);
	public List<UserDTO> select();
	public UserDTO viewDetail(String id);
	public UserDTO updateui(String id);
	public void update(UserDTO dto);
	public void delete(String id);
	
}
