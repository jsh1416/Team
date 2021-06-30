package com.itbank.controller;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.board.BoardDTO;
import com.itbank.club.ClubDTO;
import com.itbank.service.ClubService;

@Controller
public class HomeController {
	
@Autowired private ClubService clubService;

//0629 bcg
	 private final static String liv = "Liverpool";
	 private final static String mu = "Manchester United";
	 private final static String mc = "Manchester City";
	 private final static String ar = "Arsenal";
	 private final static String ch = "Chelsea";
	 private final static String tt = "Tottenham";
	
	/* 06.23 bcg clubList */
	@GetMapping({"","/"})
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView("home");
		mav.addObject("clubList", clubService.selectClubList());
				
		return mav;
	}
	
	@GetMapping("0")
	public ModelAndView liv() {
		ModelAndView mav = new ModelAndView(liv);
		List<BoardDTO> list = clubService.selectliv();
		mav.addObject("list",list);
		mav.addObject("clubList", clubService.selectClubList());
		
		String clubName = liv;
		ClubDTO selectedClub = clubService.selectColor(clubName);
		mav.addObject("clubColor", selectedClub.getClubColor());
		
		// 0629 bcg
		List<String> clubNameList =  clubService.selectClubNameList();
		mav.addObject("clubNameList", clubNameList);
				
		Calendar cal = Calendar.getInstance();
		int year = cal.get(cal.YEAR); 
		String[] seasonArr = new String[5];
				
				
		for(int i = 0 ; i < seasonArr.length ; i++) {
			seasonArr[i] =  Integer.toString(year-(5-i))  + "/" +  Integer.toString(year-(4-i));
					
			mav.addObject("point"+i, clubService.selectWinPoint(seasonArr[i]));
				
		}
				
		mav.addObject("seasonArr", seasonArr);
		// 0629 bcg end
		
		return mav;
	}
	
	@GetMapping("3")
	public ModelAndView mu() {
		ModelAndView mav = new ModelAndView("ManchesterUnited");
		List<BoardDTO> list = clubService.selectMu();
		mav.addObject("list",list);
		mav.addObject("clubList", clubService.selectClubList());
		
		String clubName = mu;
		ClubDTO selectedClub = clubService.selectColor(clubName);
		mav.addObject("clubColor", selectedClub.getClubColor());
		
		// 0629 bcg
		List<String> clubNameList =  clubService.selectClubNameList();
		mav.addObject("clubNameList", clubNameList);
						
		Calendar cal = Calendar.getInstance();
		int year = cal.get(cal.YEAR); 
		String[] seasonArr = new String[5];
						
						
		for(int i = 0 ; i < seasonArr.length ; i++) {
			seasonArr[i] =  Integer.toString(year-(5-i))  + "/" +  Integer.toString(year-(4-i));
							
			mav.addObject("point"+i, clubService.selectWinPoint(seasonArr[i]));
						
		}
						
		mav.addObject("seasonArr", seasonArr);
		// 0629 bcg end
				
		return mav;
	}
	
	@GetMapping("2")
	public ModelAndView mc() {
		ModelAndView mav = new ModelAndView("ManchesterCity");
		List<BoardDTO> list = clubService.selectMc();
		mav.addObject("list",list);
		mav.addObject("clubList", clubService.selectClubList());
		
		String clubName = "Manchester City";
		ClubDTO selectedClub = clubService.selectColor(clubName);
		mav.addObject("clubColor", selectedClub.getClubColor());
		
		// 0629 bcg
				List<String> clubNameList =  clubService.selectClubNameList();
				mav.addObject("clubNameList", clubNameList);
						
				Calendar cal = Calendar.getInstance();
				int year = cal.get(cal.YEAR); 
				String[] seasonArr = new String[5];
						
						
				for(int i = 0 ; i < seasonArr.length ; i++) {
					seasonArr[i] =  Integer.toString(year-(5-i))  + "/" +  Integer.toString(year-(4-i));
							
					mav.addObject("point"+i, clubService.selectWinPoint(seasonArr[i]));
						
				}
						
				mav.addObject("seasonArr", seasonArr);
				// 0629 bcg end
				
				
		return mav;
	}
	
	@GetMapping("1")
	public ModelAndView che() {
		ModelAndView mav = new ModelAndView(ch);
		List<BoardDTO> list = clubService.selectChelsea();
		mav.addObject("list",list);
		mav.addObject("clubList", clubService.selectClubList());
		
		String clubName = ch;
		ClubDTO selectedClub = clubService.selectColor(clubName);
		mav.addObject("clubColor", selectedClub.getClubColor());
		
		// 0629 bcg
		List<String> clubNameList =  clubService.selectClubNameList();
		mav.addObject("clubNameList", clubNameList);
						
		Calendar cal = Calendar.getInstance();
		int year = cal.get(cal.YEAR); 
		String[] seasonArr = new String[5];
						
						
		for(int i = 0 ; i < seasonArr.length ; i++) {
			seasonArr[i] =  Integer.toString(year-(5-i))  + "/" +  Integer.toString(year-(4-i));
							
			mav.addObject("point"+i, clubService.selectWinPoint(seasonArr[i]));
						
		}
						
		mav.addObject("seasonArr", seasonArr);
		// 0629 bcg end
		
		return mav;
	}
	
	@GetMapping("4")
	public ModelAndView ars() {
		ModelAndView mav = new ModelAndView(ar);
		List<BoardDTO> list = clubService.selectArsenal();
		mav.addObject("list",list);
		mav.addObject("clubList", clubService.selectClubList());
		mav.addObject("clubColor",clubService.selectColor(ar));
		
		
		String clubName = ar;
		ClubDTO selectedClub = clubService.selectColor(clubName);
		mav.addObject("clubColor", selectedClub.getClubColor());

		// 0629 bcg
		List<String> clubNameList =  clubService.selectClubNameList();
		mav.addObject("clubNameList", clubNameList);
						
		Calendar cal = Calendar.getInstance();
		int year = cal.get(cal.YEAR); 
		String[] seasonArr = new String[5];
						
						
		for(int i = 0 ; i < seasonArr.length ; i++) {
			seasonArr[i] =  Integer.toString(year-(5-i))  + "/" +  Integer.toString(year-(4-i));
							
			mav.addObject("point"+i, clubService.selectWinPoint(seasonArr[i]));
						
		}
						
		mav.addObject("seasonArr", seasonArr);
		// 0629 bcg end
		
		return mav;
	}
	
	
	// 0630 토트넘 추가
	@GetMapping("5")
	public ModelAndView spurs() {
		ModelAndView mav = new ModelAndView(tt);
		List<BoardDTO> list = clubService.selectTottenham();
		mav.addObject("list",list);
		mav.addObject("clubList", clubService.selectClubList());
		mav.addObject("clubColor",clubService.selectColor(tt));
		
		
		String clubName = tt;
		ClubDTO selectedClub = clubService.selectColor(clubName);
		mav.addObject("clubColor", selectedClub.getClubColor());

		// 0629 bcg
		List<String> clubNameList =  clubService.selectClubNameList();
		mav.addObject("clubNameList", clubNameList);
						
		Calendar cal = Calendar.getInstance();
		int year = cal.get(cal.YEAR); 
		String[] seasonArr = new String[5];
						
						
		for(int i = 0 ; i < seasonArr.length ; i++) {
			seasonArr[i] =  Integer.toString(year-(5-i))  + "/" +  Integer.toString(year-(4-i));
							
			mav.addObject("point"+i, clubService.selectWinPoint(seasonArr[i]));
						
		}
						
		mav.addObject("seasonArr", seasonArr);
		// 0629 bcg end
		
		return mav;
	}
	// 팀 별 jsp 게시판글만 view생성 06.25 ksj
	// 팀 별 jsp 페이지 생성 jsh 06.14
}
