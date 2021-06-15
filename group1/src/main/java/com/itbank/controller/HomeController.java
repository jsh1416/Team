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
	
	@GetMapping("liv")
	public String liv() {
		return "liv";
	}
	
	@GetMapping("mu")
	public String mu() {
		return "mu";
	}
	
	@GetMapping("mc")
	public String mc() {
		return "mc";
	}
	
	@GetMapping("che")
	public String che() {
		return "che";
	}
	
	@GetMapping("ars")
	public String ars() {
		return "ars";
	}
	// 팀 별 jsp 페이지 생성 jsh 06.14
}
