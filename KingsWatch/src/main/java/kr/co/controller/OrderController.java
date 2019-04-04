package kr.co.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.domain.BasketVO;
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
	public void orderPage(String u_id,Model model) {
		UserDTO dto = service.selectById(u_id);
		// u_id 파라미터 꼭 다시 돌려놓기
		model.addAttribute("dto",dto);	
	}
	
	@RequestMapping(value="/cartPage",method=RequestMethod.GET)
	public void cartPage(HttpSession session,Model model) {

		// 로그인세션으로 userDTO 받아서 
		UserDTO dto = (UserDTO) session.getAttribute("login");
		String u_id = dto.getU_id();
		// u_id로 basket DB 셀렉트문 돌려서 (map사용할듯) 해당 u_id에 장바구니리스트 불러온다음
		List<String> b_idList = service.selectCartList(u_id);
		// 장바구니 리스트에 b_id로 goods테이블에 해당하는 상품 정보 불러오기 (for문 사용할듯함)
		List<GoodsVO> goodsList = new ArrayList<GoodsVO>();
		for (int i = 0; i < b_idList.size(); i++) { // 리스트에 담긴 b_id만큼 for문 돌리기
			String b_id = b_idList.get(i); // b_id 하나씩 불러오기
			System.out.println(b_idList.get(i)); // 잘들어가는지 확인용
			GoodsVO goods = service.getGoods(b_id); // b_id를 통해 상품정보 불러오기
			goodsList.add(goods); // 리스트에 하나씩 담기
		}
		// 화면에 뿌려주기
		model.addAttribute("goodsList", goodsList);

	}
}

