package kr.co.dao;

import java.util.List;

import kr.co.domain.ReviewVO;

public interface ReviewDAO {

	void insert(ReviewVO vo);

	List<ReviewVO> list(String g_id);
	
	void update(ReviewVO vo);
	
	void delete(int r_bno);
	
	int getAmount(String g_id);
	
	List<ReviewVO> list(String g_id, int page);

	void deleteByBno(String g_id);
}
