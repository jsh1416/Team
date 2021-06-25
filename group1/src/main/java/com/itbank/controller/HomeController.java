package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.board.BoardDTO;
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
		List<BoardDTO> list = clubService.selectliv();
		mav.addObject("list",list);
		mav.addObject("clubList", clubService.selectClubList());
		
		return mav;
	}
	
	@GetMapping("3")
	public ModelAndView mu() {
		ModelAndView mav = new ModelAndView("ManchesterUnited");
		List<BoardDTO> list = clubService.selectMu();
		mav.addObject("list",list);
		mav.addObject("clubList", clubService.selectClubList());
		return mav;
	}
	
	@GetMapping("2")
	public ModelAndView mc() {
		ModelAndView mav = new ModelAndView("ManchesterCity");
		List<BoardDTO> list = clubService.selectMc();
		mav.addObject("list",list);
		mav.addObject("clubList", clubService.selectClubList());
		return mav;
	}
	
	@GetMapping("1")
	public ModelAndView che() {
		ModelAndView mav = new ModelAndView("Chelsea");
		List<BoardDTO> list = clubService.selectChelsea();
		mav.addObject("list",list);
		mav.addObject("clubList", clubService.selectClubList());
		return mav;
	}
	
	@GetMapping("4")
	public ModelAndView ars() {
		ModelAndView mav = new ModelAndView("Arsenal");
		List<BoardDTO> list = clubService.selectArsenal();
		mav.addObject("list",list);
		mav.addObject("clubList", clubService.selectClubList());
		return mav;
	}
	// 팀 별 jsp 게시판글만 view생성 06.25 ksj
	// 팀 별 jsp 페이지 생성 jsh 06.14
}
