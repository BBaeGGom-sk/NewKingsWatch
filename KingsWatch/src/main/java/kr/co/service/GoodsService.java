package kr.co.service;

import java.util.List;

import kr.co.domain.GoodsVO;

public interface GoodsService {
	
	// 상품부분
	public List<GoodsVO> goodsList();
	public void goodsInsert(GoodsVO vo);
	
	
	// 사진파일부분
	public void goodsPicDbDel(String fileName, int bno);

}
