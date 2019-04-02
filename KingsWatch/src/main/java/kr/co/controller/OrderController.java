package kr.co.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
}
