package kr.co.dao;

import kr.co.domain.UserDTO;

public interface OrderDAO {

	// 주문자정보 자동으로 인풋에 올려주기위함
	UserDTO selectById(String u_id);

	// 장바구니 담기
	void addCart(String u_id, String g_id);
	
}
