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
import kr.co.domain.ReviewVO;
import kr.co.service.ReviewService;


@RestController
@RequestMapping("/review")
public class ReviewController {
//상품상세정보 하단에 나오는 상품평(댓글)에 관한 컨트롤러
	@Inject
	private ReviewService service;

	

	@RequestMapping(value = "/{g_id}/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> list(@PathVariable("g_id") String g_id,@PathVariable("page")int page) {
		ResponseEntity<Map<String, Object>> entity = null;

		try {
			List<ReviewVO> list = service.list(g_id,page);
			int amount=service.getAmount(g_id);
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
	public ResponseEntity<String> insert(@RequestBody ReviewVO vo) {

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

	@RequestMapping(value = "/{r_bno}", method = RequestMethod.PUT)
	public ResponseEntity<String> update(@PathVariable("r_bno") int r_bno, @RequestBody ReviewVO vo) {
		ResponseEntity<String> entity = null;

		try {
			System.out.println(r_bno);
			vo.setR_bno(r_bno);
			System.out.println(vo.toString());
			service.update(vo);
			entity = new ResponseEntity<String>("good", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
	
	
	@RequestMapping(value="/{r_bno}", method = RequestMethod.DELETE)
	public ResponseEntity<String> delete(@PathVariable("r_bno") int r_bno) {
		ResponseEntity<String> entity = null;

	
		try {
			service.delete(r_bno);
			
			entity = new ResponseEntity<String>("good", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
	
	

}
