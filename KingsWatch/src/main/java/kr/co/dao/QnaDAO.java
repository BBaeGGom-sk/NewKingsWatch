package kr.co.dao;

import java.util.List;

import kr.co.domain.QnaVO;
import kr.co.domain.Criteria;
import kr.co.domain.SearchCriteria;

public interface QnaDAO {

	List<QnaVO> list();

	void insert(QnaVO vo);

	QnaVO read(int q_bno);

	QnaVO updateUI(int q_bno);

	void update(QnaVO vo);

	void delete(int q_bno);

	List<QnaVO> listPage(Criteria cri);

	int getAmount();

	List<QnaVO> search(SearchCriteria cri);

	int getSearchAmount(SearchCriteria cri);

	void addAttach(String fullName, int q_bno);

	List<String> getAttach(Integer q_bno);

	void deleteAttach(String fileName, int q_bno);

	void deleteAllAttach(int bno);

	void replyCnt(int q_bno);

	void updateViewCnt(int q_bno);

}
