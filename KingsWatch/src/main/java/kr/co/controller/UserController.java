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
		return "user/join2";	//  user/join.jsp로 이동.

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
	public String loginCheck(UserDTO userDTO, HttpSession session) throws Exception {
		String returnURL = "";
		if(session.getAttribute("login")!=null) {	//기존에 login이란 세션값이 존재한다면
			System.out.println("기존의 세션값을 제거합니다.");
			session.removeAttribute("login");		//기존값 제거 하고봄.
		}
		
		// 로그인이 성공하면 UsersVO 객체를 반환함.
		System.out.println("<Controller> loginCheck 서비스호출전: " + userDTO);
        UserDTO dto = service.getUser(userDTO);	//mapper id=loginCheck 한 결과 반환.
        System.out.println("<Controller> loginCheck 서비스호출후:" + dto);
        if ( dto != null ){ // 로그인 성공
        	System.out.println("로그인 성공");
            session.setAttribute("login", dto); // 세션에 login인이란 이름으로 UsersDTO 객체를 저장해 놈.
            returnURL = "redirect:/"; // 로그인 성공시 메인페이지로 이동하고
        }else { // 로그인에 실패한 경우
        	System.out.println("로그인 실패");
            returnURL = "redirect:/user/login"; // 로그인 폼으로 다시 가도록 함
        }
          
        return returnURL; // 위에서 설정한 returnURL 을 반환해서 이동시킴
		
		

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
	
	
	
	
	//회원이 자기 정보 상세보기.  보안을 위해 로그인 되어있을때만 접근가능하게 session사용.
	//회원정보를 수정할때는 다시한번 비밀번호 요구 필요. 아, 할필요없이 수정페이지에서 확인하도록 하면 되겠다.
	@RequestMapping("/viewDetail")
	public String viewDetail() {

		return "user/viewDetail";	
	}
	
	
	//회원정보 수정 실행
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String update(UserDTO dto) {
		System.out.println("회원정보 수정 dto : "+dto);
		service.update(dto);
		
		return "redirect:/";
	}
	
	
	@RequestMapping(value="delete")
	public String delete(String id) {
		
		service.delete(id);
		
		return "redirect:/user/select";
	}



	
}
