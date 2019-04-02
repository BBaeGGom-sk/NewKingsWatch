package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.dao.GoodsDAO;
import kr.co.domain.GoodsVO;

@Service
@Transactional
public class GoodsServiceImpl implements GoodsService {

	@Inject
	private GoodsDAO dao;
	
	@Override
	public List<GoodsVO> goodsList() {
		// TODO Auto-generated method stub
		return dao.goodsList();
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
	}

	@Override
	public void goodsPicDbDel(String fileName, int bno) {
		dao.goodsPicDbDel(fileName, bno);
	}

	@Override
	public List<String> goodsPicDbGet(String g_id) {
		// TODO Auto-generated method stub
		return dao.goodsPicDbGet(g_id);
	}


}
