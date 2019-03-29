package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.dao.GoodsDAO;
import kr.co.domain.GoodsVO;

@Service
@Transactional
public class GoodsServiceImpl implements GoodsService {

	@Inject
	private GoodsDAO dao;
	
	@Override
	public List<GoodsVO> goodsList() {
		// TODO Auto-generated method stub
		return dao.goodsList();
	}

}
