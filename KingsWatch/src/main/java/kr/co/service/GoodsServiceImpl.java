package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.dao.GoodsDAO;
import kr.co.domain.CategoryCriteria;
import kr.co.domain.Criteria;
import kr.co.domain.GoodsVO;

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
	public List<GoodsVO> goodsListMan(CategoryCriteria cri) {
		// 브랜드에 따른 남성상품리스트 페이징처리
		return dao.goodsListMan(cri);
	}
	
	@Override
	public int getAmount() {
		// TODO Auto-generated method stub
		return dao.getAmount();
	}
	
	@Override
	public int getCategoryAmount(CategoryCriteria cri) {
		// TODO Auto-generated method stub
		return dao.getCategoryAmount(cri);
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
		dao.goodsPicDbDel(g_id);
	}

	@Override
	public List<String> goodsPicDbGet(String g_id) {
		// TODO Auto-generated method stub
		return dao.goodsPicDbGet(g_id);
	}

}
