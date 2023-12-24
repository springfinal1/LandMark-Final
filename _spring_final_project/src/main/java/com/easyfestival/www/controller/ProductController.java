package com.easyfestival.www.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.easyfestival.www.domain.FavoriteVO;
import com.easyfestival.www.domain.ProductBoardVO;
import com.easyfestival.www.domain.ProductDTO;
import com.easyfestival.www.domain.ProductFileVO;
import com.easyfestival.www.domain.ProductListDTO;
import com.easyfestival.www.handler.FileHandler;
import com.easyfestival.www.security.UserVO;
import com.easyfestival.www.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/product")
public class ProductController {

	@Inject
	private ProductService psv;
	
	@Inject
	private FileHandler fh;
	
	
	
	
	@GetMapping("register")
	public String register() {
		return "/product/register";
	}
	
	@PostMapping("register")
	public String productRegister(ProductBoardVO pbvo, @RequestParam(name="files",required = false)MultipartFile[] files) {
		log.info(pbvo+"pbvo <<<<<!!");
		
		List<ProductFileVO> pflist = null;
		if(files[0].getSize() > 0) {
			pflist = fh.uploadFile(files);
		}
		
		
		int isOk = psv.register(new ProductDTO(pbvo, pflist));

		return "index";
	}
	
	
	@GetMapping("list")
	public String list(Model m,@RequestParam("pkContinent") String pkContinent, HttpSession ses, RedirectAttributes re){

		//List<ProductListDTO> pdto = psv.productList(pkContinent);
		int type = 2;
		if(pkContinent.equals("동북아")||pkContinent.equals("동남아")||pkContinent.equals("유럽")||pkContinent.equals("아메리카")) {
			type = 1;
		}
		
		m.addAttribute("type", type);
		
		List<ProductListDTO> pldto = psv.getdto(pkContinent);
		
		UserVO uvo = (UserVO)ses.getAttribute("uvo");
		
		if(uvo != null) {
			List<FavoriteVO> faList = psv.getFaList(uvo.getId());	
		
			m.addAttribute("faList", faList);
		}
				
		
		if(pldto.size() > 0) {
			m.addAttribute("pldto", pldto);
		}
		
		
		return "/product/list";
	}
	
	@GetMapping("detail")
	public String detail(Model m , @RequestParam("pkNo") long pkNo) {
		List<ProductListDTO> pldto = psv.getdtoDetail(pkNo);
		log.info(pldto+"pldto");
		
		m.addAttribute("pldto", pldto.get(0));
		return "/product/detail";
	}
	@RequestMapping(value = "peopleVal", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Map<String,String>> peopleCount(@RequestParam("peopleCount")String peopleCount, Model model){
		Map<String,String> result = new HashMap<>();
		result.put("result", peopleCount);
		log.info("인원수 >>>>>>>>>>> {} ", result);
		model.addAttribute("result",result);
		return ResponseEntity.ok(result);
	}

	@GetMapping("reservation")
	public String reservation(@RequestParam("pkNo")long pkNo , Model m) {
		List<ProductListDTO> pldto = psv.getdtoDetail(pkNo);
		log.info(pldto+"pldto");
		
		m.addAttribute("pldto", pldto.get(0));
		
		
		return "/product/reservation";
	}
	
	@GetMapping("modify")
	public String modify(@RequestParam("pkNo") long pkNo , Model m) {
		
		List<ProductListDTO> pldto = psv.getdtoDetail(pkNo);
		log.info(pldto+"pldto");
		
		m.addAttribute("pldto", pldto.get(0));
		
		
		return "/product/modify";
	}
	
	@PostMapping("modify")
	public String postModify(ProductBoardVO pbvo, @RequestParam(name="files",required = false)MultipartFile[] files, RedirectAttributes a) {
		
		String continent = pbvo.getPkContinent();
		
		log.info(pbvo + "pbvo<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
		List<ProductFileVO> pflist = null;
		if(files[0].getSize() > 0) {
			pflist = fh.uploadFile(files);
		}
		pbvo.setPkPrice(pbvo.getApPrice()+pbvo.getFvPrice()+pbvo.getHtPrice());
		pbvo.setPkContinent(pbvo.getPlContinent());
		
		int isOk = psv.modify(new ProductDTO(pbvo, pflist));
		
		
		return "index";
	}
	@GetMapping("remove")
	public String remove(@RequestParam("pkNo") long pkNo) {
		
		int isOk = psv.removeProduct(pkNo);
		
		return "index";
	}
	@GetMapping(value="favorite/{idVal}/{pkNo}")
	public ResponseEntity<String> heart(@PathVariable String idVal , @PathVariable long pkNo){
		log.info(idVal+"체크 아이디");
		log.info(pkNo+"체크 pkNO");
		// 관심상품 등록
		FavoriteVO favo = new FavoriteVO();
		favo.setId(idVal);
		favo.setPkNo(pkNo);
		
		//int isOK =psv.addFavorite(favo);
		int isOk = psv.addFavorite(idVal,pkNo);
		
		
		return new ResponseEntity<String>("1",HttpStatus.OK);
	}
	
	@GetMapping(value = "checkRed", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<FavoriteVO>> checkRed(HttpSession ses){
		UserVO uvo = (UserVO)ses.getAttribute("uvo");
		
		if(uvo != null) {
			List<FavoriteVO> faList = psv.getFaList(uvo.getId());
			
			return new ResponseEntity<List<FavoriteVO>>(faList,HttpStatus.OK);
		}
		
		return null;
	}
	
	@DeleteMapping(value="favoriteRemove/{pkNo}/{idVal}")
	public ResponseEntity<String> removeRed(@PathVariable long pkNo,@PathVariable String idVal){
		log.info(pkNo+"pkno>>>>");
		log.info(idVal+"idVal>>>>");	
		int isOk = psv.removeFavoriteRemove(pkNo,idVal);
		
			
		
		
		return new ResponseEntity<String>("1",HttpStatus.OK);
	}
	

	
}
