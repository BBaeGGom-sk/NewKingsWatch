package kr.co.dao;

import java.util.List;

import kr.co.domain.BasketVO;
import kr.co.domain.GoodsVO;
import kr.co.domain.UserDTO;

public interface OrderDAO {

	// 주문자정보 자동으로 인풋에 올려주기위함
	UserDTO selectById(String u_id);


	// 장바구니 담기
	void addCart(String u_id, String g_id,int o_quantity);

	List<String> selectCartList(String u_id);

	GoodsVO getGoods(String g_id);

	List<GoodsVO> selectGoodsList(String g_id);


	int getQuantity(String g_id);


	void changeQuantity(String u_id, String g_id, int b_quantity);


	void deleteCart(String u_id, String g_id);


	void cartAllDelete(String u_id); 
	
}
