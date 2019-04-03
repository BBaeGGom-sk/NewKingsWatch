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



	@Override
	public void logout(HttpSession session) {
		// TODO Auto-generated method stub
		
	}

	
	@Override
	public UserDTO getUser(UserDTO dto) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("<Service> : " + dto);
		return dao.get(dto);
	}

}
