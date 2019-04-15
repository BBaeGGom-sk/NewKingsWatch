package kr.co.service;

import java.util.List;

import kr.co.domain.ReviewVO;

public interface ReviewService {

	void insert(ReviewVO vo);
	 List<ReviewVO> list(String g_id); 
	 void update(ReviewVO vo);
	 void delete(int r_bno);
	 int getAmount(String g_id);
	 List<ReviewVO> list(String g_id,int page);
}
