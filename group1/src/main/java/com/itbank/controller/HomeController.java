package com.itbank.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	
	@GetMapping({"","/"})
	public String home() {return "home";}
	
	@GetMapping("/test")
	public void test() {}
	
	// 봉찬균 인코딩 수정 테스트
	// 06-08 bcg 14:42
	
}
