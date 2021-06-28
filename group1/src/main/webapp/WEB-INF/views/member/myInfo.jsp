<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ include file="../header.jsp" %>


<main style="width: 1377px; margin: auto; margin-top: 75px; padding: 30px 20px 0px;">
	<div class="container" style="width: 975px; height: 700px; margin: auto;">
		<div class="head" 
			style="width: 100%;height: 200px; vertical-align: middle; padding-top: 25px; display: flex;">
		    
		    <div class="imgSection" style="width: 150px; height: 150px; flex-flow: 1">
		    	<img src="${cpath }/resources/images/logo/${login.club}_big.png" style="width: 150px; height: 150px; ">
		    </div>
		    
		    <div class="infoSection" style="width: 615px; height: 150px; display: inline-block;
		    	flex-flow: 1; margin-left: 30px; text-align: center;" >
		    	
		    	<div class="firstLineInfo" style="width:70%; height: 30px; margin-bottom: 20px; margin-left: 219.5px; text-align: left;">
		    		<div style="display: inline-block; margin-right: 40px;">
		    			<h2>${login.nickName }</h2>
		    		</div>
		    		
		    		<div style="display: inline-block;">
		    			${login.name }
		    		</div> 
		    	</div>
		    	
		    	<div class="secondLineInfo" style="width:70%; height: 30px; margin-bottom: 20px; margin-left: 219.5px; text-align: left;">
		    		<div style="display: inline-block; margin-right: 40px;">
		    			<span style="font-size: 14px;">
		    				게시글 수
		    			</span> 
		    			<!-- 06.28 bcg 내 글 목록 -->
		    			<span style="font-size: 14px; font-weight: bold;">
		    				<a href="${cpath }/board/mylist/${login.nickName }" style="color: #3A066B;"> ${myBoardCount }</a>
		    			</span>
		    		</div>
		    		
		    		<div style="display: inline-block;">
		    			
		    		</div> 
		    	</div>
		    	
		    	<div class="thirdLineInfo" style="width:70%; height: 30px; margin-bottom: 20px; margin-left: 219.5px; text-align: left;">
		    		<div style="display: inline-block; margin-right: 40px;">
		    			<span>ID : <b>${login.id }</b></span>
		    		</div>
		    		
		    		<div style="display: inline-block;">
		    			<span>E-mail : <b>${login.email}</b></span>
		    		</div> 
		    	</div>
		    	
		    	
		    </div>
		    
		    
		</div>
		<div style="margin-top: 15px;">
			<button type="button" id="changePwBtn" class="btn btn-success">비밀번호 변경</button>
			<button type="button" id="deleteMemberBtn" class="btn btn-danger">회원 탈퇴</button>
		</div>
		
		<div id="passwordChange" class="hide">
			<form method="POST" id="passwordChangeForm" style="margin-top: 30px;" accept-charset="utf-8">
				<input type="hidden" name="email" value="${login.email }" id="hiddenEmail">
				<input type="hidden" name="name" value="${login.name }" id="hiddenName">
						  <fieldset>
						     <div class="form-group row" style="width: 80%; left: 50%; margin: auto; /*border: 3px solid #FA2781;*/ border-radius: 30px; text-align: left;">
								<div class="form-group" style="width: 80%; margin-left: 16px;">
							      <label for="currentPw" class="form-label mt-4">현재 비밀번호</label>
							      <input type="password" class="form-control showInput" id="currentPw" placeholder="Input current PW" name="currentPw" >
							      
							      <button type="button" class="btn-EPL btn btn-primary" onclick="currentPasswordCheck()">현재 비밀번호 확인</button>
							      
							    </div>
						    
							    <div class="form-group" style="width: 80%; margin-left: 16px;">
							      <label for="inputPassword" class="form-label mt-4">변경할 비밀번호</label>
							      <input type="password" name="pw" class="form-control showInput" id="inputPassword" placeholder="Password">
							      <p id="pwMsg" class="changePwP"></p>
							    </div>
							    
							    <div class="form-group" style="width: 80%; margin-left: 16px;">
							      <label for="checkPw" class="form-label mt-4">비밀번호 확인</label>
							      <input type="password" name="checkPw" class="form-control showInput" id="checkPw" placeholder="Confirm Password">
							      <p id="cfpwMsg" class="changePwP"></p>
							    </div>
							    
							    <div class="form-group" style="width: 80%; margin-left: 16px;">
									<button type="button" id="changePwConfirm" class="btn-EPL btn btn-primary hide" style="margin-top: 15px;" onclick="chageCheck()">비밀번호 변경</button>
								</div>
						  	</div>
						  </fieldset>
						</form>
		</div>		
		
		
		<!-- 0628 bcg 탈퇴폼 -->
		<div id="deleteMember" class="hide">
			<form method="POST" id="deleteMemberForm" style="margin-top: 30px;" accept-charset="utf-8">
						  <fieldset>
						     <div class="form-group row" style="width: 80%; left: 50%; margin: auto; /*border: 3px solid #FA2781;*/ border-radius: 30px; text-align: left;">
								<div class="form-group" style="width: 80%; margin-left: 16px;">
							      <label for="deleteId" class="form-label mt-4">ID</label>
							      <input type="text" class="form-control showInput" id="deleteId" placeholder="Input ID" name="id" >
							    </div>
						    
							    <div class="form-group" style="width: 80%; margin-left: 16px;">
							      <label for="deletePassword" class="form-label mt-4">비밀번호</label>
							      <input type="password" name="pw" class="form-control showInput" id="deletePassword" placeholder="Password">
							    </div>
							    
							    
							    <div class="form-group" style="width: 80%; margin-left: 16px;">
									<button type="button" id="deleteConfirm" class="btn-EPL btn btn-primary hide" style="margin-top: 15px;" onclick="deleteMember()">회원탈퇴</button>
								</div>
						  	</div>
						  </fieldset>
						</form>
		</div>		
	
	</div>
</main>



</body>
<script src="${cpath }/resources/js/member/passwordChange.js" ></script>
<script src="${cpath }/resources/js/member/deleteMember.js" ></script>


</html>



























