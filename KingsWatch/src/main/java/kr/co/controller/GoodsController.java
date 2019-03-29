package kr.co.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.domain.GoodsVO;
import kr.co.service.GoodsService;

@Controller
@RequestMapping("/goods")
public class GoodsController {

	@Inject
	private GoodsService service;
	
	// 상품리스트 (임시)
	@RequestMapping("/goodsList")
	public String list(Model model) {
		List<GoodsVO> goodsList= service.goodsList();
		model.addAttribute("goodsList", goodsList);
		return "goods/goodsList";
	}
	
	@RequestMapping(value="/goodsInsert", method=RequestMethod.GET)
	public void insertui() {
		
	}
	
	@RequestMapping(value="/goodsInsert", method=RequestMethod.POST)
	public String insert(GoodsVO vo) {
		service.goodsInsert(vo);
		return "redirect:/goods/goodsList";
	}
	

}
