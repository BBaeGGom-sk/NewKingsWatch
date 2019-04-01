package kr.co.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.domain.UserDTO;
import kr.co.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Inject
	private UserService service;

	//회원가입 화면
	@RequestMapping("/join")
	public String joinui() {
		return "user/join";	//  user/join.jsp로 이동.

	}
	
	//  회원가입 처리하고 로그인 화면으로
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join(UserDTO dto) {
		service.join(dto);
		return "redirect:/user/login";	
	}
	
	
	//로그인 화면
	@RequestMapping("/login")
	public String loginui() {
		return "user/login";	

	}
	
	//로그인 처리
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String loginCheck(@ModelAttribute UserDTO dto, HttpSession session) {
		System.out.println("로그인 처리 메서드 들어옴");
		String name = service.loginCheck(dto, session);
		if(name != null) {
			System.out.println("로그인 처리 메서드 널이 아닐때");
			return "redirect:/";	
			
		}else {
			System.out.println("로그인 처리 메서드 널일때 ");
			return "redirect:/error";
		}

	}
	
	
	//로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";	

	}
	
	
	@RequestMapping("/select")
	public String select(Model model) {

		List<UserDTO> list = service.select();
		model.addAttribute("list", list);

		return "user/select";
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
