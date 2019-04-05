package kr.co.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.BrandCriteria;
import kr.co.domain.CategoryCriteria;
import kr.co.domain.Criteria;
import kr.co.domain.GoodsVO;
import kr.co.domain.SearchCriteria;

@Repository
public class GoodsDAOImpl implements GoodsDAO {

	@Inject
	private SqlSession session;
	
	private final String NS="kr.co.mapper.goods";
	
	@Override
	public List<GoodsVO> goodsList(Criteria cri) {
		// 상품전체리스트불러오기
		RowBounds rb= new RowBounds(cri.getStartNum()-1, cri.getPerPage());
		return session.selectList(NS+".goodsList", 0, rb);
	}
	
	@Override
	public int getAmount(Criteria cri) {
		// 전체페이지수구하기
		return session.selectOne(NS+".getAmount",cri);
	}
	
	@Override
	public List<GoodsVO> goodsNoSellingList(Criteria cri) {
		// 판매종료상품리스트 불러오기
		RowBounds rb= new RowBounds(cri.getStartNum()-1, cri.getPerPage());
		return session.selectList(NS+".goodsNoSellingList", 0, rb);
	}
	
	@Override
	public int getNoSellingAmount() {
		// 판매종료상품 페이지수구하기
		return session.selectOne(NS+".getNoSellingAmount");
	}
	
	@Override
	public List<GoodsVO> goodsListBrand(BrandCriteria cri) {
		// 브랜드별 판매중 상품리스트 불러오기
		RowBounds rb= new RowBounds(cri.getStartNum()-1, cri.getPerPage());
		return session.selectList(NS+".brandSelling", cri, rb);
	}
	
	@Override
	public int getBrandAmount(BrandCriteria cri) {
		// 브랜드별 판매중 상품 전체갯수구하기
		return session.selectOne(NS+".getBrandSellingAmount", cri);
	}
	
	@Override
	public List<GoodsVO> goodsListBrandNoSelling(BrandCriteria cri) {
		// 브랜드별 판매종료 상품 리스트 불러오기
		RowBounds rb= new RowBounds(cri.getStartNum()-1, cri.getPerPage());
		System.out.println(cri);
		return session.selectList(NS+".brandNoSelling", cri, rb);
	}
	
	@Override
	public int getBrandoNoSellingAmount(BrandCriteria cri) {
		// 브랜드별 판매종료 상품 전체 갯수 구하기
		System.out.println(cri+"갯수");
		return session.selectOne(NS+".getBrandoNoSellingAmount",cri);
	}
	
	@Override
	public List<GoodsVO> goodsListMan(CategoryCriteria cri) {
		// 브랜드에 따른 남성상품리스트 불러오기
		RowBounds rb= new RowBounds(cri.getStartNum()-1, cri.getPerPage());
		return session.selectList(NS+".category", cri, rb);
	}
	
	@Override
	public List<GoodsVO> goodsListWoman(CategoryCriteria cri) {
		// 브랜드에 따른 여성상품리스트 불러오기
		RowBounds rb= new RowBounds(cri.getStartNum()-1, cri.getPerPage());
		return session.selectList(NS+".category", cri, rb);
	}
	
	@Override
	public List<GoodsVO> goodsListPublic(CategoryCriteria cri) {
		// 브랜드에 따른 공용상품리스트 불러오기
		RowBounds rb= new RowBounds(cri.getStartNum()-1, cri.getPerPage());
		return session.selectList(NS+".category", cri, rb);
	}
	
	@Override
	public int getCategoryAmount(CategoryCriteria cri) {
		// 카테고리+브랜드별 상품 전체갯수 구하기
		return session.selectOne(NS+".getCategoryAmount", cri);
	}
	
	@Override
	public List<GoodsVO> search(SearchCriteria cri) {
		// 검색에 따른 페이징
		RowBounds rb= new RowBounds(cri.getStartNum()-1, cri.getPerPage());
		return session.selectList(NS+".search", cri, rb);
	}
	
	@Override
	public int getSearchAmount(SearchCriteria cri) {
		// 검색에 따른 상품갯수 구하기
		return session.selectOne(NS+".getSearchAmount", cri);
	}

	@Override
	public List<GoodsVO> rowPriceGoodsList(Criteria cri) {
		// 낮은가격순 전체상품리스트 
		RowBounds rb= new RowBounds(cri.getStartNum()-1, cri.getPerPage());
		return session.selectList(NS+".rowPriceGoodsList", 0, rb);
	}
	
