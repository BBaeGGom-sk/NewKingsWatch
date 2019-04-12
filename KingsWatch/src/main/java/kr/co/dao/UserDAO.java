package kr.co.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.co.domain.UserDTO;

public interface UserDAO {

	
	public void join(UserDTO dto);	//회원가입
	public UserDTO getUser(UserDTO dto) throws Exception;	//로그인. 유저정보 가져옴
	public List<UserDTO> select();
	public UserDTO viewDetail(String id);
	public UserDTO updateui(String id);
	public UserDTO update(UserDTO dto, HttpSession session);
	public UserDTO updatePw(Map map, HttpSession session);
	public void delete(String id);
	public int idCheck(String u_id);


	
	
}
