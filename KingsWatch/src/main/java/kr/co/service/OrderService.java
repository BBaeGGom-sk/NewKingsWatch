package kr.co.service;

import java.util.List;

import kr.co.domain.GoodsVO;
import kr.co.domain.UserDTO;

public interface OrderService {

	// 회원정보 자동 입력부분
	public UserDTO selectById(String u_id);


	// 장바구니 담기
	public void addCart(String u_id, String g_id, int o_quantity);

	// u_id 통해서 유저가 저장한 장바구니에 b_id들을 불러오기
	public List<String> selectCartList(String u_id);
	// b_id 통해서 해당 상품 상세정보 가져오기
	public GoodsVO getGoods(String g_id);
	// g_id 통해서 해당 상품 상세정보 가져오기 
	public List<GoodsVO> selectGoodsList(String g_id);
	// g_id 통해서 장바구니 해당 상품 수량 가져오기
	public int getQuantity(String g_id);
	// u_id 와 g_id 통해서 장바구니 상품 수량 변경하기
	public void changeQuantity(String u_id, String g_id, int b_quantity);
	// u_id 와 g_id 통해서 체크된 상품 장바구니에서 삭제
	public void deleteCart(String u_id, String g_id);
	// u_id로 장바구니 모든 상품 삭제
	public void cartAllDelete(String u_id);
	
}
