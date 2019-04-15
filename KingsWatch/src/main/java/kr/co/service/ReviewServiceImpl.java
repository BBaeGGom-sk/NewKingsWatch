package kr.co.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dao.ReviewDAO;
import kr.co.domain.ReviewVO;
import kr.co.domain.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewDAO dao;
	
	@Override
	public void insert(ReviewVO vo) {
		dao.insert(vo);
	}


	@Override
	public List<ReviewVO> list(String g_id) {
		return dao.list(g_id);
	}


	@Override
	public void update(ReviewVO vo) {
		
		dao.update(vo);
	}


	@Override
	public void delete(int r_bno) {

		dao.delete(r_bno);
	}


	@Override
	public int getAmount(String g_id) {
		return dao.getAmount(g_id);
		
	}


	@Override
	public List<ReviewVO> list(String g_id, int page) {		
		return dao.list(g_id, page);
	}


}
