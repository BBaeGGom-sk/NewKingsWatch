package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.dao.GoodsDAO;
import kr.co.domain.BrandCriteria;
import kr.co.domain.CategoryCriteria;
import kr.co.domain.Criteria;
import kr.co.domain.GoodsVO;
import kr.co.domain.SearchCriteria;

@Service
@Transactional
public class GoodsServiceImpl implements GoodsService {

	@Inject
	private GoodsDAO dao;
	
	@Override
	public List<GoodsVO> goodsList(Criteria cri) {
		// 상품리스트 페이징처리
		return dao.goodsList(cri);
	}
	
	@Override
	public int getAmount(Criteria cri) {
		// 전체상품갯수구하기
		return dao.getAmount(cri);
	}
	
	@Override
	public List<GoodsVO> goodsNoSellingList(Criteria cri) {
		// 판매종료상품리스트 페이징처리
		return dao.goodsNoSellingList(cri);
	}
	
	@Override
	public int getNoSellingAmount() {
		// 판매종료상품갯수구하기
		return dao.getNoSellingAmount();
	}
	
	@Override
	public List<GoodsVO> goodsListBrand(BrandCriteria cri) {
		// 브랜드별 상품 전체리스트 페이징
		return dao.goodsListBrand(cri);
	}
	
	@Override
	public int getBrandAmount(BrandCriteria cri) {
		// 브랜드별 상품 갯수구하기
		return dao.getBrandAmount(cri);
	}
	
	@Override
	public List<GoodsVO> goodsListBrandNoSelling(BrandCriteria cri) {
		// 브랜드별 판매종료 상품 전체리스트 페이징
		return dao.goodsListBrandNoSelling(cri);
	}
	
	@Override
	public int getBrandNoSellingAmount(BrandCriteria cri) {
		// TODO Auto-generated method stub
		return dao.getBrandoNoSellingAmount(cri);
	}
	
	@Override
	public List<GoodsVO> goodsListMan(CategoryCriteria cri) {
		// 브랜드에 따른 남성상품리스트 페이징처리
		return dao.goodsListMan(cri);
	}
	
	@Override
	public List<GoodsVO> goodsListWoman(CategoryCriteria cri) {
		// 브랜드에 따른 여성상품리스트 페이징처리
		return dao.goodsListWoman(cri);
	}
	
	@Override
	public List<GoodsVO> goodsListPublic(CategoryCriteria cri) {
		// 브랜드에 따른 공용상품리스트 페이징처리
		return dao.goodsListPublic(cri);
	}
	
	@Override
	public int getCategoryAmount(CategoryCriteria cri) {
		// 브랜드+카테고리별 상품 갯수구하기
		return dao.getCategoryAmount(cri);
	}
	
	@Override
	public List<GoodsVO> search(SearchCriteria cri) {
		// 판매중인 상품 검색에 따른 페이징
		return dao.search(cri);
	}
	
	@Override
	public int getSearchAmount(SearchCriteria cri) {
		// 검색목록 상품 갯수구하기
		return dao.getSearchAmount(cri);
	}
	
	@Override
	public List<GoodsVO> searchNoSelling(SearchCriteria cri) {
		// 판매중이지 않은 상품 검색에따른 페이징
		return dao.searchNoSelling(cri);
	}

	@Override
	public int getSearchNoSellAmount(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return dao.searchNoSellAmount(cri);
	}
	
	@Override
	public List<GoodsVO> rowPriceGoodsList(Criteria cri) {
		// 낮은가격 전체상품리스트구하기
		return dao.rowPriceGoodsList(cri);
	}
	
	@Override
	public List<GoodsVO> highPriceGoodsList(Criteria cri) {
		// 높은가격 전체상품리스트구하기
		return dao.highPriceGoodsList(cri);
	}
	
	@Override
	public List<GoodsVO> rowPriceGoodsListBrand(BrandCriteria cri) {
		// 브랜드별 낮은가격리스트
		return dao.rowPriceGoodsListBrand(cri);
	}
	
	@Override
	public List<GoodsVO> highPriceGoodsListBrand(BrandCriteria cri) {
		// 브랜드별 높은가격리스트
		return dao.highPriceGoodsListBrand(cri);
	}
	
	@Override
	public List<GoodsVO> rowPriceGoodsMan(CategoryCriteria cri) {
		// 남성상품 낮은가격리스트
		return dao.rowPriceGoodsMan(cri);
	}

