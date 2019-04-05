package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.dao.OrderDAO;
import kr.co.domain.BasketVO;
import kr.co.domain.GoodsVO;
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

	@Override
	public List<String> selectCartList(String u_id) {
		// b_id 불러오기
		return dao.selectCartList(u_id);
	}

	@Override
	public GoodsVO getGoods(String g_id) {
		// b_id로 상품정보 불러오기
		return dao.getGoods(g_id);
	}


	 @Override 
	 public List<GoodsVO> selectGoodsList(String g_id) { 
		// g_id로 상품정보 불러오기 
		 return dao.selectGoodsList(g_id); 
	}


}
