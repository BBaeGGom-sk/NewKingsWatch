package kr.co.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dao.UserDAO;
import kr.co.domain.UserDTO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO dao;

	@Override
	public void insert(UserDTO dto) {
		dao.insert(dto);

	}

	@Override
	public List<UserDTO> select() {
		// TODO Auto-generated method stub
		return dao.select();
	}

	@Override
	public UserDTO selectById(int id) {
		return dao.selectById(id);
	}

	@Override
	public UserDTO updateui(int id) {
		return dao.updateui(id);
	}

	@Override
	public void update(UserDTO dto) {

		dao.update(dto);

	}

	@Override
	public void delete(int id) {
 
		dao.delete(id);
	}

}
