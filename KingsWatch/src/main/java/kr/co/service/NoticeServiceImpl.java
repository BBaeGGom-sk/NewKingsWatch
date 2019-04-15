package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.dao.NoticeDAO;
import kr.co.domain.Criteria;
import kr.co.domain.NoticeVO;
import kr.co.domain.SearchCriteria;

@Service
public class NoticeServiceImpl implements NoticeService {
//공지사항 게시판의 서비스
	
	@Inject
	private NoticeDAO dao;
	
	@Override
	public List<NoticeVO> list() {
		return dao.list();
	}

	@Override
	public void insert(NoticeVO vo) {


		dao.insert(vo);
		String[] arr=vo.getFiles();
		
		if(arr==null) {
			return;
		}
		for(int i=0; i<arr.length; i++) {

			dao.addAttach(arr[i], vo.getN_bno());
		
		}

	}

	@Override
	public NoticeVO read(int n_bno) {
		dao.updateViewCnt(n_bno);
		return dao.read(n_bno);
	}

	@Override
	public NoticeVO updateUI(int n_bno) {
		return dao.updateUI(n_bno);
	}

	@Override
	public void update(NoticeVO vo) {
		dao.update(vo);
		dao.deleteAllAttach(vo.getN_bno());
		String[] files = vo.getFiles();
		if(files==null) {
			return;
		}
		
		for(String fullName:files) {

			dao.addAttach(fullName, vo.getN_bno());
		}
	}

	@Override
	public void delete(int n_bno) {
		dao.deleteAllAttach(n_bno);
		dao.delete(n_bno);

	}

	@Override
	public List<NoticeVO> listPage(Criteria cri) {
		return dao.listPage(cri);
	}

	@Override
	public int getAmount() {
		return dao.getAmount();
	}

	@Override
	public List<NoticeVO> search(SearchCriteria cri) {
		return dao.search(cri);
	}

	@Override
	public int getSearchtAmount(SearchCriteria cri) {
		return dao.getSearchAmount(cri);
	}

	@Override
	public List<String> getAttach(Integer n_bno) {
		return dao.getAttach(n_bno);
	}

	@Override
	public void deleteAttach(String fileName, int n_bno) {
		dao.deleteAttach(fileName, n_bno);	

	}

	@Override
	public void deleteAllAttach(int n_bno) {
		   dao.deleteAllAttach(n_bno);
	}

}
