package com.itbank.controller;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	public ModelAndView liv(@RequestParam(required = false) String param) {
		ModelAndView mav = new ModelAndView(liv);
		List<BoardDTO> list = clubService.selectliv();
		mav.addObject("list",list);
		mav.addObject("clubList", clubService.selectClubList());
		
		String clubName = liv;
		mav.addObject("clubName", clubName);	// jsh 0701
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
		
		if(param!=null) {
			switch (param) {
			
			case "newOrder":list=clubService.selectNew(clubName);
				mav.addObject("list",list);
			    return mav;
			case "likeOrder":list=clubService.selectlike(clubName);
				mav.addObject("list",list);
			    return mav;   
			case "viewOrder":list=clubService.selectview(clubName);
				mav.addObject("list",list);
			    return mav;       
			}
		}
		return mav;
	}
	
	@GetMapping("3")
	public ModelAndView mu(@RequestParam(required = false) String param) {
		ModelAndView mav = new ModelAndView("ManchesterUnited");
		List<BoardDTO> list = clubService.selectMu();
		mav.addObject("list",list);
		mav.addObject("clubList", clubService.selectClubList());
		
		String clubName = mu;
		mav.addObject("clubName", clubName);	// jsh 0701
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
		if(param!=null) {
			switch (param) {
			
			case "newOrder":list=clubService.selectNew(clubName);
				mav.addObject("list",list);
			    return mav;
			case "likeOrder":list=clubService.selectlike(clubName);
				mav.addObject("list",list);
			    return mav;   
			case "viewOrder":list=clubService.selectview(clubName);
				mav.addObject("list",list);
			    return mav;       
			}
		}
		return mav;
	}
	
	@GetMapping("2")
	public ModelAndView mc(@RequestParam(required = false) String param) {
		ModelAndView mav = new ModelAndView("ManchesterCity");
		List<BoardDTO> list = clubService.selectMc();
		mav.addObject("list",list);
		mav.addObject("clubList", clubService.selectClubList());
		
		String clubName = "Manchester City";
		mav.addObject("clubName", clubName);	// jsh 0701
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
		
				if(param!=null) {
					switch (param) {
					
					case "newOrder":list=clubService.selectNew(clubName);
						mav.addObject("list",list);
					    return mav;
					case "likeOrder":list=clubService.selectlike(clubName);
						mav.addObject("list",list);
					    return mav;   
					case "viewOrder":list=clubService.selectview(clubName);
						mav.addObject("list",list);
					    return mav;       
					}
				}
		return mav;
	}
	
	@GetMapping("1")
	public ModelAndView che(@RequestParam(required = false) String param) {
		ModelAndView mav = new ModelAndView(ch);
		List<BoardDTO> list = clubService.selectChelsea();
		mav.addObject("list",list);
		mav.addObject("clubList", clubService.selectClubList());
		
		String clubName = ch;
		mav.addObject("clubName", clubName);	// jsh 0701
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
		if(param!=null) {
			switch (param) {
			
			case "newOrder":list=clubService.selectNew(clubName);
				mav.addObject("list",list);
			    return mav;
			case "likeOrder":list=clubService.selectlike(clubName);
				mav.addObject("list",list);
			    return mav;   
			case "viewOrder":list=clubService.selectview(clubName);
				mav.addObject("list",list);
			    return mav;       
			}
		}
		return mav;
	}
	
	@GetMapping("4")
	public ModelAndView ars(@RequestParam(required = false) String param) {
		ModelAndView mav = new ModelAndView(ar);
		List<BoardDTO> list = clubService.selectArsenal();
		mav.addObject("list",list);
		mav.addObject("clubList", clubService.selectClubList());
		mav.addObject("clubColor",clubService.selectColor(ar));
		
		
		String clubName = ar;
		mav.addObject("clubName", clubName);	// jsh 0701
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
		
		System.out.println("param======="+param);
		if(param!=null) {
			switch (param) {
			
			case "newOrder":list=clubService.selectNew(clubName);
				mav.addObject("list",list);
			    return mav;
			case "likeOrder":list=clubService.selectlike(clubName);
				mav.addObject("list",list);
			    return mav;   
			case "viewOrder":list=clubService.selectview(clubName);
				mav.addObject("list",list);
			    return mav;       
			}
		}
		return mav;
	}
	
	
	// 0630 ????????? ??????
	@GetMapping("5")
	public ModelAndView spurs(@RequestParam(required = false) String param) {
		ModelAndView mav = new ModelAndView(tt);
		List<BoardDTO> list = clubService.selectTottenham();
		mav.addObject("list",list);
		mav.addObject("clubList", clubService.selectClubList());
		mav.addObject("clubColor",clubService.selectColor(tt));
		
		
		String clubName = tt;
		mav.addObject("clubName", clubName);	// jsh 0701
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
		
		if(param!=null) {
			switch (param) {
			
			case "newOrder":list=clubService.selectNew(clubName);
				mav.addObject("list",list);
			    return mav;
			case "likeOrder":list=clubService.selectlike(clubName);
				mav.addObject("list",list);
			    return mav;   
			case "viewOrder":list=clubService.selectview(clubName);
				mav.addObject("list",list);
			    return mav;       
			}
		}
		return mav;
	}
	// ??? ??? jsp ??????????????? view?????? 06.25 ksj
	// ??? ??? jsp ????????? ?????? jsh 06.14
}
