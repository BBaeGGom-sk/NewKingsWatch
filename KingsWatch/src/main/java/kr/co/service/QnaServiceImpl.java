package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.dao.Q_ReplyDAO;
import kr.co.dao.QnaDAO;
import kr.co.domain.Criteria;
import kr.co.domain.QnaVO;
import kr.co.domain.SearchCriteria;

@Service
public class QnaServiceImpl implements QnaService {

	@Inject
	private QnaDAO dao;

	@Inject
	private Q_ReplyDAO rdao;

	@Override
	public List<QnaVO> list() {
		return dao.list();

	}

	@Override
	public void insert(QnaVO vo) {
		dao.insert(vo);

		String[] arr = vo.getFiles();

		if (arr == null) {
			return;
		}

		for (int i = 0; i < arr.length; i++) {

			dao.addAttach(arr[i], vo.getQ_bno());

		}

	}

	@Override
	public QnaVO read(int q_bno) {
		dao.updateViewCnt(q_bno);
		System.out.println(q_bno+"되는거같은데??");
		return dao.read(q_bno);
	}

	@Override
	public QnaVO updateUI(int q_bno) {
		return dao.updateUI(q_bno);
	}

	@Override
	public void update(QnaVO vo) {
		dao.update(vo);
		dao.deleteAllAttach(vo.getQ_bno());
		String[] files = vo.getFiles();
		if (files == null) {
			return;
		}

		for (String fullName : files) {

			dao.addAttach(fullName, vo.getQ_bno());
		}

	}

	@Override
	public void delete(int q_bno) {
		
		rdao.deleteByBno(q_bno);
		dao.deleteAllAttach(q_bno);
		dao.delete(q_bno);
		

	}

	@Override
	public List<QnaVO> listPage(Criteria cri) {
		return dao.listPage(cri);
	}

	@Override
	public int getAmount() {
		return dao.getAmount();
	}

	@Override
	public List<QnaVO> search(SearchCriteria cri) {
		return dao.search(cri);
	}

	@Override
	public int getSearchtAmount(SearchCriteria cri) {
		return dao.getSearchAmount(cri);
	}

	@Override
	public List<String> getAttach(Integer q_bno) {
		return dao.getAttach(q_bno);
	}

	@Override
	public void deleteAttach(String fileName, int q_bno) {
		dao.deleteAttach(fileName, q_bno);
	}

	@Override
	public void deleteAllAttach(int q_bno) {
		dao.deleteAllAttach(q_bno);

	}

	@Override
	public void replyCnt(int q_bno) {
		dao.replyCnt(q_bno);
	}

}
