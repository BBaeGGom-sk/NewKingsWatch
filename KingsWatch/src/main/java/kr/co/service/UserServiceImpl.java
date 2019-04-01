package kr.co.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dao.UserDAO;
import kr.co.domain.UserDTO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO dao;

	@Override
	public void join(UserDTO dto) {
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
	public void update(UserDTO dto) {

		dao.update(dto);

	}

	@Override
	public void delete(String id) {
 
		dao.delete(id);
	}

	//로그인 체크
	@Override
	public String loginCheck(UserDTO dto, HttpSession session) {
		String name=dao.loginCheck(dto);	//name을 반환하도록 했었다.
		
		if(name !=null) {	//맞으면.   
			session.setAttribute("userId", dto.getU_id());
			session.setAttribute("userName", dto.getU_name());
		}
		return name;
	}

	@Override
	public void logout(HttpSession session) {
		// TODO Auto-generated method stub
		
	}

}
