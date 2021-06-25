package com.itbank.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.service.ClubService;

@Controller
public class HomeController {
	
	@Autowired private ClubService clubService;
	
	/* 06.23 bcg clubList */
	@GetMapping({"","/"})
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView("home");
		mav.addObject("clubList", clubService.selectClubList());
				
		return mav;
	}
	
	@GetMapping("0")
	public ModelAndView liv() {
		ModelAndView mav = new ModelAndView("Liverpool");
		mav.addObject("clubList", clubService.selectClubList());
		return mav;
	}
	
	@GetMapping("3")
	public ModelAndView mu() {
		ModelAndView mav = new ModelAndView("ManchesterUnited");
		mav.addObject("clubList", clubService.selectClubList());
		return mav;
	}
	
	@GetMapping("2")
	public ModelAndView mc() {
		ModelAndView mav = new ModelAndView("ManchesterCity");
		mav.addObject("clubList", clubService.selectClubList());
		return mav;
	}
	
	@GetMapping("1")
	public ModelAndView che() {
		ModelAndView mav = new ModelAndView("Chelsea");
		mav.addObject("clubList", clubService.selectClubList());
		return mav;
	}
	
	@GetMapping("4")
	public ModelAndView ars() {
		ModelAndView mav = new ModelAndView("Arsenal");
		mav.addObject("clubList", clubService.selectClubList());
		return mav;
	}
	// 팀 별 jsp 페이지 생성 jsh 06.14
}
