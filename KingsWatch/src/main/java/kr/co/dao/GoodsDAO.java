package kr.co.dao;

import java.util.List;

import kr.co.domain.CategoryCriteria;
import kr.co.domain.Criteria;
import kr.co.domain.GoodsVO;

public interface GoodsDAO {
	
	public void goodsInsert(GoodsVO vo);
	public GoodsVO goodsRead(String g_id);
	public void goodsUpdate(GoodsVO vo);
	
	// 사진들어가는부분
	public void goodsPicDbDel(String g_id); // 사진DB완전삭제
	public List<String> goodsPicDbGet(String g_id); // 상품사진불러오기
	public void goodsPicDbAdd(String p_fullName, String g_id);
	
	// 페이징	
	public List<GoodsVO> goodsList(Criteria cri);
	public int getAmount();
	public List<GoodsVO> goodsListMan(CategoryCriteria cri);
	public int getCategoryAmount(CategoryCriteria cri);
	

}
