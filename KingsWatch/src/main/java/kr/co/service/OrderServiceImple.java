package kr.co.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.dao.OrderDAO;
import kr.co.domain.UserDTO;

@Service
@Transactional
public class OrderServiceImple implements OrderService{
	
	@Inject
	private OrderDAO dao;

	@Override
	public UserDTO selectById(String u_id) {
		// 회원정보불러올꺼라고오오
		return dao.selectById(u_id);
	}

}
