package kr.co.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.co.domain.Criteria;
import kr.co.domain.PageMaker;
import kr.co.domain.Q_ReplyVO;
import kr.co.service.Q_ReplyService;
import kr.co.service.QnaService;

@RestController
@RequestMapping("/q_replies")
public class Q_ReplyController {
	//qna 게시판의 '댓글' 기능 컨트롤러
	
	@Inject
	private Q_ReplyService service;
	
	@Inject
	private QnaService qservice;
	
	//qna게시판의 '댓글'기능 서비스뿐만아니라
	//qna게시판의 서비스도 inject 해줬음 qservice로 지정
	

	@RequestMapping(value = "/{q_bno}/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> list(@PathVariable("q_bno") int q_bno,@PathVariable("page")int page) {
		ResponseEntity<Map<String, Object>> entity = null;

		try {
			List<Q_ReplyVO> list = service.list(q_bno,page);
			int amount=service.getAmount(q_bno);
			PageMaker pm=new PageMaker();
			Criteria cri = new Criteria();
			cri.setPage(page);
			pm.setCri(cri);//pm.setAmount와 순서가 바뀌면 안됨
			pm.setAmount(amount);
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("list", list);
			map.put("pm", pm);
			
			
			
			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> insert(@RequestBody Q_ReplyVO vo) {

		ResponseEntity<String> entity = null;

		try {
			service.insert(vo);
			entity = new ResponseEntity<String>("INSERT_SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/{q_rno}", method = RequestMethod.PUT)
	public ResponseEntity<String> update(@PathVariable("q_rno") int q_rno, @RequestBody Q_ReplyVO vo) {
		ResponseEntity<String> entity = null;

		try {
			vo.setQ_rno(q_rno);
			service.update(vo);
			entity = new ResponseEntity<String>("good", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
	
	
	@RequestMapping(value="/{q_rno}/{q_bno}", method = RequestMethod.DELETE)
	public ResponseEntity<String> delete(@PathVariable("q_rno") int q_rno, @PathVariable("q_bno") int q_bno) {
		ResponseEntity<String> entity = null;

	
		try {
			service.delete(q_rno);
			qservice.replyCnt(q_bno);
			//댓글 삭제시에 qna게시판서비스에 있는 댓글 조회후 수정 쿼리가 돌아감.
			//이로 인해 댓글 삭제후에 댓글 수를 반영해줄 수 있는
			//insert는 컨트롤러 아닌 서비스쪽에서 호출하는 방식으로 구현해놨음.
			//이는 댓글 insert 시에는 vo객체를 통해서 q_bno값을 얻을 수 있어서 
			//q_bno의 게시글의 댓글수(컬럼)에 접근하는 것이 가능하지만
			//일반 댓글기능의 서비스에서는 q_rno만 파라미터로 받아 댓글 하나만 지우기 때문에
			//컨트롤러쪽에서 q_bno를 같이받아 qna게시판 서비스의 replyCnt를 돌릴 수 있게했음.
			
			
			
			entity = new ResponseEntity<String>("good", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
	
	

}
