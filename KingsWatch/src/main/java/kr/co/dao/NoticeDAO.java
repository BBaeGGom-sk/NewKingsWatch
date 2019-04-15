package kr.co.dao;

import java.util.List;

import kr.co.domain.Criteria;
import kr.co.domain.NoticeVO;
import kr.co.domain.SearchCriteria;

public interface NoticeDAO {

	List<NoticeVO> list();
	void insert(NoticeVO vo);
	NoticeVO read(int bno);
	NoticeVO updateUI(int bno);
	void update(NoticeVO vo);
	void delete(int bno);
	List<NoticeVO> listPage(Criteria cri);
	int getAmount();
	List<NoticeVO> search(SearchCriteria cri);
	int getSearchAmount(SearchCriteria cri);
	void updateViewCnt(int bno);
	void addAttach(String fullName, int bno);
	List<String> getAttach(Integer bno);
	void deleteAttach(String fileName, int bno);
	void deleteAllAttach(int bno);
}
