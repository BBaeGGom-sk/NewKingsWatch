package kr.co.controller;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.domain.GoodsVO;
import kr.co.domain.UserDTO;
import kr.co.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Inject
	private OrderService service;
	
	// 밸류 orderpage로 가는것 맞는지 확인하고 리턴 생각해보기
	@RequestMapping(value="/orderPage",method=RequestMethod.GET)
	public void selectById(String u_id,Model model) {
		UserDTO dto = service.selectById(u_id);
		// u_id 파라미터 꼭 다시 돌려놓기
		model.addAttribute("dto",dto);	
	}

	@RequestMapping(value="/orderPage2",method=RequestMethod.GET)
	public void orderInfo(String u_id,Model model) {
		UserDTO dto = service.selectById(u_id);
		// u_id 파라미터 꼭 다시 돌려놓기
		model.addAttribute("dto",dto);	
	}
	
	@ResponseBody
	@RequestMapping(value="/addCart", method=RequestMethod.POST)
	public ResponseEntity<String> addCart(@RequestBody Map<String, String> map) {
		
		// 변수 두개 맵으로 받아서 집어넣기
		String u_id=map.get("u_id");
		String g_id=map.get("g_id");
		
		ResponseEntity<String> entity = null;
		try {
			service.addCart(u_id,g_id);
			entity = new ResponseEntity<String>("INSERT_SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
	
}

