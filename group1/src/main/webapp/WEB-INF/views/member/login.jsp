<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!-- 06.10 봉찬균 로그인 연계 작업 -->
<!-- 0627 bcg login -->
<form method="POST" id="loginForm" style="margin-top: 30px;"
	action="${cpath}/member/login" accept-charset="utf-8">
	<fieldset>

		<div class="form-group row"
			style="width: 80%; left: 50%; margin: auto; border: 3px solid #FA2781; border-radius: 30px; text-align: left;">
			<div class="form-group" style="width: 80%; margin-left: 16px;">
				<label for="id" class="form-label mt-4">ID</label> <input
					type="text" class="form-control" id="id" placeholder="Input ID"
					name="id">
			</div>


			<div class="form-group" style="width: 80%; margin-left: 16px;">
				<label for="password" class="form-label mt-4">Password</label> <input
					type="password" name="pw" class="form-control" id="password"
					placeholder="Password">
			</div>
			
			<div class="form-group row" style="width: 80%; margin-left: 16px;">
				<div class="col-md-12" style="text-align: left">
					<label class="text-black"> 
						<input name="rememberId" type="checkbox" />
							<span class="text-danger">&nbsp;아이디 기억하기</span>
					</label>
				</div>
			</div>

	    <!-- 06.28 bcg 아이디기억하기 추가 -->						    						 
	    <div class="form-group" style="width: 80%; margin-left: 16px;">
			<p id="loginMsg"></p>
			<button id="login" type="submit" class="btn-EPL btn btn-primary" style="margin-top: 15px;">Login</button>
									
			<div style="margin-left: 20px; display: inline-block; margin-top: 15px; vertical-align: middle; ">
				<label class="text-black"> 
					<input name="rememberId" type="checkbox"  style="display: inline-block;"/>
					<span class="text-danger" style="display: inline-block; color:#3A066B;">&nbsp;아이디 기억하기</span>
				</label>
			</div>
		</div>

			<p></p>

			<div class="form-group" style="display: flex; text-align: center; margin-top: 15px;">
				<div class="google-font" style="margin: 10px 0px 0px 0px; display: inline-block; flex: 1; text-align: center;">
					<a href="${cpath }/member/join" style="color:#3A066B;">회원가입</a>
				</div>
				<div style="margin: 10px 0px 0px 0px; display: inline-block; flex: 1; text-align: center;">
					<a id="search_account" style="color:#3A066B;">아이디/비밀번호 찾기</a>
				</div>
			</div>

		</div>
	</fieldset>

</form>

<%@include file="accountSearchForm.jsp" %>
<script src="${cpath }/resources/js/loginModal.js"></script>

</body>
</html>