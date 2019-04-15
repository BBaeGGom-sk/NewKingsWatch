package kr.co.controller;
 
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.domain.BrandCriteria;
import kr.co.domain.CategoryCriteria;
import kr.co.domain.Criteria;
import kr.co.domain.GoodsVO;
import kr.co.domain.PageMaker;
import kr.co.domain.SearchCriteria;
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
		int amount = service.getAmount(cri);
		PageMaker pm= new PageMaker(amount, cri);
		pm.setCri(cri);
		
		model.addAttribute("pm", pm);
		model.addAttribute("goodsList", goodsList);
		return "goods/goodsList";
	}
	
	// 판매종료된 전체 상품리스트
	@RequestMapping("/goodsNoSelling")
	public String noSelling(Criteria cri, Model model) {
		List<GoodsVO> goodsNoSellingList= service.goodsNoSellingList(cri);
		int amount = service.getNoSellingAmount();
		PageMaker pm= new PageMaker(amount, cri);
		pm.setCri(cri);
		
		model.addAttribute("pm", pm);
		model.addAttribute("goodsNoSellingList", goodsNoSellingList);
		return "goods/goodsNoSelling";
	}
	
	// 브랜드에 따른 전체 상품리스트
	@RequestMapping("/goodsListBrand")
	public String listBrand(BrandCriteria cri, Model model) {
		List<GoodsVO> goodsListBrand= service.goodsListBrand(cri);
		int amount = service.getBrandAmount(cri);
		PageMaker pm= new PageMaker(amount, cri);
		pm.setCri(cri);

		model.addAttribute("pm", pm);
		model.addAttribute("goodsListBrand", goodsListBrand);
		model.addAttribute("g_brand", cri.getG_brand());
		return "goods/goodsListBrand";
	}
	
	// 브랜드별 판매중지 상품리스트
	@RequestMapping("/goodsListBrandNoSelling")
	public String listBrandNoSelling(BrandCriteria cri, Model model) {
		List<GoodsVO> goodsListBrandNoSelling= service.goodsListBrandNoSelling(cri);
		int amount= service.getBrandNoSellingAmount(cri);
		PageMaker pm= new PageMaker(amount, cri);
		pm.setCri(cri);
		
		model.addAttribute("pm", pm);
		model.addAttribute("NoSelling", goodsListBrandNoSelling);
		model.addAttribute("g_brand", cri.getG_brand());
		return "goods/goodsListBrandNoSelling";
	}
	
	// 브랜드별 남성 상품리스트
	@RequestMapping("/goodsListMan")
	public String listMan(CategoryCriteria cri, Model model) {
		List<GoodsVO> goodsListMan= service.goodsListMan(cri);
		int amount = service.getCategoryAmount(cri);
		PageMaker pm= new PageMaker(amount, cri);
		pm.setCri(cri);
		
		model.addAttribute("pm", pm);
		model.addAttribute("goodsListMan", goodsListMan);
		model.addAttribute("g_brand", cri.getG_brand());
		model.addAttribute("g_category", cri.getG_category());
		return "goods/goodsListMan";
	}
	
	// 브랜드별 여성 상품리스트
	@RequestMapping("/goodsListWoman")
	public String listWoman(CategoryCriteria cri, Model model) {
		List<GoodsVO> goodsListWoman= service.goodsListWoman(cri);
		int amount = service.getCategoryAmount(cri);
		PageMaker pm= new PageMaker(amount, cri);
		pm.setCri(cri);
		
		model.addAttribute("pm", pm);
		model.addAttribute("goodsListWoman", goodsListWoman);
		model.addAttribute("g_brand", cri.getG_brand());
		model.addAttribute("g_category", cri.getG_category());
		return "goods/goodsListWoman";
	}
	
	// 브랜드별 공용 상품리스트
	@RequestMapping("/goodsListPublic")
	public String listPublic(CategoryCriteria cri, Model model) {
		List<GoodsVO> goodsListPublic= service.goodsListPublic(cri);
		int amount = service.getCategoryAmount(cri);
		PageMaker pm= new PageMaker(amount, cri);
		pm.setCri(cri);

		model.addAttribute("pm", pm);
		model.addAttribute("goodsListPublic", goodsListPublic);
		model.addAttribute("g_brand", cri.getG_brand());
		model.addAttribute("g_category", cri.getG_category());
		return "goods/goodsListPublic";
	}

	// 전체상품 낮은가격순 리스트
	@RequestMapping("/rowPriceGoods")
	public String rowPriceGoodsList(Criteria cri, Model model) {
		List<GoodsVO> rowPriceGoodsList= service.rowPriceGoodsList(cri);
		int amount= service.getAmount(cri);
		PageMaker pm= new PageMaker(amount, cri);
		pm.setCri(cri);
		
		model.addAttribute("rowPriceGoods", rowPriceGoodsList);
		model.addAttribute("pm", pm);
		return "goods/rowPriceGoods";
	}

	 // 높은가격순 리스트
	@RequestMapping("/highPriceGoods") 
	public String newGoodsList(Criteria cri, Model model) { 
		List<GoodsVO> highPriceGoods= service.highPriceGoodsList(cri);
		int amount= service.getAmount(cri); 
		PageMaker pm= new PageMaker(amount, cri);
		pm.setCri(cri);
	  
		model.addAttribute("highPriceGoods", highPriceGoods);
		model.addAttribute("pm", pm);
		return "goods/highPriceGoods";
	}

	// 브랜드에 따른 전체상품 낮은가격리스트
	@RequestMapping("/rowPriceGoodsBrand")
	public String rowPriceBrand(BrandCriteria cri, Model model) {
		List<GoodsVO> rowPriceGoodsListBrand= service.rowPriceGoodsListBrand(cri);
		int amount = service.getBrandAmount(cri);
		PageMaker pm= new PageMaker(amount, cri);
		pm.setCri(cri);

		model.addAttribute("pm", pm);
		model.addAttribute("rowPriceGoodsListBrand", rowPriceGoodsListBrand);
		model.addAttribute("g_brand", cri.getG_brand());
		return "goods/rowPriceGoodsBrand";
	}
	
	// 브랜드에 따른 전체상품 높은가격리스트
	@RequestMapping("/highPriceGoodsBrand")
	public String highPriceBrand(BrandCriteria cri, Model model) {
		List<GoodsVO> highPriceGoodsListBrand= service.highPriceGoodsListBrand(cri);
		int amount = service.getBrandAmount(cri);
		PageMaker pm= new PageMaker(amount, cri);
		pm.setCri(cri);

		model.addAttribute("pm", pm);
		model.addAttribute("highPriceGoodsListBrand", highPriceGoodsListBrand);
		model.addAttribute("g_brand", cri.getG_brand());
		return "goods/highPriceGoodsBrand";
	}

	// 브랜드별 남성 낮은가격 상품리스트
	@RequestMapping("/rowPriceGoodsMan")
	public String rowPriceMan(CategoryCriteria cri, Model model) {
		List<GoodsVO> rowPriceGoodsMan= service.rowPriceGoodsMan(cri);
		int amount = service.getCategoryAmount(cri);
		PageMaker pm= new PageMaker(amount, cri);
		pm.setCri(cri);
		
		model.addAttribute("pm", pm);
		model.addAttribute("rowPriceGoodsMan", rowPriceGoodsMan);
		model.addAttribute("g_brand", cri.getG_brand());
		model.addAttribute("g_category", cri.getG_category());
		return "goods/rowPriceGoodsMan";
	}
	
	// 브랜드별 남성 높은가격 상품리스트
	@RequestMapping("/highPriceGoodsMan")
	public String highPriceMan(CategoryCriteria cri, Model model) {
		List<GoodsVO> highPriceGoodsMan= service.highPriceGoodsMan(cri);
		int amount = service.getCategoryAmount(cri);
		PageMaker pm= new PageMaker(amount, cri);
		pm.setCri(cri);
		
		model.addAttribute("pm", pm);
		model.addAttribute("highPriceGoodsMan", highPriceGoodsMan);
		model.addAttribute("g_brand", cri.getG_brand());
		model.addAttribute("g_category", cri.getG_category());
		return "goods/highPriceGoodsMan";
	}
	
	// 브랜드별 여성 낮은가격 상품리스트
	@RequestMapping("/rowPriceGoodsWoman")
	public String rowPriceWoman(CategoryCriteria cri, Model model) {
		List<GoodsVO> rowPriceGoodsWoman= service.rowPriceGoodsWoman(cri);
		int amount = service.getCategoryAmount(cri);
		PageMaker pm= new PageMaker(amount, cri);
		pm.setCri(cri);
		
		model.addAttribute("pm", pm);
		model.addAttribute("rowPriceGoodsWoman", rowPriceGoodsWoman);
		model.addAttribute("g_brand", cri.getG_brand());
		model.addAttribute("g_category", cri.getG_category());
		return "goods/rowPriceGoodsWoman";
	}
	
	// 브랜드별 여성 높은가격 상품리스트
	@RequestMapping("/highPriceGoodsWoman")
	public String highPriceWoman(CategoryCriteria cri, Model model) {
		List<GoodsVO> highPriceGoodsWoman= service.highPriceGoodsWoman(cri);
		int amount = service.getCategoryAmount(cri);
		PageMaker pm= new PageMaker(amount, cri);
		pm.setCri(cri);
		
		model.addAttribute("pm", pm);
		model.addAttribute("highPriceGoodsWoman", highPriceGoodsWoman);
		model.addAttribute("g_brand", cri.getG_brand());
		model.addAttribute("g_category", cri.getG_category());
		return "goods/highPriceGoodsWoman";
	}
	
	// 브랜드별 공용 낮은가격 상품리스트
	@RequestMapping("/rowPriceGoodsPublic")
	public String rowPricePublic(CategoryCriteria cri, Model model) {
		List<GoodsVO> rowPriceGoodsPublic= service.rowPriceGoodsPublic(cri);
		int amount = service.getCategoryAmount(cri);
		PageMaker pm= new PageMaker(amount, cri);
		pm.setCri(cri);

		model.addAttribute("pm", pm);
		model.addAttribute("rowPriceGoodsPublic", rowPriceGoodsPublic);
		model.addAttribute("g_brand", cri.getG_brand());
		model.addAttribute("g_category", cri.getG_category());
		return "goods/rowPriceGoodsPublic";
	}
	
	// 브랜드별 공용 높은가격 상품리스트
	@RequestMapping("/highPriceGoodsPublic")
	public String highPricePublic(CategoryCriteria cri, Model model) {
		List<GoodsVO> highPriceGoodsPublic= service.highPriceGoodsPublic(cri);
		int amount = service.getCategoryAmount(cri);
		PageMaker pm= new PageMaker(amount, cri);
		pm.setCri(cri);
		
		model.addAttribute("pm", pm);
		model.addAttribute("highPriceGoodsPublic", highPriceGoodsPublic);
		model.addAttribute("g_brand", cri.getG_brand());
		model.addAttribute("g_category", cri.getG_category());
		return "goods/highPriceGoodsPublic";
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
	
	// 판매중인 상품 검색 기능
	@RequestMapping("/goodsSearch")
	public String goodsSearch(SearchCriteria cri, Model model) {
		// 페이징처리 시작
		List<GoodsVO> searchGoodsList = service.search(cri);
		int amount = service.getSearchAmount(cri);
		PageMaker pm = new PageMaker(amount, cri);
		pm.setCri(cri);

		model.addAttribute("searchGoodsList", searchGoodsList);
		model.addAttribute("pm", pm);
		model.addAttribute("keyword", cri.getKeyword());
		model.addAttribute("searchType", cri.getSearchType());
		// 페이징처리 끝
		return "goods/goodsSearch";
	}

	// 검색별 높은가격 상품리스트
	@RequestMapping("/highPriceGoodsSearch")
	public String highPriceGoodsSearch(SearchCriteria cri, Model model) {
		List<GoodsVO> highPriceGoodsSearch= service.highPriceGoodsSearch(cri);
		int amount = service.getCategoryHighPriceAmount(cri);
		PageMaker pm= new PageMaker(amount, cri);
		pm.setCri(cri);
		
		model.addAttribute("pm", pm);
		model.addAttribute("highPriceGoodsSearch", highPriceGoodsSearch);
		model.addAttribute("keyword", cri.getKeyword());
		model.addAttribute("searchType", cri.getSearchType());
		return "goods/highPriceGoodsSearch";
	}
	
	// 검색별 낮은가격 상품리스트
	@RequestMapping("/rowPriceGoodsSearch")
	public String rowPriceGoodsSearch(SearchCriteria cri, Model model) {
		List<GoodsVO> rowPriceGoodsSearch= service.rowPriceGoodsSearch(cri);
		int amount = service.getCategoryRowPriceAmount(cri);
		PageMaker pm= new PageMaker(amount, cri);
		pm.setCri(cri);
		
		model.addAttribute("pm", pm);
		model.addAttribute("rowPriceGoodsSearch", rowPriceGoodsSearch);
		model.addAttribute("keyword", cri.getKeyword());
		model.addAttribute("searchType", cri.getSearchType());
		return "goods/rowPriceGoodsSearch";
	}
	
	// 판매중이지 않은 상품 검색 기능
	@RequestMapping("/goodsSearchNoSelling")
	public String goodsSearchNoSelling(SearchCriteria cri, Model model) {
		// 페이징처리 시작
		List<GoodsVO> searchNoSellGoodsList = service.searchNoSelling(cri);
		int amount = service.getSearchNoSellAmount(cri);
		PageMaker pm = new PageMaker(amount, cri);
		pm.setCri(cri);

		model.addAttribute("searchNoSellGoodsList", searchNoSellGoodsList);
		model.addAttribute("pm", pm);
		model.addAttribute("keyword", cri.getKeyword());
		model.addAttribute("searchType", cri.getSearchType());
		// 페이징처리 끝
		return "goods/goodsSearchNoSelling";
	}
	
	// 판매중이지 않은 상품 검색별 높은가격 상품리스트
	@RequestMapping("/highPriceSearchNoSelling")
	public String highPriceSearchNoSelling(SearchCriteria cri, Model model) {
		List<GoodsVO> highPriceSearchNoSelling= service.highPriceSearchNoSelling(cri);
		int amount = service.getCategoryHighPriceNoSellingAmount(cri);
		PageMaker pm= new PageMaker(amount, cri);
		pm.setCri(cri);
		
		model.addAttribute("pm", pm);
		model.addAttribute("highPriceSearchNoSelling", highPriceSearchNoSelling);
		model.addAttribute("keyword", cri.getKeyword());
		model.addAttribute("searchType", cri.getSearchType());
		return "goods/highPriceSearchNoSelling";
	}
	
	// 판매중이지 않은 상품 검색별 낮은가격 상품리스트
	@RequestMapping("/rowPriceSearchNoSelling")
	public String rowPriceSearchNoSelling(SearchCriteria cri, Model model) {
		List<GoodsVO> rowPriceSearchNoSelling= service.rowPriceSearchNoSelling(cri);
		int amount = service.getCategoryRowPriceNoSellingAmount(cri);
		PageMaker pm= new PageMaker(amount, cri);
		pm.setCri(cri);

		model.addAttribute("pm", pm);
		model.addAttribute("rowPriceSearchNoSelling", rowPriceSearchNoSelling);
		model.addAttribute("keyword", cri.getKeyword());
		model.addAttribute("searchType", cri.getSearchType());
		return "goods/rowPriceSearchNoSelling";
	}
	

	

}
