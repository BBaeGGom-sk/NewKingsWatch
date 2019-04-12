package kr.co.service;

import java.util.List;

import kr.co.domain.Criteria;
import kr.co.domain.QnaVO;
import kr.co.domain.SearchCriteria;

public interface QnaService {
	List<QnaVO> list();

	void insert(QnaVO vo);

	QnaVO read(int bno);

	QnaVO updateUI(int bno);

	void update(QnaVO vo);

	void delete(int bno);

	List<QnaVO> listPage(Criteria cri);

	int getAmount();

	List<QnaVO> search(SearchCriteria cri);

	int getSearchtAmount(SearchCriteria cri);

	List<String> getAttach(Integer bno);

	void deleteAttach(String fileName, int bno);

	void deleteAllAttach(int bno);
	
	void replyCnt(int q_bno);
}
