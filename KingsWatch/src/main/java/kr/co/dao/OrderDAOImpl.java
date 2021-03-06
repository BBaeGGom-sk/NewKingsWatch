package kr.co.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.GoodsVO;
import kr.co.domain.UserDTO;

@Repository
public class OrderDAOImpl implements OrderDAO {
	
	@Inject
	private SqlSession session;
	
	private final String NS="kr.co.mapper.order";

	@Override
	public UserDTO selectById(String u_id) {
		// id로 회원정보 가져오기 (로그인세션통해서할듯)
		return session.selectOne(NS+".selectById", u_id);
	}

	@Override

	public void addCart(String u_id, String g_id,int o_quantity) {
		// 장바구니 담기
		Map<String, Object> map= new HashMap<String, Object>();
		map.put("u_id", u_id);
		map.put("b_id", g_id);
		map.put("o_quantity", o_quantity);
		session.insert(NS+".addCart", map);
	}

	public List<String> selectCartList(String u_id) {
		// TODO Auto-generated method stub
		return session.selectList(NS+".selectCartList", u_id);
	}

	@Override
	public GoodsVO getGoods(String g_id) {
		// TODO Auto-generated method stub
		return session.selectOne(NS+".getGoods", g_id);
	}


	@Override public List<GoodsVO> selectGoodsList(String g_id) { 
		// TODO Auto-generated method stub 
		return session.selectList(NS+".selectGoodsList",g_id); 

	}

	@Override
	public int getQuantity(String g_id) {
		// TODO Auto-generated method stub
		return session.selectOne(NS+".getQuantity", g_id);
	}

	@Override
	public void changeQuantity(String u_id, String g_id, int b_quantity) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("g_id", g_id);
		map.put("u_id", u_id);
		map.put("b_quantity", b_quantity);
		session.update(NS+".changeQuantity", map);
	}

	@Override
	public void deleteCart(String u_id, String g_id) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("u_id", u_id);
		map.put("g_id", g_id);
		session.delete(NS+".deleteCart", map);
	}

	@Override
	public void cartAllDelete(String u_id) {
		// TODO Auto-generated method stub
		session.delete(NS+".cartAllDelete", u_id);
		
	}

}