	@Override
	public List<GoodsVO> highPriceGoodsList(Criteria cri) {
		// 높은가격순 전체상품리스트
		RowBounds rb= new RowBounds(cri.getStartNum()-1, cri.getPerPage());
		return session.selectList(NS+".highPriceGoodsList", 0, rb);
	}
	
	@Override
	public List<GoodsVO> rowPriceGoodsListBrand(BrandCriteria cri) {
		// 브랜드별 낮은가격순 리스트
		RowBounds rb= new RowBounds(cri.getStartNum()-1, cri.getPerPage());
		return session.selectList(NS+".rowPriceGoodsListBrand", cri, rb);
	}
	
	@Override
	public List<GoodsVO> highPriceGoodsListBrand(BrandCriteria cri) {
		// 브랜드별 높은가격순 리스트
		RowBounds rb= new RowBounds(cri.getStartNum()-1, cri.getPerPage());
		return session.selectList(NS+".highPriceGoodsListBrand", cri, rb);
	}

	@Override
	public List<GoodsVO> rowPriceGoodsMan(CategoryCriteria cri) {
		// 남성상품낮은가격순 리스트
		RowBounds rb= new RowBounds(cri.getStartNum()-1, cri.getPerPage());
		return session.selectList(NS+".rowPriceGoodsCategory", cri, rb);
	}

	@Override
	public List<GoodsVO> highPriceGoodsMan(CategoryCriteria cri) {
		// 남성상품높은가격순 리스트
		RowBounds rb= new RowBounds(cri.getStartNum()-1, cri.getPerPage());
		return session.selectList(NS+".highPriceGoodsCategory", cri, rb);
	}

	@Override
	public List<GoodsVO> rowPriceGoodsWoman(CategoryCriteria cri) {
		// 여성상품낮은가격순 리스트
		RowBounds rb= new RowBounds(cri.getStartNum()-1, cri.getPerPage());
		return session.selectList(NS+".rowPriceGoodsCategory", cri, rb);
	}

	@Override
	public List<GoodsVO> highPriceGoodsWoman(CategoryCriteria cri) {
		// 여성상품높은가격순 리스트
		RowBounds rb= new RowBounds(cri.getStartNum()-1, cri.getPerPage());
		return session.selectList(NS+".highPriceGoodsCategory", cri, rb);
	}

	@Override
	public List<GoodsVO> rowPriceGoodsPublic(CategoryCriteria cri) {
		// 공용상품낮은가격순 리스트
		RowBounds rb= new RowBounds(cri.getStartNum()-1, cri.getPerPage());
		return session.selectList(NS+".rowPriceGoodsCategory", cri, rb);
	}

	@Override
	public List<GoodsVO> highPriceGoodsPublic(CategoryCriteria cri) {
		// 공용상품높은가격순 리스트
		RowBounds rb= new RowBounds(cri.getStartNum()-1, cri.getPerPage());
		return session.selectList(NS+".highPriceGoodsCategory", cri, rb);
	}

	@Override
	public void goodsInsert(GoodsVO vo) {
		// 상품등록하기
		session.insert(NS+".goodsInsert", vo);
	}
	
	@Override
	public GoodsVO goodsRead(String g_id) {
		// 아이디에따른 상품읽어오기
		return session.selectOne(NS+".goodsIdSelect", g_id);
	}

	@Override
	public void goodsUpdate(GoodsVO vo) {
		// 상품업데이트하기
		session.update(NS+".goodsUpdate", vo);
	}

	@Override
	public void goodsPicDbDel(String g_id) {
		// 상품사진 DB완전삭제
		session.delete(NS+".goodsPicDbDel", g_id);
	}

	@Override
	public List<String> goodsPicDbGet(String g_id) {
		// 상품사진불러오기
		return session.selectList(NS+".goodsPicDbGet", g_id);
	}

	@Override
	public void goodsPicDbAdd(String p_fullName, String g_id) {
		// 사진DB저장하기
		
		int p_num = getP_num();
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("p_num", p_num);
		map.put("p_fullName", p_fullName);
		map.put("g_id", g_id);
		
		session.insert(NS+".goodsPicDbAdd",map);
	}
	
	private int getP_num() {
		Integer p_num = session.selectOne(NS+".getPnum");
		
		if(p_num == null) {
			p_num = 0;
		}
		
		return ++p_num;
	}



}
