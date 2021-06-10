package com.itbank.service;


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

}
