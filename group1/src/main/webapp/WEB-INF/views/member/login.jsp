<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!-- 인터셉터 로그인 페이지  jsh 06.25 -->
	<div style="margin-top: 20%; text-align: center;">
	<form method="POST" id="loginForm" style="width: 65%; margin: auto;" action="${cpath}/member/login" accept-charset="utf-8">
						  <fieldset>
						     <div class="form-group row" style="width: 80%; left: 50%; margin: auto; border: 3px solid #FA2781; border-radius: 30px; text-align: left;">
							<div class="form-group" style="width: 80%; margin-left: 16px;">
						      <label for="id" class="form-label mt-4">ID</label>
						      
								<c:choose>
									<c:when test="${cookie.idCookie.value eq ''}">
										<input type="text" class="form-control" id="id" placeholder="Input ID" name="id" >
									</c:when>
									<c:when test="${cookie.idCookie.value != ''}">
										<input type="text" class="form-control" id="id" placeholder="Input ID" name="id" value="${cookie.idCookie.value }">
									</c:when>
								</c:choose>
								
						    </div>
						    
						    
						    <div class="form-group" style="width: 80%; margin-left: 16px;">
						      <label for="password" class="form-label mt-4">Password</label>
						      <input type="password" name="pw" class="form-control" id="password" placeholder="Password">
						    </div>
						    
							<!-- 06.28 bcg 아이디기억하기 추가 -->						    						    
						    <div class="form-group" style="width: 80%; margin-left: 16px;">
						    	<p id="loginMsg"></p>
								<button id="login" type="submit" class="btn-EPL btn btn-primary" style="margin-top: 15px;">Login</button>
								
								<div style="margin-left: 20px; display: inline-block; margin-top: 15px; vertical-align: middle; float: right;
									padding-top: 10px;">
									<label class=".google-font"> 
											<input id="rememberIdjsp" name="rememberId" type="checkbox"  style="display: inline-block;"/>
											<span class="google-font" style="display: inline-block; color:#3A066B;">&nbsp;아이디 기억하기</span>
									</label>
								</div>
							</div>
							
							<p></p>
							
							<div class="form-group" style="display: flex; text-align: center; margin-top: 15px;">
								<div style="margin: 10px 0px 0px 0px; display: inline-block; flex: 1; text-align: center;">
									<a href="${cpath }/member/join" style="color:#3A066B;">회원가입</a>
								</div>
								<div style="margin: 10px 0px 0px 0px; display: inline-block; flex: 1; text-align: center;">
									<a id="search_account" style="color:#3A066B;">아이디/비밀번호 찾기</a>
								</div>
							</div>
							
						  	</div>
						  </fieldset>
						  
						</form>
	</div>
<%@include file="accountSearchForm.jsp" %>
<script src="${cpath }/resources/js/loginModal.js"></script>
<script>
const rememberIdjsp = document.getElementById('rememberIdjsp');

if(!getCookie('idCookie')){
	// 비어있을때
	rememberIdjsp.checked = false;
}else{
	rememberIdjsp.checked = true;
}
</script>
</body>
</html>