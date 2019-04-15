package kr.co.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.QnaVO;
import kr.co.domain.Criteria;
import kr.co.domain.SearchCriteria;

@Repository
public class QnaDAOImpl implements QnaDAO {
//Qna 게시판의 DAO
	@Inject
	private SqlSession session;
	private final String NS = "kr.co.mapper.qna";

	@Override
	public List<QnaVO> list() {
		return session.selectList(NS + ".list");
	}

	@Override
	public void insert(QnaVO vo) {
		Integer q_bno = createBno();
		if (q_bno == null) {
			q_bno = 1;
		} else {
			q_bno++;
		}
		vo.setQ_bno(q_bno);
		session.insert(NS + ".insert", vo);
	}

	private Integer createBno() {
		return session.selectOne(NS + ".createBno");
	}

	@Override
	public QnaVO read(int q_bno) {
		return session.selectOne(NS + ".selectByBno", q_bno);
	}

	@Override
	public QnaVO updateUI(int q_bno) {
		return session.selectOne(NS + ".updateUI", q_bno);
	}

	@Override
	public void update(QnaVO vo) {

		session.update(NS + ".update", vo);
	}

	@Override
	public void delete(int q_bno) {

		session.delete(NS + ".delete", q_bno);
	}

	@Override
	public List<QnaVO> listPage(Criteria cri) {

		RowBounds rb = new RowBounds(cri.getStartNum() - 1, cri.getPerPage());

		return session.selectList(NS + ".list", 0, rb);
	}

	@Override
	public int getAmount() {

		return session.selectOne(NS + ".getAmount");
	}

	@Override
	public List<QnaVO> search(SearchCriteria cri) {

		RowBounds rb = new RowBounds(cri.getStartNum() - 1, cri.getPerPage());

		return session.selectList(NS + ".search", cri, rb);

	}

	@Override
	public int getSearchAmount(SearchCriteria cri) {
		return session.selectOne(NS + ".getSearchAmount", cri);
	}

	@Override
	public void updateViewCnt(int q_bno) {
		session.update(NS + ".updateViewCnt", q_bno);

	}

	@Override
	public void addAttach(String p_fullName, int q_bno) {
		int p_num = getId();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("p_fullName", p_fullName);
		map.put("q_bno", q_bno);
		map.put("p_num", p_num);

		session.insert(NS + ".addAttach", map);

	}

	private int getId() {
		Integer id = session.selectOne(NS + ".getId");

		if (id == null) {
			id = 0;
		}
		return ++id;
	}

	@Override
	public List<String> getAttach(Integer q_bno) {
		return session.selectList(NS + ".getAttach", q_bno);
	}

	@Override
	public void deleteAttach(String fileName, int q_bno) {
		Map map = new HashMap<String, Object>();
		map.put("fileName", fileName);
		map.put("q_bno", q_bno);
		session.delete(NS + ".deleteAttach",map);
	}

	@Override
	public void deleteAllAttach(int q_bno) {

		session.delete(NS+".deleteAllAttach", q_bno);
	}

	@Override
	public void replyCnt(int q_bno) {
		//게시글 내 댓글 개수 정보를 넣어주기 위한 DAO
		session.update(NS+".replyCnt", q_bno);
		
	}



}
