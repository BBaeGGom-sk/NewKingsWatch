package kr.co.service;

import java.util.List;

import kr.co.domain.NoticeVO;
import kr.co.domain.Criteria;
import kr.co.domain.SearchCriteria;

public interface NoticeService {

	List<NoticeVO> list();

	void insert(NoticeVO vo);

	NoticeVO read(int n_bno);

	NoticeVO updateUI(int n_bno);

	void update(NoticeVO vo);

	void delete(int n_bno);

	List<NoticeVO> listPage(Criteria cri);

	int getAmount();

	List<NoticeVO> search(SearchCriteria cri);


	int getSearchtAmount(SearchCriteria cri);

	List<String> getAttach(Integer n_bno);

	void deleteAttach(String fileName, int n_bno);

	void deleteAllAttach(int n_bno);
}
