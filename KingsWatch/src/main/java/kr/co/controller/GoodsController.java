package kr.co.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
