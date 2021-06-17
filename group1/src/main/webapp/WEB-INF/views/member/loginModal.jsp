<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="modal" id="modal">
			  <div class="modal-dialog" style="max-width: 800px;" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title">로그인</h5>
			        <button type="button" class="btn-close close-area" data-bs-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true"></span>
			        </button>
			      </div>
			      <div class="modal-body">
			       
			        <form method="POST" id="loginForm" style="margin-top: 30px;" action="${cpath}/member/login">
						  <fieldset>
						    
						     <div class="form-group row" style="width: 80%; left: 50%; margin: auto; border: 3px solid #FA2781; border-radius: 30px; text-align: left;">
							<div class="form-group" style="width: 80%; margin-left: 16px;">
						      <label for="id" class="form-label mt-4">ID</label>
						      <input type="text" class="form-control" id="id" placeholder="Input ID" name="id" autofocus>
						    </div>
						    
						    
						    <div class="form-group" style="width: 80%; margin-left: 16px;">
						      <label for="password" class="form-label mt-4">Password</label>
						      <input type="password" name="pw" class="form-control" id="password" placeholder="Password">
						    </div>
						    
						    <div class="form-group" style="width: 80%; margin-left: 16px;">
						    	<p id="loginMsg"></p>
								<button id="login" type="submit" class="btn-EPL btn btn-primary" style="margin-top: 15px;">Login</button>
							</div>
							
							<p></p>
							
							<div class="form-group" style="display: flex; text-align: center; margin-top: 15px;">
								<div class="google-font" style="margin: 10px 0px 0px 0px; display: inline-block; flex: 1; text-align: center;">
									<a href="${cpath }/member/join">회원가입</a>
								</div>
								<div class="google-font" style="margin: 10px 0px 0px 0px; display: inline-block; flex: 1; text-align: center;">
									<a id="search_account">아이디 찾기</a>
								</div>
								<div class="google-font" style="margin: 10px 0px 0px 0px; display: inline-block; flex: 1; text-align: center;">
									<a id="" href="${cpath }/member/searchPW">비밀번호 찾기</a>
								</div>
							</div>
							
						  	</div>
						  </fieldset>
						  
						</form>
			        
			        
			        
			      </div>

			    </div>
			  </div>
			</div>
			
<%@include file="accountSearchForm.jsp" %>
<script src="${cpath }/resources/js/loginModal.js"></script>