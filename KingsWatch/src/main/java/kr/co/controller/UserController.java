package kr.co.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

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
		return "user/join2";

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
	public String loginCheck(UserDTO userDTO, HttpSession session) throws Exception {	//요파라미터들이 어디서 온거지?
		String returnURL = "";
		if(session.getAttribute("login")!=null) {	//기존에 login이란 세션값이 존재한다면
			System.out.println("기존의 세션값을 제거합니다.");
			session.removeAttribute("login");		//기존값 제거 하고봄.
		}
		
		// 로그인이 성공하면 UsersVO 객체를 반환함.
        UserDTO dto = service.getUser(userDTO);	
        if ( dto != null ){ // 로그인 성공
            session.setAttribute("login", dto); // 세션에 login인이란 이름으로 UsersDTO 객체를 저장해 놈.
        	System.out.println("<컨트롤러> 로그인 성공 세션값 = "+session.getAttribute("login"));
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
	   public int idCheck(@RequestBody String ID) throws Exception{
		int count=0;
		System.out.println("컨트롤러로 받아온 userid값 : "+ID);
		System.out.println("원래 count값 : "+count);
	    System.out.println(ID);
		count = service.idCheck(ID);
		System.out.println("count : "+count);
		System.out.println("서비스 실행하고 count값 : " +count);
	    return count;
	   }


	
}
