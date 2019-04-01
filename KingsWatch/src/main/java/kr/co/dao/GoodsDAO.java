package kr.co.dao;

import java.util.List;

import kr.co.domain.GoodsVO;

public interface GoodsDAO {
	
	public List<GoodsVO> goodsList();
	public void goodsInsert(GoodsVO vo);
	public GoodsVO goodsRead(String g_id);
	
	// 사진들어가는부분
	public void goodsPicDbDel(String fileName, int bno); // 사진DB완전삭제
	public List<String> goodsPicDbGet(String g_id); // 상품사진불러오기
	public void goodsPicDbAdd(String p_fullName, String g_id);

}
