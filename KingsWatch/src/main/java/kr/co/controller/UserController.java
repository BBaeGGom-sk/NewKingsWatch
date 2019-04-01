package kr.co.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.domain.UserDTO;
import kr.co.service.UserService;
import kr.co.service.UserServiceImpl;

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

	
	@RequestMapping(value="/updateui")
public String updateui(String id, Model model) {
		
		UserDTO dto = service.updateui(id);
	    model.addAttribute("dto",dto);
	
		return "user/update";
	}	
	
	
	
	
	//회원정보 상세보기
	@RequestMapping("/viewDetail")
	public String viewDetail(String userId, Model model) {
		System.out.println("회원정보 상세보기로 가라");
		System.out.println("userId = " + userId);
		model.addAttribute("dto", service.viewDetail(userId));

		return "user/viewDetail";	
	}
	
	
	//회원정보 수정 실행
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String update(UserDTO dto) {
		
		service.update(dto);
		
		return "redirect:/user/viewDetail";
	}
	
	
	@RequestMapping(value="delete")
	public String delete(String id) {
		
		service.delete(id);
		
		return "redirect:/user/select";
	}



	
}
