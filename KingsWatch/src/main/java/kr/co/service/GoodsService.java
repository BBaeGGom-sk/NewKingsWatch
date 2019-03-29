package kr.co.service;

import java.util.List;

import kr.co.domain.GoodsVO;

public interface GoodsService {
	
	public List<GoodsVO> goodsList();
	public void goodsInsert(GoodsVO vo);

}
