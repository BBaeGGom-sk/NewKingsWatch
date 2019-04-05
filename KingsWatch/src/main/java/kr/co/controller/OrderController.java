package kr.co.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.domain.GoodsVO;
import kr.co.domain.UserDTO;
import kr.co.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Inject
	private OrderService service;
	
	@RequestMapping(value="/orderPage",method=RequestMethod.POST)
	public String payment() {
		
		return ""; //결제 완료창으로 이어질것
	}
	
	// 밸류 orderpage로 가는것 맞는지 확인하고 리턴 생각해보기
	@RequestMapping(value="/orderPage",method=RequestMethod.GET)
	public String orderPage(String u_id,String g_id,int o_quantity,Model model) {
		// u_id를 통해 유저 정보 받아오기 추후에 로그인세션으로 u_id받을예정
		UserDTO dto = service.selectById(u_id);
		// g_id를 통해 상품 정보 리스트 받아오기
		if (g_id != null) { // 상품 상세페이지에서 상품 하나만 받아오는 경우
			List<GoodsVO> goodsList = service.selectGoodsList(g_id); // service.getGoods(g_id) 로 변경도 생각하기. 둘이 동일한 기능
			model.addAttribute("goodsList", goodsList);
			model.addAttribute("o_quantity", o_quantity);
		} else { // 나중에 개발
//			List<GoodsVO> goodsList = new ArrayList<GoodsVO>();
//			for (int i = 0; i < b_idList.size(); i++) { // 리스트에 담긴 b_id만큼 for문 돌리기
//				g_id = b_idList.get(i); // b_id를 g_id로 바꿔서 하나씩 불러오기
//				System.out.println(b_idList.get(i)); // 잘들어가는지 확인용
//				GoodsVO goods = service.getGoods(g_id); // g_id를 통해 상품정보 불러오기
//				goodsList.add(goods); // 리스트에 하나씩 담기
		}
		model.addAttribute("dto",dto);	
		return "order/orderPage";
	}
	
	@RequestMapping(value="/cartPage",method=RequestMethod.GET)
	public String cartPage(HttpSession session,Model model) {

		// 로그인세션으로 userDTO 받아서 
		//UserDTO dto = (UserDTO) session.getAttribute("login");
		//String u_id = dto.getU_id();
		// 로그인세션 못받을때 임시로 유저 데이터 넣어주기
		String u_id = "bbaeggom";
		// u_id로 basket DB 셀렉트문 돌려서 (map사용할듯) 해당 u_id에 장바구니리스트 불러온다음
		List<String> b_idList = service.selectCartList(u_id);
		// 장바구니 리스트에 b_id로 goods테이블에 해당하는 상품 정보 불러오기 (for문 사용할듯함)
		List<GoodsVO> goodsList = new ArrayList<GoodsVO>();
		for (int i = 0; i < b_idList.size(); i++) { // 리스트에 담긴 b_id만큼 for문 돌리기
			String g_id = b_idList.get(i); // b_id 하나씩 불러오기
			System.out.println(b_idList.get(i)); // 잘들어가는지 확인용
			GoodsVO goods = service.getGoods(g_id); // b_id를 통해 상품정보 불러오기
			goodsList.add(goods); // 리스트에 하나씩 담기
		}
		// 화면에 뿌려주기
		model.addAttribute("goodsList", goodsList);

		return "order/cartPage";
	}
	
	@RequestMapping(value="cartPage",method=RequestMethod.POST)
	public String cartOrderPage(String[] g_idArr) {
		for (int i = 0; i < g_idArr.length; i++) {
			String g_id = g_idArr[i];
		}
		
		
		return "redirect:/order/orderPage";
	}
	
	@ResponseBody
	@RequestMapping(value="/addCart", method=RequestMethod.POST)
	public ResponseEntity<String> addCart(UserDTO dto, GoodsVO vo) {
		
		// 변수가 두개여서 파라미터 domain클래스로 받아서 get해줌.
		// 하나면 @requestBody사용해도 되지만 두개부턴 인식XXX
		String u_id=dto.getU_id();
		String g_id=vo.getG_id();

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

