package kr.co.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.Criteria;
import kr.co.domain.NoticeVO;
import kr.co.domain.SearchCriteria;

@Repository
public class NoticeDAOImpl implements NoticeDAO {
//공지사항 게시판 DAO
	
	@Inject
	private SqlSession session;
	private final String NS = "kr.co.mapper.notice";

	@Override
	public List<NoticeVO> list() {
		return session.selectList(NS + ".list");
	}

	@Override
	public void insert(NoticeVO vo) {
		Integer n_bno = createBno();
		if (n_bno == null) {
			n_bno = 1;
		} else {
			n_bno++;
		}
		vo.setN_bno(n_bno);
		//n_bno 번호 자동 증가를 위한 구문 
		session.insert(NS + ".insert", vo);
		
		
	}
	
	private Integer createBno() {
		return session.selectOne(NS + ".createBno");
	}

	@Override
	public NoticeVO read(int n_bno) {
		return session.selectOne(NS + ".selectByBno", n_bno);
	}

	@Override
	public NoticeVO updateUI(int n_bno) {
		return session.selectOne(NS + ".updateUI", n_bno);
	}

	@Override
	public void update(NoticeVO vo) {
		session.update(NS + ".update", vo);
	}

	@Override
	public void delete(int n_bno) {
		session.delete(NS + ".delete", n_bno);
	}

	@Override
	public List<NoticeVO> listPage(Criteria cri) {
		RowBounds rb = new RowBounds(cri.getStartNum() - 1, cri.getPerPage());

		return session.selectList(NS + ".list", 0, rb);
	}

	@Override
	public int getAmount() {
		return session.selectOne(NS + ".getAmount");
	}

	@Override
	public List<NoticeVO> search(SearchCriteria cri) {
		RowBounds rb = new RowBounds(cri.getStartNum() - 1, cri.getPerPage());

		return session.selectList(NS + ".search", cri, rb);
	}

	@Override
	public int getSearchAmount(SearchCriteria cri) {
		return session.selectOne(NS + ".getSearchAmount", cri);
	}

	@Override
	public void updateViewCnt(int n_bno) {
		session.update(NS + ".updateViewCnt", n_bno);
		
	}

	@Override
	public void addAttach(String p_fullName, int n_bno) {
		int p_num = getId();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("p_fullName", p_fullName);
		map.put("n_bno", n_bno);
		map.put("p_num", p_num);

		session.insert(NS + ".addAttach", map);
		
	}
	
	private int getId() {
		Integer p_num = session.selectOne(NS + ".getId");

		if (p_num == null) {
			p_num = 0;
		}
		return ++p_num;
	}

	@Override
	public List<String> getAttach(Integer n_bno) {
		return session.selectList(NS + ".getAttach", n_bno);
	}

	@Override
	public void deleteAttach(String fileName, int n_bno) {
		Map map = new HashMap<String, Object>();
		map.put("fileName", fileName);
		map.put("n_bno", n_bno);
		session.delete(NS + ".deleteAttach",map);
		
	}

	@Override
	public void deleteAllAttach(int n_bno) {
		session.delete(NS+".deleteAllAttach", n_bno);
		
	}

	
}
