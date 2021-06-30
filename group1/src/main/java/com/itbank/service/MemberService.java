package com.itbank.service;


import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.HashMap;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.member.MemberDTO;
import com.itbank.member.MemberDAO;

@Service
public class MemberService {

	@Autowired private MemberDAO memberDAO;
	
	public MemberDTO login(MemberDTO dto) {
		dto.setPw(getHash(dto.getPw()));
		return memberDAO.login(dto);
	}
	
	public int join(MemberDTO dto) {
		dto.setPw(getHash(dto.getPw()));
		return memberDAO.join(dto);
		
	}
	
	public String emailcheck(HttpServletRequest request) {
		try {
			String email = request.getParameter("email");
			String alreadyExist = memberDAO.emailcheck(email);	// 이메일값으로 select하여 반환되는 이메일 있는지 확인
			return alreadyExist != null ? "이미 사용중인 이메일입니다" : "사용 가능한 이메일입니다"; 
		}catch (Exception e){
			e.printStackTrace();
			return "통신 실패 : " + e.getClass().getSimpleName();
		}
		
	}

	public String checkId(HttpServletRequest request) {
		try {
			String id = request.getParameter("id");
			String alreadyExist = memberDAO.checkId(id);	
			return alreadyExist != null ? "이미 사용중인 계정입니다" : "사용 가능한 계정입니다"; 
		}catch (Exception e){
			e.printStackTrace();
			return "통신 실패 : " + e.getClass().getSimpleName();
		}
	}
	
	// id찾기
	public String helpId(MemberDTO member, HttpServletResponse responese) {
		
		if (memberDAO.helpId(member) != null) { 
			return memberDAO.helpId(member);
		} else {
			return "";
		}
		
	}

	
	public String helpPw(MemberDTO member, HttpServletResponse response, String account) throws Exception {
		String email = memberDAO.helpId(member);
		if (email != null) { 
			int row = sendEmail(member, account); // 사용자 email로 임시비밀번호 담긴 이메일 보내기
			return row == 1 ? "success" : "" ;
		} else {
			return "";
		}
	}

	
	// 임시비밀번호 메일로 발송
		private int sendEmail(MemberDTO member, String account) throws AddressException, NoSuchAlgorithmException {
			String ranPw = RandomStringUtils.random(10,33,122,false,false);		// 랜덤 비밀번호 생성
			
			//String password = SecurePassword.getHashValue(email, ranPw);		// 랜덤 비밀번호 암호화
			
			/* 06.18 bcg 임시 비밀번호로 DB pw업데이트*/
			// 0628 비밀번호 해싱처리
			member.setPw(getHash(ranPw));
			
			if(memberDAO.updatePw(member) == 0) {
				return 0; 
			}else {
				String host = "smtp.naver.com";
				final String username = account.split("/")[0];
				final String password = account.split("/")[1];
				int port = 465;
				
				String subject = "EPL Fan Site(EFS) 임시비밀번호 발송";	// 메일 제목
				String body = member.getEmail() + "님 임시비밀번호 : \n" + ranPw;	// 메일 내용
				
				Properties props = new Properties(); // 정보 담기 위한 객체 생성
				// smtp 서버 정보 설정
				props.put("mail.smtp.host", host); 
				props.put("mail.smtp.port", port); 
				props.put("mail.smtp.auth", "true"); 
				props.put("mail.smtp.ssl.enable", "true"); 
				props.put("mail.smtp.ssl.trust", host);
				
				
				Session mailSession = Session.getDefaultInstance(props, new Authenticator() {
					String un = username;
					String pw = password;
					
					@Override
					protected PasswordAuthentication getPasswordAuthentication() {
						
						return new PasswordAuthentication(un, pw);
					}
					
				});
				
				
				try {
					Message mimeMessage = new MimeMessage(mailSession);		
					mimeMessage.setFrom(new InternetAddress(username+"@naver.com"));	// 발신자 셋팅
					mimeMessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse(member.getEmail())); // 수신자 셋팅
					
					mimeMessage.setSubject(subject);	// 제목셋팅
					mimeMessage.setText(body);		// 내용셋팅		
					Transport.send(mimeMessage); 	// javax.mail.Transport.send() 이용, 메일 보내기
				}catch (MessagingException e){
					e.printStackTrace();
				}
			}
			return 1;
				
			}
		public int changePw(MemberDTO member) {
			member.setPw(getHash(member.getPw()));
			return memberDAO.updatePw(member);
		}
		
		public int myBoardCount(MemberDTO login) {
			return memberDAO.myBoardCount(login);		
		}
		
		public int currentPwCheck(MemberDTO member) {
			member.setPw(getHash(member.getPw()));
			return memberDAO.currentPwCheck(member);
		}
			
		// 0628 비밀번호 해싱
		private String getHash(String input) {
			String hash = null;
			
			MessageDigest md;
			try {
				md = MessageDigest.getInstance("SHA-512");
				md.reset();
				md.update(input.getBytes("UTF-8"));
				hash = String.format("%0128x", new BigInteger(1, md.digest()));
				
			} catch (NoSuchAlgorithmException | UnsupportedEncodingException  e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return hash;
		}

		public String checkNickName(HttpServletRequest request) {
			try {
				String nickName = request.getParameter("nickName");
//				System.out.println("nickName : " + nickName);
				String alreadyExist = memberDAO.checkNickName(nickName);	
//				System.out.println("alreadyExist : "+alreadyExist);
				return alreadyExist != null ? "이미 사용중인 닉네임입니다" : "사용 가능한 닉네임입니다"; 
			}catch (Exception e){
				e.printStackTrace();
				return "통신 실패 : " + e.getClass().getSimpleName();
			}
		}

		public int deleteMember(String id) {
			
			int row = memberDAO.deleteMember(id);
			
			return row;
		}

		public MemberDTO exlogin(HashMap<String, String> dto) {
			String pw = dto.get("pw"); 
			dto.put("pw", getHash(pw));
			return memberDAO.exlogin(dto);
		}
	
			
		
}

















