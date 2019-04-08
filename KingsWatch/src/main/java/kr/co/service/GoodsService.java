package kr.co.service;

import java.util.List;

import kr.co.domain.BrandCriteria;
import kr.co.domain.CategoryCriteria;
import kr.co.domain.Criteria;
import kr.co.domain.GoodsVO;
import kr.co.domain.SearchCriteria;

public interface GoodsService {
	
	// 상품부분
	public void goodsInsert(GoodsVO vo);
	public GoodsVO goodsRead(String g_id);
	public void goodsUpdate(GoodsVO vo);
	
	
	// 사진파일부분
	public void goodsPicDbDel(String g_id); // 사진DB완전삭제
	public List<String> goodsPicDbGet(String g_id); // 상품사진불러오기
	
	// 페이징
	// 전체리스트 페이징
	public List<GoodsVO> goodsList(Criteria cri);
	public int getAmount(Criteria cri);
	// 판매종료상품 페이징
	public List<GoodsVO> goodsNoSellingList(Criteria cri);
	public int getNoSellingAmount();
	// 브랜드별 전체상품 페이징
	public List<GoodsVO> goodsListBrand(BrandCriteria cri);
	public int getBrandAmount(BrandCriteria cri);
	// 판매종료된 브랜드별 전체상품 페이징
	public List<GoodsVO> goodsListBrandNoSelling(BrandCriteria cri);
	public int getBrandNoSellingAmount(BrandCriteria cri);
	// 카테고리분류(여성,남성,공용)에 따른 페이징
	public List<GoodsVO> goodsListMan(CategoryCriteria cri);
	public List<GoodsVO> goodsListWoman(CategoryCriteria cri);
	public List<GoodsVO> goodsListPublic(CategoryCriteria cri);
	public int getCategoryAmount(CategoryCriteria cri);
	// 검색에따른 페이징
	public List<GoodsVO> search(SearchCriteria cri);
	public int getSearchAmount(SearchCriteria cri);
	public List<GoodsVO> searchNoSelling(SearchCriteria cri);
	public int getSearchNoSellAmount(SearchCriteria cri);
	// 전체상품 낮은가격순 페이징
	public List<GoodsVO> rowPriceGoodsList(Criteria cri);
	// 전체상품 높은가격순 페이징
	public List<GoodsVO> highPriceGoodsList(Criteria cri);
	// 브랜드별 낮은가격/높은가격순 페이징
	public List<GoodsVO> rowPriceGoodsListBrand(BrandCriteria cri);
	public List<GoodsVO> highPriceGoodsListBrand(BrandCriteria cri);
	// 카테고리분류(여성,남성,공용) 낮은가격/높은가격순 페이징
	public List<GoodsVO> rowPriceGoodsMan(CategoryCriteria cri);
	public List<GoodsVO> highPriceGoodsMan(CategoryCriteria cri);
	public List<GoodsVO> rowPriceGoodsWoman(CategoryCriteria cri);
	public List<GoodsVO> highPriceGoodsWoman(CategoryCriteria cri);
	public List<GoodsVO> rowPriceGoodsPublic(CategoryCriteria cri);
	public List<GoodsVO> highPriceGoodsPublic(CategoryCriteria cri);

}
