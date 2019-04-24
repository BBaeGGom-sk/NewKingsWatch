package kr.co.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.domain.GoodsVO;
import kr.co.domain.UserDTO;
import kr.co.service.GoodsService;
import kr.co.service.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Inject
	private OrderService service;
	
	@Inject
	private GoodsService gService;

	@RequestMapping(value = "/orderPage", method = RequestMethod.POST)
	public String payment() {

		return ""; // 결제 완료창으로 이어질것
	}

	@RequestMapping(value = "/orderPage", method = RequestMethod.GET)
	public String orderPage(String u_id, String g_id, int[] o_quantity, Model model) {
		// u_id를 통해 유저 정보 받아오기 추후에 로그인세션으로 u_id받을예정
		UserDTO dto = service.selectById(u_id);
		// g_id를 통해 상품 정보 리스트 받아오기 상품 상세페이지에서 상품 하나만 받아오는 경우
		List<GoodsVO> goodsList = service.selectGoodsList(g_id); // service.getGoods(g_id) 로 변경도 생각하기. 둘이 동일한 기능
		model.addAttribute("goodsList", goodsList);
		model.addAttribute("o_quantity", o_quantity);
		model.addAttribute("dto", dto);
		return "order/orderPage";
	}
	
	@RequestMapping(value = "/cartOrderPage", method = RequestMethod.POST)
	public String cartOrderPage(String u_id, String[] g_idArr, int[] o_quantityArr, Model model) {
		// u_id를 통해 유저 정보 받아오기 추후에 로그인세션으로 u_id받을예정
		UserDTO dto = service.selectById(u_id);
		List<GoodsVO> goodsList = new ArrayList<GoodsVO>(); 
		for (int i = 0; i < g_idArr.length; i++) {
			GoodsVO goods = service.getGoods(g_idArr[i]); // service.getGoods(g_id) 로 변경도 생각하기. 둘이 동일한 기능
			goodsList.add(goods);
		}
		model.addAttribute("goodsList", goodsList);
		model.addAttribute("o_quantity", o_quantityArr);
		model.addAttribute("dto", dto);
		return "order/orderPage";
	}

	@RequestMapping(value = "/cartPage", method = RequestMethod.GET)
	public String cartPage(HttpSession session, Model model) {

		// 로그인세션으로 userDTO 받아서
		// UserDTO dto = (UserDTO) session.getAttribute("login");
		// String u_id = dto.getU_id();
		// 로그인세션 못받을때 임시로 유저 데이터 넣어주기
		String u_id = "bbaeggom";
		// u_id로 basket DB 셀렉트문 돌려서 (map사용할듯) 해당 u_id에 장바구니리스트 불러온다음
		List<String> b_idList = service.selectCartList(u_id);
		// 장바구니 리스트에 b_id로 goods테이블에 해당하는 상품 정보 불러오기 (for문 사용할듯함)
		List<GoodsVO> goodsList = new ArrayList<GoodsVO>();
		// 수량 리스트
		List<Integer> quantityList = new ArrayList<Integer>();
		
		Map<String, Object> map = new HashMap<String, Object>();
		for (int i = 0; i < b_idList.size(); i++) { // 리스트에 담긴 b_id만큼 for문 돌리기
			String g_id = b_idList.get(i); // b_id 하나씩 불러오기
			GoodsVO goods = service.getGoods(g_id); // b_id를 통해 상품정보 불러오기
			goodsList.add(goods); // 리스트에 하나씩 담기
			int quantity = service.getQuantity(g_id); // b_id를 통해 장바구니 해당 상품 수량 가져오기
			quantityList.add(quantity);
		}
		map.put("goodsList", goodsList);
		map.put("quantityList", quantityList);
		// 화면에 뿌려주기
		model.addAttribute("map", map);

		return "order/cartPage";
	}

	@ResponseBody
	@RequestMapping(value = "/addCart", method = RequestMethod.POST)
	public ResponseEntity<String> addCart(UserDTO dto, GoodsVO vo,int o_quantity) {

		// 변수가 두개여서 파라미터 domain클래스로 받아서 get해줌.
		// 하나면 @requestBody사용해도 되지만 두개부턴 인식XXX
		String u_id = dto.getU_id();
		String g_id = vo.getG_id();

		ResponseEntity<String> entity = null;
		try {
			service.addCart(u_id, g_id,o_quantity);
			entity = new ResponseEntity<String>("INSERT_SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
	
	@RequestMapping(value = "/changeQuantity", method = RequestMethod.POST)
	public ResponseEntity<String> changeQuantity(String u_id,String g_id,int b_quantity) {
		
		ResponseEntity<String> entity = null;
		try {
			service.changeQuantity(u_id,g_id,b_quantity);
			entity = new ResponseEntity<String>("INSERT_SUCCESS",HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/deleteCart", method = RequestMethod.POST)
	public ResponseEntity<String> deleteCart(String[] g_idArr,String u_id) {
		
		ResponseEntity<String> entity = null;
		
		try {
			for (int i = 0; i < g_idArr.length; i++) {
				service.deleteCart(u_id,g_idArr[i]);
				entity = new ResponseEntity<String>("INSERT_SUCCESS",HttpStatus.OK);
			}
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		
		return entity;
	}
	
	@RequestMapping(value = "/cartAllDelete", method = RequestMethod.POST)
	public ResponseEntity<String> cartAllDelete(String u_id) {
		
		ResponseEntity<String> entity = null;
		try {
			service.cartAllDelete(u_id);
			entity = new ResponseEntity<String>("INSERT_SUCCESS",HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/deleteBtnCart", method = RequestMethod.POST)
	public ResponseEntity<String> deleteBtnCart(String u_id,String g_id) {
		
		ResponseEntity<String> entity = null;
		
		try {
			service.deleteCart(u_id, g_id);
			entity = new ResponseEntity<String>("INSERT_SUCCESS",HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	}
	
	// id에따른 상품이미지 불러오기
	@RequestMapping("/goodsPicDbGet/{g_id}")
	@ResponseBody
	public Map<String, String> goodsPicDbGet(@PathVariable("g_id")String g_id){
		List<String> list= gService.goodsPicDbGet(g_id);
		Map<String, String> map=new HashMap<String, String>();
		map.put("fullName", list.get(0));
		return map;
	}

}
