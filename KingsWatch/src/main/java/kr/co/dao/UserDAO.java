package kr.co.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import kr.co.domain.UserDTO;

public interface UserDAO {

	
	public void join(UserDTO dto);	//회원가입
	public UserDTO get(UserDTO dto) throws Exception;	//로그인 체크
	public List<UserDTO> select();
	public UserDTO viewDetail(String id);
	public UserDTO updateui(String id);
	public UserDTO update(UserDTO dto, HttpSession session);
	public void delete(String id);

	
	
}
