package kr.co.service;

import java.util.List;

import kr.co.domain.BasketVO;
import kr.co.domain.GoodsVO;
import kr.co.domain.UserDTO;

public interface OrderService {

	// 회원정보 자동 입력부분
	public UserDTO selectById(String u_id);
	// u_id 통해서 유저가 저장한 장바구니에 b_id들을 불러오기
	public List<String> selectCartList(String u_id);
	// b_id 통해서 해당 상품 상세정보 가져오기
	public GoodsVO getGoods(String g_id);
	// g_id 통해서 해당 상품 상세정보 가져오기 
	public List<GoodsVO> selectGoodsList(String g_id);
	
}
