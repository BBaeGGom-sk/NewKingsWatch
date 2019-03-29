package kr.co.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.domain.GoodsVO;
import kr.co.service.GoodsService;

@Controller
@RequestMapping("/goods")
public class GoodsController {

	@Inject
	private GoodsService service;
	
	@RequestMapping("/goodsList")
	public String list(Model model) {
		List<GoodsVO> goodsList= service.goodsList();
		model.addAttribute("goodsList", goodsList);
		return "goods/goodsList";
	}
	
}
