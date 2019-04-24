package kr.co.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.co.dao.UserDAO;
import kr.co.domain.UserDTO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO dao;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@Override
	public void join(UserDTO dto) {
		String encryptPassword = passwordEncoder.encode(dto.getU_pw());
		dto.setU_pw(encryptPassword);
		dao.join(dto);
	}

	@Override
	public List<UserDTO> select() {
		// TODO Auto-generated method stub
		return dao.select();
	}

	@Override
	public UserDTO viewDetail(String id) {
		return dao.viewDetail(id);
	}

	@Override
	public UserDTO updateui(String id) {
		return dao.updateui(id);
	}

	@Override
	public UserDTO update(UserDTO userDTO, HttpSession session) {
		return dao.update(userDTO, session);
	}

	@Override
	public void delete(String id) {
 
		dao.delete(id);
	}


	@Override
	public void logout(HttpSession session) {
		// TODO Auto-generated method stub
	}

	@Override
	public UserDTO getUser(UserDTO dto) throws Exception {
		return dao.getUser(dto);
	}
	
	@Override
	public String getUserPw(String id) throws Exception {
		return dao.getUserPw(id);
	}

	@Override
	public UserDTO updatePw(Map map, HttpSession session) {
		// TODO Auto-generated method stub
		return dao.updatePw(map, session);
	}

	@Override
	public int idCheck(String u_id) {
		// TODO Auto-generated method stub
		return dao.idCheck(u_id);
	}

	@Override
	public int emailCheck(String u_email) {
		// TODO Auto-generated method stub
		return dao.emailCheck(u_email);
	}




}
