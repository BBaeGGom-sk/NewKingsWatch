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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.domain.QnaVO;
import kr.co.domain.Criteria;
import kr.co.domain.PageMaker;
import kr.co.domain.QnaVO;
import kr.co.domain.SearchCriteria;
import kr.co.service.QnaService;
import kr.co.utils.MediaUtils;

@Controller
@RequestMapping("/qna")
public class QnaController {
//qna 게시판 컨트롤러 
	@Inject
	private QnaService service;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@RequestMapping(value="/read")
	public void read(int q_bno, Criteria cri, Model model) {
		QnaVO vo = service.read(q_bno);
		model.addAttribute("vo", vo);
		model.addAttribute("cri", cri);

	}
	
	@RequestMapping(value="/list")
	public String list(Criteria cri, Model model) {
		List<QnaVO> list = service.listPage(cri);
		int amount = service.getAmount();
		 
		PageMaker pm = new PageMaker(amount, cri);
		
		model.addAttribute("pm", pm);
		model.addAttribute("list", list);
		return "qna/list";
	}
	
	@RequestMapping(value = "/insertui", method = RequestMethod.GET)
	public String insertui() {
		return "qna/insert";

	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(QnaVO vo) {
		service.insert(vo);
		return "redirect:/qna/list";
	}
	
	@RequestMapping("/updateui")
	public String updateui(int q_bno, Model model, @ModelAttribute("cri") Criteria cri) {

		QnaVO vo = service.updateUI(q_bno);
		model.addAttribute("vo", vo);
		return "qna/update";
	}
	
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(QnaVO vo, Model model, Criteria cri) {
		service.update(vo);
		model.addAttribute("page", cri.getPage());
		model.addAttribute("perPage", cri.getPerPage());
		return "redirect:/qna/list";
	}

	@RequestMapping("/delete")
	public String delete(int q_bno, Model model, Criteria cri) {
		model.addAttribute("page", cri.getPage());
		model.addAttribute("perPage", cri.getPerPage());
		service.delete(q_bno);
		return "redirect:/qna/list";
	}

	@RequestMapping("/listpage")
	public String listPage(Criteria cri, Model model) {

		List<QnaVO> list = service.listPage(cri);
		model.addAttribute("list", list);
		return "qna/list";

	}
	
	
	@RequestMapping("/search") // 검색 기능
	public String search(SearchCriteria cri, Model model) {

		// 페이징처리 시작
		List<QnaVO> list = service.search(cri);
		model.addAttribute("list", list);

		int amount = service.getSearchtAmount(cri);

		PageMaker pm = new PageMaker(amount, cri);
		pm.setCri(cri);

		model.addAttribute("pm", pm);
		// 페이징처리 끝

		return "qna/search";
	}

	@RequestMapping(value = "/sread")
	public void sread(int q_bno, SearchCriteria cri, Model model) {
		QnaVO vo = service.read(q_bno);
		model.addAttribute("vo", vo);
		model.addAttribute("cri", cri);

	}

	@RequestMapping("/supdateui")
	public String supdateui(int q_bno, Model model, @ModelAttribute("cri") SearchCriteria cri) {

		QnaVO vo = service.updateUI(q_bno);
		model.addAttribute("vo", vo);
		return "qna/supdate";
	}

	@RequestMapping(value = "/supdate", method = RequestMethod.POST)
	public String supdate(QnaVO vo, SearchCriteria cri, RedirectAttributes rttr) {
		service.update(vo);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPage", cri.getPerPage());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("searchType", cri.getSearchType());
		return "redirect:/qna/search";
	}

	@RequestMapping("/sdelete")
	public String sdelete(int q_bno, Model model, SearchCriteria cri, RedirectAttributes rttr) {
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPage", cri.getPerPage());
		service.delete(q_bno);
		return "redirect:/qna/search";
	}
	 
	
	
	
	@ResponseBody
	@RequestMapping(value="/deletefile",method=RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName, int q_bno){
		
		service.deleteAttach(fileName, q_bno);
		
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
	
	
	
	@RequestMapping(value = "/getAttach/{q_bno}")
	@ResponseBody
	public List<String> getAttach(@PathVariable("q_bno") Integer q_bno) {
		return service.getAttach(q_bno); 
	}

	
	
}
