package kr.co.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.BasketVO;
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
	public GoodsVO getGoods(String b_id) {
		// TODO Auto-generated method stub
		return session.selectOne(NS+".getGoods", b_id);
	}

}
