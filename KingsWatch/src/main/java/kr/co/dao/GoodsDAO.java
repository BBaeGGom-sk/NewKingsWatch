package kr.co.dao;

import java.util.List;

import kr.co.domain.CategoryCriteria;
import kr.co.domain.Criteria;
import kr.co.domain.GoodsVO;
import kr.co.domain.SearchCriteria;

public interface GoodsDAO {
	
	public void goodsInsert(GoodsVO vo);
	public GoodsVO goodsRead(String g_id);
	public void goodsUpdate(GoodsVO vo);
	
	// 사진들어가는부분
	public void goodsPicDbDel(String g_id); // 사진DB완전삭제
	public List<String> goodsPicDbGet(String g_id); // 상품사진불러오기
	public void goodsPicDbAdd(String p_fullName, String g_id);
	
	
	// 페이징
	// 전체리스트 페이징
	public List<GoodsVO> goodsList(Criteria cri);
	public int getAmount();
	// 카테고리분류(여성,남성,공용)에 따른 페이징
	public List<GoodsVO> goodsListMan(CategoryCriteria cri);
	public List<GoodsVO> goodsListWoman(CategoryCriteria cri);
	public List<GoodsVO> goodsListPublic(CategoryCriteria cri);
	public int getCategoryAmount(CategoryCriteria cri);
	// 검색에따른 페이징
	public List<GoodsVO> search(SearchCriteria cri);
	public int getSearchAmount(SearchCriteria cri);
	

}
