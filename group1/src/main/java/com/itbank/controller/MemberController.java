package com.itbank.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.member.MemberDTO;
import com.itbank.service.MemberService;

//06.09 bong 

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired private MemberService memberSerivce;

	@GetMapping("/login")
	public String login() {
		return "/member/login";
	}
	
	@PostMapping("/login")
	public ModelAndView login(MemberDTO dto, HttpSession session) {
		ModelAndView mav = new ModelAndView("redirect:/");
		MemberDTO login = memberSerivce.login(dto);
		if(login!=null) {
			session.setAttribute("login", login);
			session.setMaxInactiveInterval(900);
			
		}else {
			mav.setViewName("msg");
			mav.addObject("msg", "로그인 실패...");
		}
		
		return mav;
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		/* 06.11 봉찬균 로그아웃 방식 수정 */
		session.removeAttribute("login");
		return "redirect:/";
	}
	
	@GetMapping("/join")
	public String join() {
		return "/member/join";
	}
	
	@PostMapping("/join")
	public ModelAndView join(MemberDTO dto) {
		ModelAndView mav = new ModelAndView("msg");
		int row = memberSerivce.join(dto);
		if(row == 1) {
			mav.addObject("msg", "join success");
			mav.addObject("url", "redirect:/member/login");
		}
		else {
			mav.addObject("msg", "join failed");
			mav.addObject("url", "redirect:/");
		}
		return mav;
	}
	
	@RequestMapping(value="checkEmail/", produces="application/text;charset=utf8")
	@ResponseBody
	public String checkEmail(HttpServletRequest request) {
		return memberSerivce.emailcheck(request);
	}
	
	@RequestMapping(value="checkId/", produces="application/text;charset=utf8")
	@ResponseBody
	public String checkId(HttpServletRequest request) {
		return memberSerivce.checkId(request);
	}
	
}
