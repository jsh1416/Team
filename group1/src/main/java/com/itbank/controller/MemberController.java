package com.itbank.controller;


import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.itbank.member.MemberDTO;
import com.itbank.service.MemberService;

//06.09 bong 

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired private MemberService memberSerivce;
	private ObjectMapper mapper = new ObjectMapper();

	
	// ajax 방식 결합 로그인 06.14 bcg
		@PostMapping("/login")
		@ResponseBody
		public String login(MemberDTO dto, HttpSession session) throws JsonProcessingException {
			MemberDTO login = memberSerivce.login(dto);
			System.out.println("login: "+login);
			if(login!=null) {
				session.setAttribute("login", login);
				session.setMaxInactiveInterval(900);
			}
			String json = mapper.writeValueAsString(login);
			System.out.println(json);
			return json;
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
		@RequestMapping(value="helpId/{name}/{email:.+}")
		@ResponseBody
		public String helpId(HttpServletResponse responese, @PathVariable("name") String name, @PathVariable("email") String email) throws IOException {
			MemberDTO member = new MemberDTO();
			member.setName(name);
			member.setEmail(email);
			return memberSerivce.helpId(member, responese);
		}
		
	// 아이디와 이메일을 통한 임시 비밀번호 발급
	@RequestMapping(value="helpPw/{name}/{id}/{email:.+}")
	@ResponseBody
	public String helpPw(HttpServletResponse response, @PathVariable("name")String name, @PathVariable("id")String id, @PathVariable("email")String email) throws Exception {
		MemberDTO member = new MemberDTO();
		member.setId(id);
		member.setName(name);
		member.setEmail(email);
			
		return memberSerivce.helpPw(member,response);
		
	}
	
	
}
























