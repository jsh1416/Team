package com.itbank.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	
	@GetMapping({"","/"})
	public String home() {return "home";}
	
	@GetMapping("/test")
	public void test() {}
	
	// ��Ʈ�ѷ� ���� �׽�Ʈ 
	// 06-08 bcg 14:42
	
}
