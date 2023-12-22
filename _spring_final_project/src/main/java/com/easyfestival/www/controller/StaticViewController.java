package com.easyfestival.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/static/**")
public class StaticViewController {
	
	@GetMapping("list")
	public  String getStaticView(@RequestParam("num")String num) {
		return "/recommendation/list"+num;
	}
}
