package com.itbank.controller;


import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.itbank.service.ApiService;

//jsh 0621 네이버 검색 api 컨트롤러
@RestController
@RequestMapping("/api")
public class ApiController {
	
	@Autowired private ApiService as;
	private ObjectMapper mapper = new ObjectMapper();
	
	@GetMapping(value="/{team}/{type}", produces="application/json; charset=utf-8")
	public String newsList(@PathVariable String team, @PathVariable String type) throws IOException {
		String news = as.getNews(team, type); 		
		String json = mapper.writeValueAsString(news);
		System.out.println(json);
		return json; // json 변환 x
		
	}
	
}
