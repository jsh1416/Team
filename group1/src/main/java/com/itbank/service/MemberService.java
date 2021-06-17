package com.itbank.service;


import java.security.NoSuchAlgorithmException;
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
	
	// id찾기
	public String helpId(MemberDTO member, HttpServletResponse responese) {
		
		if (memberDAO.helpId(member) != null) { 
			return memberDAO.helpId(member);
		} else {
			return "";
		}
		
	}

	
	public String helpPw(MemberDTO member, HttpServletResponse response) throws Exception {
		String email = memberDAO.helpId(member);
		if (email != null) { 
			sendEmail(member); // 사용자 email로 임시비밀번호 담긴 이메일 보내기
			return "loginForm.jsp";
		} else {
//	         sendEmail("trustnloveu@gmail.com");
			return "";
		}
	}

	
	// 임시비밀번호 메일로 발송
		private void sendEmail(MemberDTO member) throws AddressException, NoSuchAlgorithmException {
			String ranPw = RandomStringUtils.random(10,33,122,false,false);		// 랜덤 비밀번호 생성
			
			//String password = SecurePassword.getHashValue(email, ranPw);		// 랜덤 비밀번호 암호화
			
			memberDAO.updatePw(member);				// 임시비밀번호 값으로 수정
			
			String host = "smtp.gmail.com";
			String sender = "EFS";	// 보내는 이메일 계정
			String spw = "@gmail.com";
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

			Session session = Session.getDefaultInstance(props, new Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(sender, spw);
				}
			});
			
			try {
			Message mimeMessage = new MimeMessage(session);		
			mimeMessage.setFrom(new InternetAddress(sender));	// 발신자 셋팅
			mimeMessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse(member.getEmail())); // 수신자 셋팅
			
			mimeMessage.setSubject(subject);	// 제목셋팅
			mimeMessage.setText(body);		// 내용셋팅		
			Transport.send(mimeMessage); 	// javax.mail.Transport.send() 이용, 메일 보내기
			}catch (MessagingException e){
				e.printStackTrace();
			}
		}
}

















