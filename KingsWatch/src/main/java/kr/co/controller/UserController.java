package kr.co.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.domain.UserDTO;
import kr.co.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Inject
	private UserService service;

	@RequestMapping("/select")
	public String select(Model model) {

		List<UserDTO> list = service.select();
		model.addAttribute("list", list);

		return "user/select";
	}

	@RequestMapping("/insertui")
	public String insertui() {
		return "user/insert";	//  user/insert.jsp로 이동.

	}
	
	//  user/insert.jsp   에서 기입하고 등록버튼 눌렀을때
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public String insert(UserDTO dto) {
		service.insert(dto);
		return "redirect:/user/select";	// url로 user컨트롤러의 select들어왔을때 실행될것

	}
	
	@RequestMapping(value="/selectbyid")
	public void selectById(int id, Model model) {
		UserDTO dto = service.selectById(id);
		model.addAttribute("dto", dto);
	}

	@RequestMapping(value="/updateui")
public String updateui(int id, Model model) {
		
		UserDTO dto = service.updateui(id);
	    model.addAttribute("dto",dto);
	
		return "user/update";
	}	
	
	
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String update(UserDTO dto) {
		
		service.update(dto);
		
		return "redirect:/user/select";
	}
	
	
	@RequestMapping(value="delete")
	public String delete(int num) {
		
		service.delete(num);
		
		return "redirect:/user/select";
	}
	

	
}
