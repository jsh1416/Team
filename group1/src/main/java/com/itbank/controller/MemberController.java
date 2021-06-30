package com.itbank.controller;


import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Scanner;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.itbank.club.ClubDTO;
import com.itbank.member.MemberDTO;
import com.itbank.service.ClubService;
import com.itbank.service.MemberService;

//06.09 bong 

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired private MemberService memberSerivce;
	@Autowired private ClubService clubService;
	private ObjectMapper mapper = new ObjectMapper();

	// 0629 bcg login
		@GetMapping("/login")
		public ModelAndView login() {
			ModelAndView mav = new ModelAndView("/member/login");
			List<ClubDTO> clubList = clubService.selectClubList();
			mav.addObject("clubList", clubList);
			return mav;
		}
		
		
	// ajax 방식 결합 로그인 06.14 bcg
		@PostMapping("/login")
		@ResponseBody
		public String login(MemberDTO dto, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JsonProcessingException {
			MemberDTO login = memberSerivce.login(dto);
//			System.out.println("login: "+login);
			if(login!=null) {
				session.setAttribute("login", login);
				session.setMaxInactiveInterval(900);
				
				Cookie idCookie = new Cookie("idCookie", login.getId());
//				System.out.println("rememberID : " + request.getParameter("rememberId"));
				if("on".equals(request.getParameter("rememberId"))) {	// 이메일 기억하기 체크 되어있을 때 이메일 쿠키 생성
					idCookie.setMaxAge(60 * 60 * 24 * 7);		// cookie 유효시간 7일
					idCookie.setPath("/");		//				// 모든 경로에서 쿠키 유효
				}else {
					idCookie = new Cookie("idCookie", null);					// 이메일 쿠키가 이미 생성 되어있을 경우 쿠키 삭제
					idCookie.setMaxAge(0); 										// 쿠키 유호시간 0으로 세팅
					idCookie.setPath("/");
				}
				response.addCookie(idCookie);
				
			}
			String json = mapper.writeValueAsString(login);
			return json;
		}
	
		@PostMapping(value="/exlogin", consumes = "application/json; charset=utf-8",
				produces="application/text; charset=utf-8")
		@ResponseBody
		public String exlogin(@RequestBody HashMap<String, String> dto, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws JsonProcessingException {
			
			
			MemberDTO login = memberSerivce.exlogin(dto);
			
			
			if(login!=null) {
				session.setAttribute("login", login);
				session.setMaxInactiveInterval(900);
				
				Cookie idCookie = new Cookie("idCookie", login.getId());
				if("on".equals(request.getParameter("rememberId"))) {	// 이메일 기억하기 체크 되어있을 때 이메일 쿠키 생성
					idCookie.setMaxAge(60 * 60 * 24 * 7);		// cookie 유효시간 7일
					idCookie.setPath("/");		//				// 모든 경로에서 쿠키 유효
				}else {
					idCookie = new Cookie("idCookie", null);					// 이메일 쿠키가 이미 생성 되어있을 경우 쿠키 삭제
					idCookie.setMaxAge(0); 										// 쿠키 유호시간 0으로 세팅
					idCookie.setPath("/");
				}
				response.addCookie(idCookie);
			
				
			}
			
			return login != null ? "1" : "0";
		}
		
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		/* 06.11 봉찬균 로그아웃 방식 수정 */
		session.removeAttribute("login");
		return "redirect:/";
	}
	
	@GetMapping("/join")
	public ModelAndView join(HttpServletRequest request) throws UnsupportedEncodingException {
		ModelAndView mav = new ModelAndView("/member/join");
		request.setCharacterEncoding("UTF-8");
		mav.addObject("clubList", clubService.selectClubList());
		return mav;
	}
	
	@PostMapping("/join")
	public ModelAndView join(MemberDTO dto, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("msg");
		int row = memberSerivce.join(dto);
		// 06.29 bcg
		
		mav.addObject("row", row);

		if(row == 1) {
			mav.addObject("url", request.getContextPath()+"/member/login");
			return mav;
		}
		else {
			mav.addObject("msg", "join failed");
		}
		return mav;
	}
	
	// 회원가입시 이메일 형식, 이미 있는 이메일인지 체크
	@RequestMapping(value="/checkEmail", produces="application/text;charset=utf8")
	@ResponseBody
	public String checkEmail(HttpServletRequest request) {
		return memberSerivce.emailcheck(request);
	}
	
	// 회원가입시 이미 있는 ID인지 체크
	@RequestMapping(value="/checkId", produces="application/text;charset=utf8")
	@ResponseBody
	public String checkId(HttpServletRequest request) {
		return memberSerivce.checkId(request);
	}
	
	
	// 이름과 이메일을 통한 id찾기
	@RequestMapping(value="/helpId/{name}/{email:.+}")
	@ResponseBody
	public String helpId(HttpServletResponse responese, @PathVariable("name") String name, @PathVariable("email") String email) throws IOException {
		MemberDTO member = new MemberDTO();
//		System.out.println("name : " + name);
		
		member.setName(name);
		member.setEmail(email);
		return memberSerivce.helpId(member, responese);
	}
	
	// 아이디와 이메일을 통한 임시 비밀번호 발급
	@GetMapping(value="/helpPw/{name}/{id}/{email}/")
	@ResponseBody
	public String helpPw(HttpSession session, HttpServletResponse response, @PathVariable("name")String name, @PathVariable("id")String id, @PathVariable("email")String email) throws Exception {
		
		System.out.println("help PW!");
		
		String filePath = session.getServletContext().getRealPath("/WEB-INF/data/mailAccount.dat");
		File f = new File(filePath);
		if(f.exists()==false) {
			return "";
		}
		Scanner sc = new Scanner(f);
		String account = null;
		while(sc.hasNextLine()) {
			account = sc.nextLine();
		}
		sc.close();
		
		MemberDTO member = new MemberDTO();
		member.setId(id);
		member.setName(name);
		member.setEmail(email);
		
		System.out.println("memberInfo : " + member.getId() + " / " + member.getName() + " / " + member.getEmail());
		
		return memberSerivce.helpPw(member,response, account);
		
	}
	
	// 06.18 myInfo
	@GetMapping("/myInfo")
	public ModelAndView myInfo(HttpSession session) {
		ModelAndView mav = new ModelAndView("/member/myInfo");
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		mav.addObject("clubList", clubService.selectClubList());
		mav.addObject("myBoardCount", memberSerivce.myBoardCount(login));
		
		// 0630 bcg
		int totalNum = clubService.selectTotalMember();
		double livNum = (clubService.selectLivMemberNum() * 1.0) / totalNum * 100;
		double muNum = (clubService.selectMuMemberNum() * 1.0) / totalNum * 100;
		double mcNum = (clubService.selectMcMemberNum() * 1.0) / totalNum * 100;
		double cheNum = (clubService.selectCheMemberNum() * 1.0) / totalNum * 100;
		double ttoNum =  (clubService.selectTtoMemberNum() * 1.0) / totalNum * 100;
		double arsNum = (clubService.selectArsMemberNum() * 1.0) / totalNum * 100;
		
		mav.addObject("livNum", livNum);
		mav.addObject("muNum", muNum);
		mav.addObject("mcNum", mcNum);
		mav.addObject("cheNum", cheNum);
		mav.addObject("ttoNum", ttoNum);
		mav.addObject("arsNum", arsNum);
		
		return mav;
	}
	
	// 06.21 bcg 비밀번호 변경
	// /EPL/member/changePw
	@PostMapping(value="/changePw")
	@ResponseBody
	public String changePw(String name, String pw, String email) {
		MemberDTO member = new MemberDTO();
		
//		System.out.println("name : " + name);
//		System.out.println("pw : " + pw);
//		System.out.println("email : " + email);
		
		member.setName(name);
		member.setEmail(email);
		member.setPw(pw);
		int row =memberSerivce.changePw(member);
		return row+"";
	}
	
	
	//06.25 bcg 현재 비밀번호 확인
	@GetMapping(value="/passwordCheck/{currentPw}/{hiddenEmail}/{hiddenName}")
	@ResponseBody
	public String currentPwCheck(@PathVariable("currentPw") String currentPw, @PathVariable("hiddenEmail") String email, @PathVariable("hiddenName") String name) {
		MemberDTO member =  new MemberDTO();
//		System.out.println("currentPw : " + currentPw);
		member.setName(name);
		member.setEmail(email);
		member.setPw(currentPw);
		int row = memberSerivce.currentPwCheck(member); 
//		System.out.println("current Check : " + row);
		return ""+row;
	}
	
	// 06.28 bcg 닉네임 체크
	@PostMapping(value="/checkNickName/", produces="application/text;charset=utf8")
	@ResponseBody
	public String checkNickName(HttpServletRequest request) {
		return memberSerivce.checkNickName(request);
	}
	
	@PostMapping("/deleteMember")
	@ResponseBody
	public String deleteMember(MemberDTO dto, HttpSession session){
		int row = memberSerivce.deleteMember(dto.getId());
		System.out.println("row : " + row);
		if(row!=0) {
			
			session.removeAttribute("login");
		}
		return ""+row;
	}
	
	
}
























