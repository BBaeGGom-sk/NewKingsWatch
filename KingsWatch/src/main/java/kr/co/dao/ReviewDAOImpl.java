package kr.co.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.domain.Criteria;
import kr.co.domain.ReviewVO;

@Repository
public class ReviewDAOImpl implements ReviewDAO{
	//상품상세정보 하단의 상품평(댓글)을 위한 DAO
	
	@Autowired
	private SqlSession session;	
	private final String NS = "kr.co.mapper.review";
	

	@Override
	public void insert(ReviewVO vo) {
		int r_bno = createRno();

		vo.setR_bno(r_bno);

		session.insert(NS + ".insert", vo);
		
	}

	
	private int createRno() {
		Integer r_bno = session.selectOne(NS + ".createRno");

		if (r_bno == null) {
			r_bno = 1;

		} else {
			++r_bno;
		}
		return r_bno;
	}
	
	@Override
	public List<ReviewVO> list(String g_id) {
		return session.selectList(NS+".list", g_id);
	}

	@Override
	public void update(ReviewVO vo) {
		session.update(NS+".update",vo);
		
	}

	@Override
	public void delete(int r_bno) {
		session.delete(NS+".delete",r_bno);
		
	}

	@Override
	public int getAmount(String g_id) {
		Integer amount=session.selectOne(NS+".getAmount", g_id);
		if(amount==null) {
			return 0;
		}
		return amount;
	}

	@Override
	public List<ReviewVO> list(String g_id, int page) {
		Criteria cri = new Criteria(page, 10);
		RowBounds rb = new RowBounds(cri.getStartNum(), cri.getPerPage());
		return session.selectList(NS+".list", g_id,rb);
	}

	@Override
	public void deleteByBno(String g_id) {
		session.delete(NS+".deleteByBno", g_id);
		
	}

}
