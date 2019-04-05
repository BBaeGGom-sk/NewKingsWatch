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

	public void addCart(String u_id, String g_id) {
		// 장바구니 담기
		Map<String, String> map= new HashMap<String, String>();
		map.put("u_id", u_id);
		map.put("b_id", g_id);
		session.insert(NS+".addCart", map);

	}

}
