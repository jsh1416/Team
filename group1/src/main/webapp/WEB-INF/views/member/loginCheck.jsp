<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!-- 인터셉터 로그인 페이지  jsh 06.25 -->

<form method="POST" style="margin-top: 30px;">
  <fieldset>
    
     <div class="form-group row" style="width: 30%; left: 50%; margin: auto; border: 3px solid #FA2781; border-radius: 30px;">
	<div class="form-group" style="width: 80%; margin-left: 16px;">
      <label for="id" class="form-label mt-4">ID</label>
      <input type="text" class="form-control" id="id" placeholder="Input ID" name="id" autofocus>
    </div>
    
    
    <div class="form-group" style="width: 80%; margin-left: 16px;">
      <label for="password" class="form-label mt-4">Password</label>
      <input type="password" name="pw" class="form-control" id="password" placeholder="Password">
    </div>
    
    <div class="form-group" style="width: 80%; margin-left: 16px;">
		<button type="submit" class="btn-EPL btn btn-primary " style="margin-top: 15px;">Login</button>
	</div>
	
	<div class="form-group" style="display: flex; text-align: center; margin-top: 15px;">
		<div class="google-font" style="margin: 10px 0px 0px 0px; display: inline-block; flex: 1; text-align: center;">
			<a href="${cpath }/member/join">회원가입</a>
		</div>
		<div class="google-font" style="margin: 10px 0px 0px 0px; display: inline-block; flex: 1; text-align: center;">
			<a href="${cpath }/member/searchID">아이디 찾기</a>
		</div>
		<div class="google-font" style="margin: 10px 0px 0px 0px; display: inline-block; flex: 1; text-align: center;">
			<a href="${cpath }/member/searchPW">비밀번호 찾기</a>
		</div>
	</div>
	
  	</div>
  </fieldset>
  
</form>

</body>
</html>