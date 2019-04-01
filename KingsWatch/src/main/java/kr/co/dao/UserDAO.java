package kr.co.dao;

import java.util.List;

import kr.co.domain.UserDTO;

public interface UserDAO {

	
	public void join(UserDTO dto);	//회원가입
	public String loginCheck(UserDTO dto);	//로그인 체크
	public List<UserDTO> select();
	public UserDTO selectById(int id);
	public UserDTO updateui(int id);
	public void update(UserDTO dto);
	public void delete(int id);

	
	
}
