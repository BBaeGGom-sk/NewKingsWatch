package kr.co.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.domain.CategoryCriteria;
import kr.co.domain.Criteria;
import kr.co.domain.GoodsVO;
import kr.co.domain.PageMaker;
import kr.co.service.GoodsService;
import kr.co.utils.MediaUtils;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Inject
	private GoodsService service;
	
	// 상품이미지 업로드
	@Resource(name="uploadPath")
	private String uploadPath;
	
	// 상품이미지 DB삭제
	@ResponseBody
	@RequestMapping(value="/deletefile",method=RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName, String g_id){
		service.goodsPicDbDel(g_id);
		ResponseEntity<String> entity=null;
		fileName.replace('/',File.separatorChar);
		String formatType=fileName.substring(fileName.lastIndexOf(".")+1);
		MediaType mType=MediaUtils.getMediaType(formatType);
		
		if(mType!=null) {
			String prefix=fileName.substring(0,12);
			String subfix=fileName.substring(14);
			File f1 = new File(uploadPath+prefix+subfix);
			f1.delete();
		}
		
		File f2 = new File(uploadPath+fileName);
		f2.delete();
		
		entity = new ResponseEntity<String>("성공~",HttpStatus.OK);
		
		return entity;
	}
	
	// id에따른 상품이미지 불러오기
	@RequestMapping("/goodsPicDbGet/{g_id}")
	@ResponseBody
	public Map<String, String> goodsPicDbGet(@PathVariable("g_id")String g_id){
		List<String> list= service.goodsPicDbGet(g_id);
		Map<String, String> map=new HashMap<String, String>();
		map.put("fullName", list.get(0));
		return map;
	}
	
	// 상품 상세보기시 id에 따른 상품이미지 불러오기
	@RequestMapping("/goodsReadPicDbGet/{g_id}")
	@ResponseBody
	public List<String> goodsReadPicDbGet(@PathVariable("g_id")String g_id){

		return service.goodsPicDbGet(g_id);
	}
	
	// 상품리스트
	@RequestMapping("/goodsList")
	public String list(Criteria cri, Model model) {
		List<GoodsVO> goodsList= service.goodsList(cri);
		int amount = service.getAmount();
		PageMaker pm= new PageMaker(amount, cri);
		
		model.addAttribute("pm", pm);
		model.addAttribute("goodsList", goodsList);
		return "goods/goodsList";
	}
	
	// 브랜드에 따른 남성 상품리스트
	@RequestMapping("/goodsListMan")
	public String listMan(CategoryCriteria cri, Model model) {
		List<GoodsVO> goodsListMan= service.goodsListMan(cri);
		int amount = service.getCategoryAmount(cri);
		PageMaker pm= new PageMaker(amount, cri);
		pm.setCri(cri);
		
		model.addAttribute("pm", pm);
		model.addAttribute("goodsListMan", goodsListMan);
		return "goods/goodsListMan";
	}
	
	// 브랜드에 따른 여성 상품리스트
	@RequestMapping("/goodsListWoman")
	public String listWoman(CategoryCriteria cri, Model model) {
		List<GoodsVO> goodsListWoman= service.goodsListWoman(cri);
		int amount = service.getCategoryAmount(cri);
		PageMaker pm= new PageMaker(amount, cri);
		pm.setCri(cri);
		
		model.addAttribute("pm", pm);
		model.addAttribute("goodsListWoman", goodsListWoman);
		return "goods/goodsListWoman";
	}
	
	// 브랜드에 따른 공용 상품리스트
	@RequestMapping("/goodsListPublic")
	public String listPublic(CategoryCriteria cri, Model model) {
		List<GoodsVO> goodsListPublic= service.goodsListPublic(cri);
		int amount = service.getCategoryAmount(cri);
		PageMaker pm= new PageMaker(amount, cri);
		pm.setCri(cri);

		model.addAttribute("pm", pm);
		model.addAttribute("goodsListPublic", goodsListPublic);
		return "goods/goodsListPublic";
	}
	
	// 상품올리기 화면
	@RequestMapping(value="/goodsInsert", method=RequestMethod.GET)
	public void insertui() {
		
	}
	
	// 상품올리기
	@RequestMapping(value="/goodsInsert", method=RequestMethod.POST)
	public String insert(GoodsVO vo) {
		service.goodsInsert(vo);
		return "redirect:/goods/goodsList";
	}
	
	// id에 따른 상품 상세보기
	@RequestMapping(value="/goodsRead", method=RequestMethod.GET)
	public String read(String g_id, Model model) {
		GoodsVO vo= service.goodsRead(g_id);
		model.addAttribute("goodsRead", vo);
		return "goods/goodsRead";
	}
	
	// id에 따른 상품 업데이트하기 화면
	@RequestMapping(value="/goodsUpdate", method=RequestMethod.GET)
	public String updateui(String g_id, Model model) {
		GoodsVO vo= service.goodsRead(g_id);
		service.goodsPicDbGet(g_id);
		model.addAttribute("goodsRead", vo);
		return "goods/goodsUpdate";
	}
	
	// id에 따른 상품 업데이트하기
	@RequestMapping(value="/goodsUpdate", method=RequestMethod.POST)
	public String update(GoodsVO vo) {
		service.goodsUpdate(vo);
		return "redirect:/goods/goodsList";
	}
	

	

}
