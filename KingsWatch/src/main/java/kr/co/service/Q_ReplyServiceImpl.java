package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.dao.Q_ReplyDAO;
import kr.co.dao.QnaDAO;
import kr.co.domain.Q_ReplyVO;

@Service
public class Q_ReplyServiceImpl implements Q_ReplyService {

	@Inject
	private Q_ReplyDAO dao;

	@Inject
	private QnaDAO qdao;
	
	//dao는 qna의 댓글DAO이고
	//qdao는 QnaDAO (qna게시판)의 dao 기능쓰려고 씀

	@Override
	public void insert(Q_ReplyVO vo) {

		dao.insert(vo);
		//dao로 댓글을 (인서트) 달 경우에
		qdao.replyCnt(vo.getQ_bno());
		//qdao의 replyCnt 메서드를 통해 qna게시글의 댓글달린 수를 증가시킴
		//댓글달린수를 증감시키는 이유는 qna게시판 리스트에서 뿌려줄때 제목 옆에 댓글수 또한 표현하기 위함임
		//그러므로 인서트시에는 댓글수가 +1
		//delete는 q_reply 컨트롤러쪽에 구현해놨음 이유는 delete쪽에 서술

	}

	@Override
	public List<Q_ReplyVO> list(int q_bno) {
		return dao.list(q_bno);
	}

	@Override
	public void update(Q_ReplyVO vo) {

		dao.update(vo);
	}

	@Override
	public void delete(int q_rno) {

		dao.delete(q_rno);
	}

	@Override
	public int getAmount(Integer q_bno) {
		return dao.getAmount(q_bno);

	}

	@Override
	public List<Q_ReplyVO> list(int q_bno, int page) {
		return dao.list(q_bno, page);
	}

}
