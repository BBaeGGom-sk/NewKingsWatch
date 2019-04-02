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
		// 상품전체리스트불러오기
		return session.selectList(NS+".goodsList");
	}

	@Override
	public void goodsInsert(GoodsVO vo) {
		// 상품등록하기
		session.insert(NS+".goodsInsert", vo);
	}
	
	@Override
	public GoodsVO goodsRead(String g_id) {
		// 아이디에따른 상품읽어오기
		return session.selectOne(NS+".goodsIdSelect", g_id);
	}

	@Override
	public void goodsUpdate(GoodsVO vo) {
		// 상품업데이트하기
		session.update(NS+".goodsUpdate", vo);
	}

	@Override
	public void goodsPicDbDel(String g_id) {
		// 상품사진 DB완전삭제
		session.delete(NS+".goodsPicDbDel", g_id);
	}

	@Override
	public List<String> goodsPicDbGet(String g_id) {
		// 상품사진불러오기
		return session.selectList(NS+".goodsPicDbGet", g_id);
	}

	@Override
	public void goodsPicDbAdd(String p_fullName, String g_id) {
		// 사진DB저장하기
		
		int p_num = getP_num();
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("p_num", p_num);
		map.put("p_fullName", p_fullName);
		map.put("g_id", g_id);
		
		session.insert(NS+".goodsPicDbAdd",map);
	}
	
	private int getP_num() {
		Integer p_num = session.selectOne(NS+".getPnum");
		
		if(p_num == null) {
			p_num = 0;
		}
		
		return ++p_num;
	}


}
