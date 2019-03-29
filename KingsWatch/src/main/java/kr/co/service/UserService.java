package kr.co.service;

import java.util.List;

import kr.co.domain.UserDTO;

public interface UserService {

	public void insert(UserDTO dto);
	public List<UserDTO> select();
	public UserDTO selectById(int id);
	public UserDTO updateui(int id);
	public void update(UserDTO dto);
	public void delete(int id);
	
}
