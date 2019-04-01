package kr.co.service;

import java.util.List;

import kr.co.domain.GoodsVO;

public interface GoodsService {
	
	// 상품부분
	public List<GoodsVO> goodsList();
	public void goodsInsert(GoodsVO vo);
	public GoodsVO goodsRead(String g_id);
	
	
	// 사진파일부분
	public void goodsPicDbDel(String fileName, int bno); // 사진DB완전삭제
	public List<String> goodsPicDbGet(String g_id); // 상품사진불러오기

}
