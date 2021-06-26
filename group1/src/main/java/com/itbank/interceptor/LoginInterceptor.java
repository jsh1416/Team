package com.itbank.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	// jsh 06.25
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String requestURL = request.getRequestURL().toString();
		HttpSession session = request.getSession();
		if (session.getAttribute("login") == null) {
			
			// 원래 페이지 저장해놨다가 로그인 성공하면 페이지 이동
			response.sendRedirect(request.getContextPath() + "/member/loginCheck?url=" + requestURL);
			return false;
		}
		return true;
	}
}
