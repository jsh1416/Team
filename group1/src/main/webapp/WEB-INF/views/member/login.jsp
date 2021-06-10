<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!-- 06.10 봉찬균 로그인 연계 작업 -->
<form method="POST" style="margin-top: 30px;">
  <fieldset style="">
    
     <div class="form-group row" style="width: 25%; left: 50%; margin: auto;">
	<div class="form-group">
      <label for="id" class="form-label mt-4">ID</label>
      <input type="text" class="form-control" id="id" placeholder="Input ID" name="id" autofocus>
    </div>
    
    
    <div class="form-group">
      <label for="password" class="form-label mt-4">Password</label>
      <input type="password" name="pw" class="form-control" id="password" placeholder="Password">
    </div>
    
	<button type="submit" class="btn btn-primary" style="margin-top: 15px;">Login</button>
	
	<div class="form-group" style="display: flex;">
		<div style="margin: 10px 0px 0px 0px; display: inline-block; flex: 1; text-align: center;">
			<a href="${cpath }/member/join">회원가입</a>
		</div>
		<div style="margin: 10px 0px 0px 0px; display: inline-block; flex: 1; text-align: center;">
			<a href="${cpath }/member/searchID">아이디 찾기</a>
		</div>
		<div style="margin: 10px 0px 0px 0px; display: inline-block; flex: 1; text-align: center;">
			<a href="${cpath }/member/searchPW">비밀번호 찾기</a>
		</div>
	</div>
	
  	</div>
  </fieldset>
  
</form>

</body>
</html>