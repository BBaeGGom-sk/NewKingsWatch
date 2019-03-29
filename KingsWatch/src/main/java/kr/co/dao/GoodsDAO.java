package kr.co.dao;

import java.util.List;

import kr.co.domain.GoodsVO;

public interface GoodsDAO {
	
	public List<GoodsVO> goodsList();
	public void goodsInsert(GoodsVO vo);
	
	// 사진들어가는부분
	public void goodsPicDbDel(String fileName, int bno);

}