	@Override
	public List<GoodsVO> highPriceGoodsMan(CategoryCriteria cri) {
		// 남성상품 높은가격리스트
		return dao.highPriceGoodsMan(cri);
	}

	@Override
	public List<GoodsVO> rowPriceGoodsWoman(CategoryCriteria cri) {
		// 여성상품 낮은가격리스트
		return dao.rowPriceGoodsWoman(cri);
	}

	@Override
	public List<GoodsVO> highPriceGoodsWoman(CategoryCriteria cri) {
		// 여성상품 높은가격리스트
		return dao.highPriceGoodsWoman(cri);
	}

	@Override
	public List<GoodsVO> rowPriceGoodsPublic(CategoryCriteria cri) {
		// 공용상품 낮은가격리스트
		return dao.rowPriceGoodsPublic(cri);
	}

	@Override
	public List<GoodsVO> highPriceGoodsPublic(CategoryCriteria cri) {
		// 공용상품 높은가격리스트
		return dao.highPriceGoodsPublic(cri);
	}
	
	@Override
	public List<GoodsVO> highPriceGoodsSearch(SearchCriteria cri) {
		// 검색시 높은가격리스트
		return dao.highPriceGoodsSearch(cri);
	}

	@Override
	public int getCategoryHighPriceAmount(SearchCriteria cri) {
		// 검색시 높은가격 상품의 아이디 갯수 갖고오기
		return dao.getCategoryHighPriceAmount(cri);
	}

	@Override
	public List<GoodsVO> rowPriceGoodsSearch(SearchCriteria cri) {
		// 검색시 낮은가격리스트
		return dao.rowPriceGoodsSearch(cri);
	}

	@Override
	public int getCategoryRowPriceAmount(SearchCriteria cri) {
		// 검색시 낮은가격 상품의 아이디 갯수 갖고오기
		return dao.getCategoryRowPriceAmount(cri);
	}

	@Override
	public List<GoodsVO> highPriceSearchNoSelling(SearchCriteria cri) {
		// 판매중이지 않은 상품 검색시 높은가격 리스트
		return dao.highPriceSearchNoSelling(cri);
	}

	@Override
	public int getCategoryHighPriceNoSellingAmount(SearchCriteria cri) {
		// 판매중이지 않은 상품 검색시 높은가격 상품의 아이디 갯수 갖고오기
		return dao.getCategoryHighPriceNoSellingAmount(cri);
	}

	@Override
	public List<GoodsVO> rowPriceSearchNoSelling(SearchCriteria cri) {
		// 판매중이지 않은 상품 검색시 낮은가격리스트
		return dao.rowPriceSearchNoSelling(cri);
	}

	@Override
	public int getCategoryRowPriceNoSellingAmount(SearchCriteria cri) {
		// 판매중이지 않은 상품 검색시 낮은가격 상품의 아이디 갯수 갖고오기
		return dao.getCategoryRowPriceNoSellingAmount(cri);
	}
	
	@Override
	public void goodsInsert(GoodsVO vo) {
		dao.goodsInsert(vo);
		
		String[] arr = vo.getFiles();
		
		if (arr == null) {
			return;
		} // 첨부파일이 없으면 리턴을 시켜서 아래 코드를 실행시키지않음
		
		for(int i = 0; i<vo.getFiles().length; i++) {			
			dao.goodsPicDbAdd(arr[i], vo.getG_id());
		} 

		// 첨부파일이 있을때 , 첨부파일 안 올리면 null이지만 이 경우는 위에서 걸러줌
	}

	@Override
	public GoodsVO goodsRead(String g_id) {
		return dao.goodsRead(g_id);
	}
	
	@Override
	public void goodsUpdate(GoodsVO vo) {
		dao.goodsUpdate(vo);
		dao.goodsPicDbDel(vo.getG_id());
		
		String[] arr = vo.getFiles();
		
		if (arr == null) {
			return;
		} // 첨부파일이 없으면 리턴을 시켜서 아래 코드를 실행시키지않음
		
		for(int i = 0; i<vo.getFiles().length; i++) {			
			dao.goodsPicDbAdd(arr[i], vo.getG_id());
		} 
	}

	@Override
	public void goodsPicDbDel(String g_id) {
		// DB에서 g_id에 따른 사진 삭제하기
		dao.goodsPicDbDel(g_id);
	}

	@Override
	public List<String> goodsPicDbGet(String g_id) {
		// DB에서 g_id에 따른 사진 읽어오기
		return dao.goodsPicDbGet(g_id);
	}


}
