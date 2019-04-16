package kr.co.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.domain.UserDTO;
import kr.co.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Inject
	private UserService service;
	 
	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	//회원가입 화면
	@RequestMapping("/join")
	public String joinui() {
		System.out.println("회원가입화면으로 가라");
		return "user/join2";

	}
	
	//  회원가입 처리하고 로그인 화면으로
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join(UserDTO dto) {
		System.out.println("회원가입 처리명령 받음");
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

		UserDTO dto = service.getUser(userDTO);	//암호화된 비번 가지고있는놈 dto에 저장.
		System.out.println(dto);
		if(dto!=null) {
			
			boolean passmatch = passwordEncoder.matches(userDTO.getU_pw(), dto.getU_pw()); // 유저입력 비번과 암호화된 비번 매칭

			if (passmatch) {
				session.setAttribute("login", dto); // 세션에 login인이란 이름으로 UsersDTO 객체를 저장해 놈.
				System.out.println("<컨트롤러> 로그인 성공 세션값 = " + session.getAttribute("login"));
				returnURL = "redirect:/"; // 로그인 성공시 메인페이지로 이동하고
			} else {
				System.out.println("로그인 실패");
				returnURL = "user/login"; // 로그인 폼으로 다시 가도록 함
			}
		} else {
			System.out.println("로그인 실패");
			returnURL = "user/login"; // 로그인 폼으로 다시 가도록 함
		}
		return returnURL; // 위에서 설정한 returnURL 을 반환해서 이동시킴
	}
	
	
	//로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		System.out.println("로그아웃합니다.");
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
	public String update(UserDTO userDTO, HttpSession session) throws Exception{
		
		UserDTO dto = service.update(userDTO, session);
		session.setAttribute("login", dto);
		System.out.println("세션값 성공적 변경 : "+session.getAttribute("login"));
		return "redirect:/";
	}
	
	//비밀번호 변경 화면으로
	@RequestMapping("/updatePw")
	public String update_pw() {
		return "user/updatePw";	
	}
	
	//비밀번호 수정 실행
	@RequestMapping(value="updatePw", method=RequestMethod.POST)
	public String updatePw(String oldPw, String newPw, UserDTO userDTO, HttpSession session) throws Exception{
		UserDTO newdto = (UserDTO) session.getAttribute("login");
		newdto.setU_pw(newPw);
		Map map = new HashMap();
		map.put("oldPw", oldPw);
		map.put("newPw", newPw);
		map.put("u_id", newdto.getU_id());
		
		UserDTO dto = service.updatePw(map, session);
		session.setAttribute("login", dto);
		return "redirect:/user/viewDetail";
	}
	
	
	
	@RequestMapping(value="delete")
	public String delete(HttpSession session) {
		UserDTO dto = (UserDTO) session.getAttribute("login");
		String id = dto.getU_id();
		service.delete(id);
		session.invalidate();
		
		return "redirect:/";
	}

	
	
	//Controller는 view를 리턴, ResponseBody는 데이터를 리턴
	   @RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	   @ResponseBody
	   public int idCheck(@RequestBody String u_id) throws Exception{
		int count = service.idCheck(u_id);
	    return count;
	   }
	   
	   
	 //Controller는 view를 리턴, ResponseBody는 데이터를 리턴
	   @RequestMapping(value = "/emailCheck", method = RequestMethod.POST)
	   @ResponseBody
	   public int emailCheck(@RequestBody String u_email) throws Exception{
		
		System.out.println("컨트롤러로 받아온 useremail값 : "+u_email);
		int count = service.emailCheck(u_email);
		System.out.println("컨트롤러로 받아온 useremail값2 : "+u_email);
		System.out.println("컨트롤러로 받아온 useremailCount : "+count);
		
		return count;
	   }
	   

	
}
