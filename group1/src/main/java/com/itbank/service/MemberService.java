package com.itbank.service;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.member.MemberDTO;
import com.itbank.member.MemberDAO;

@Service
public class MemberService {

	@Autowired private MemberDAO memberDAO;
	
	public MemberDTO login(MemberDTO dto) {
		
		return memberDAO.login(dto);
	}
	public int join(MemberDTO dto) {
		return memberDAO.join(dto);
		
	}
	
	public String emailcheck(HttpServletRequest request) {
		try {
			String email = request.getParameter("email");
			String alreadyExist = memberDAO.emailcheck(email);	// 이메일값으로 select하여 반환되는 이메일 있는지 확인
			return alreadyExist != null ? "이미 사용중인 이메일입니다" : "사용 가능한 이메일입니다"; 
		}catch (Exception e){
			return "통신 실패 : " + e.getClass().getSimpleName();
		}
		
	}

	public String checkId(HttpServletRequest request) {
		try {
			String id = request.getParameter("id");
			String alreadyExist = memberDAO.checkId(id);	
			return alreadyExist != null ? "이미 사용중인 계정입니다" : "사용 가능한 계정입니다"; 
		}catch (Exception e){
			return "통신 실패 : " + e.getClass().getSimpleName();
		}
	}

}
