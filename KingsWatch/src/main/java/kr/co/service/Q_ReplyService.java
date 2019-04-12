package kr.co.service;

import java.util.List;

import kr.co.domain.Q_ReplyVO;

public interface Q_ReplyService {
	
	void insert(Q_ReplyVO vo);
	 List<Q_ReplyVO> list(int q_bno); 
	 void update(Q_ReplyVO vo);
	 void delete(int q_rno);
	 int getAmount(Integer q_bno);
	 List<Q_ReplyVO> list(int q_bno,int page);
	  
}
