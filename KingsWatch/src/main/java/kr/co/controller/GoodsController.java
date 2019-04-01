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

import kr.co.domain.GoodsVO;
import kr.co.service.GoodsService;
import kr.co.utils.MediaUtils;

@Controller
@RequestMapping("/goods")
public class GoodsController {

	@Inject
	private GoodsService service;
	
	// 상품이미지 업로드
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@ResponseBody
	@RequestMapping(value="/deletefile",method=RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName, int bno){
		
		service.goodsPicDbDel(fileName,bno);
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
	
	@RequestMapping("/goodsPicDbGet/{g_id}")
	@ResponseBody
	public Map<String, String> goodsPicDbGet(@PathVariable("g_id")String g_id){
		List<String> list= service.goodsPicDbGet(g_id);
		Map<String, String> map=new HashMap<String, String>();
		map.put("fullName", list.get(0));
		return map;
	}
	
	@RequestMapping("/goodsReadPicDbGet/{g_id}")
	@ResponseBody
	public List<String> goodsReadPicDbGet(@PathVariable("g_id")String g_id){

		return service.goodsPicDbGet(g_id);
	}
	
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
		System.out.println(vo.getFiles().length);
		service.goodsInsert(vo);
		return "redirect:/goods/goodsList";
	}
	
	@RequestMapping(value="/goodsRead", method=RequestMethod.GET)
	public String read(String g_id, Model model) {
		GoodsVO vo= service.goodsRead(g_id);
		List<String> img= service.goodsPicDbGet(g_id);
		model.addAttribute("goodsRead", vo);
		model.addAttribute("img", img);
		return "goods/goodsRead";
	}
	

	

}
