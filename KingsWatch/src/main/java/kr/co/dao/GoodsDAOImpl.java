package kr.co.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.GoodsVO;

@Repository
public class GoodsDAOImpl implements GoodsDAO {

	@Inject
	private SqlSession session;
	
	private final String NS="kr.co.mapper.goods";
	
	@Override
	public List<GoodsVO> goodsList() {
		// TODO Auto-generated method stub
		return session.selectList(NS+".goodsList");
	}

	@Override
	public void goodsInsert(GoodsVO vo) {
		session.insert(NS+".goodsInsert", vo);
	}

	@Override
	public void goodsPicDbDel(String fileName, int bno) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fullName",fileName);
		map.put("bno",bno);
		
		session.delete(NS+".goodsPicDbDel", map);
		
	}

}
