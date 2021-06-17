package com.itbank.service;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

// 비밀번호 해쉬값 암호화하는 클래스
public class SecurePassword {
		public static String getHashValue(String email, String password) throws NoSuchAlgorithmException {
			
			String salt = new String(Base64.getEncoder().encode(email.getBytes()));
			
			MessageDigest mdHash = MessageDigest.getInstance("SHA-256");
			mdHash.update(salt.getBytes());
			mdHash.update(password.getBytes());
			String hash = String.format("%064x", new BigInteger(1, mdHash.digest()));
			
			return hash;
		}
}
