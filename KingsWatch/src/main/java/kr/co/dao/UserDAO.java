package kr.co.dao;

import java.util.List;

import kr.co.domain.UserDTO;

public interface UserDAO {

	
	public void insert(UserDTO dto);
	public List<UserDTO> select();
	public UserDTO selectById(int id);
	public UserDTO updateui(int id);
	public void update(UserDTO dto);
	public void delete(int id);

	
	
}
