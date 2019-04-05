package kr.co.service;

import kr.co.domain.UserDTO;

public interface OrderService {

	// 회원정보 자동 입력부분
	public UserDTO selectById(String u_id);

	// 장바구니 담기
	public void addCart(String u_id, String g_id);
}
