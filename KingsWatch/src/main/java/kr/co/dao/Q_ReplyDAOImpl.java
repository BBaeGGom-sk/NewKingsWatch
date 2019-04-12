package kr.co.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.domain.Criteria;
import kr.co.domain.Q_ReplyVO;

@Repository
public class Q_ReplyDAOImpl implements Q_ReplyDAO {
//QNA게시판의 '댓글' 기능 DAO
	@Autowired
	private SqlSession session;
	private final String NS = "kr.co.mapper.q_reply";

	@Override
	public void insert(Q_ReplyVO vo) {
		int q_rno = createRno();

		vo.setQ_rno(q_rno);

		session.insert(NS + ".insert", vo);

	}

	private int createRno() {
		Integer q_rno = session.selectOne(NS + ".createRno");

		if (q_rno == null) {
			q_rno = 1;

		} else {
			++q_rno;
		}
		return q_rno;
	}

	@Override
	public List<Q_ReplyVO> list(int q_bno) {
        
		return session.selectList(NS+".list", q_bno);
	}

	@Override
	public void update(Q_ReplyVO vo) {

		session.update(NS+".update",vo);
	}

	@Override
	public void delete(int q_rno) {
          
		session.delete(NS+".delete",q_rno);
	}

	@Override
	public int getAmount(Integer q_bno) {
		Integer amount=session.selectOne(NS+".getAmount", q_bno);
		if(amount==null) {
			return 0;
		}
		return amount;
	}

	@Override
	public List<Q_ReplyVO> list(int q_bno, int page) {
		Criteria cri = new Criteria(page, 10);
		RowBounds rb = new RowBounds(cri.getStartNum(), cri.getPerPage());
		return session.selectList(NS+".list", q_bno,rb);
	}

	@Override
	public void deleteByBno(int q_bno) {
		session.delete(NS+".deleteByBno", q_bno);
		
	}

}
