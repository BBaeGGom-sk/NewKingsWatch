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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.domain.Criteria;
import kr.co.domain.NoticeVO;
import kr.co.domain.PageMaker;
import kr.co.service.NoticeService;
import kr.co.utils.MediaUtils;

@Controller
@RequestMapping("/notice")
public class NoticeController {
//공지 컨트롤러
	
	@Inject
	private NoticeService service;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@RequestMapping(value="/list")
	public String list(Criteria cri, Model model) {
	
		List<NoticeVO> list = service.listPage(cri);
		int amount = service.getAmount();
		
		PageMaker pm = new PageMaker(amount, cri);
		
		model.addAttribute("pm", pm);
		model.addAttribute("list", list);
		return "notice/list";
	}
	
	
	@RequestMapping(value = "/read")
	public void read(int n_bno, Criteria cri, Model model) {
		NoticeVO vo = service.read(n_bno);
		model.addAttribute("vo", vo);
		model.addAttribute("cri", cri);

	}
	
	@RequestMapping("/updateui")
	public String updateui(int n_bno, Model model, @ModelAttribute("cri") Criteria cri) {

		NoticeVO vo = service.updateUI(n_bno);
		model.addAttribute("vo", vo);
		return "notice/update";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(NoticeVO vo, Model model, Criteria cri) {
		service.update(vo);
		model.addAttribute("page", cri.getPage());
		model.addAttribute("perPage", cri.getPerPage());
		return "redirect:/notice/list";
	}
	
	@RequestMapping("/delete")
	public String delete(int n_bno, Model model, Criteria cri) {
		model.addAttribute("page", cri.getPage());
		model.addAttribute("perPage", cri.getPerPage());
		service.delete(n_bno);
		return "redirect:/notice/list";
	}
 
	@RequestMapping(value = "/insertui", method = RequestMethod.GET)
	public String insertui() {
		return "notice/insert";

	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(NoticeVO vo) {
		service.insert(vo);
		return "redirect:/notice/list";
	} 
	
	
	
	
	
	
	
	@ResponseBody
	@RequestMapping(value="/deletefile",method=RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName, int n_bno){
		
		service.deleteAttach(fileName, n_bno);
		
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
	
	
	
	@RequestMapping(value = "/getAttach/{n_bno}")
	@ResponseBody
	public List<String> getAttach(@PathVariable("n_bno") Integer n_bno) {
		return service.getAttach(n_bno); 
	}

	
	
	
	

}
