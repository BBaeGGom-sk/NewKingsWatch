package kr.co.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.co.domain.UserDTO;

public interface UserDAO {

	
	public void join(UserDTO dto);	//회원가입
	public UserDTO getUser(UserDTO dto);	//로그인
	public String getUserPw(String id) throws Exception;	//암호화된 비번 가져옴
	public List<UserDTO> select();
	public UserDTO viewDetail(String id);
	public UserDTO updateui(String id);
	public UserDTO update(UserDTO dto, HttpSession session);
	public UserDTO updatePw(Map map, HttpSession session);
	public void delete(String id);
	public int idCheck(String u_id);
	public int emailCheck(String u_email);



	
	
}
