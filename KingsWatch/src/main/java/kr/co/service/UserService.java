package kr.co.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.co.domain.UserDTO;

public interface UserService {

	public void join(UserDTO dto);
	public UserDTO getUser(UserDTO dto) throws Exception;
	public void logout(HttpSession session);
	public List<UserDTO> select();
	public UserDTO viewDetail(String id);
	public UserDTO updateui(String id);
	public UserDTO update(UserDTO userDTO, HttpSession session);
	public void delete(String id);
	public UserDTO updatePw(Map map, HttpSession session);
	public int idCheck(String u_id);
	public int emailCheck(String u_email);
	
}
