<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>


<head>
	<%@ include file="../header.jsp" %>
	<style type="text/css">
		input.reborder { border: 1px solid red }		/* 입력조건에 따라 테두리 색 바꾸는 클래스  / submit 할 시 사용됨 */
	</style>
	
	<!-- 06.11 봉찬균  회원가입 axios 처리 관련을 위한 scripts -->
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

	<script type="text/javascript" src="${cpath }/resources/js/joinFunction.js"></script>
		
</head>


<!-- 06.10 봉찬균 join 작업 -->
<!-- 06.25 bcg form 수정 -->
<div style="margin: auto; width: 70%; margin-top: 95px; border: 3px solid #FA2781; border-radius: 30px; padding: 30px 30px 30px 30px;">
<form method="POST" id="joinForm" accept-charset="utf-8">
  <fieldset>
    <legend>회원가입</legend>
    
    <div class="form-group">
      <label for="inputName" class="form-label mt-4">Name</label>
      <input type="text" class="form-control" id="inputName" placeholder="Input your name" name="name" autofocus required style="width: 50%;">
    </div>
    
    <div class="form-group">
      <label for="inputID" class="form-label mt-4">ID</label>
      <div>
      	<input type="text" class="form-control" id="inputId" placeholder="inputID" name="id" required style="width: 50%;">
      	<p class="google-font checkmsg" id="idMsg"></p>
      </div>
	  <button type="button" class="btn-EPL btn btn-primary google-font" onclick="checkId()">아이디 중복확인</button>
    </div>
    
    <div class="form-group">
      <label for="inputNickName" class="form-label mt-4">Nick Name</label>
      <input type="text" class="form-control" id="inputNickName" placeholder="Input nick-name" name="nickName" required style="width: 50%;">
      <p class="google-font checkmsg" id="nickNameMsg"></p>
    </div>
    
    
    <div class="form-group">
      <label for="inputEmail" class="form-label mt-4">Email address</label>
      <input type="email" class="form-control" id="inputEmail" 
       	aria-describedby="emailHelp" placeholder="Enter email" name="email" required style="width: 50%;">
      <p class="google-font checkmsg" id="emailMsg"></p>
      <button type="button" class="btn-EPL btn btn-primary google-font" onclick="checkEmail()">이메일 확인</button>
    </div>
    
    <div class="form-group">
      <label for="inputPassword" class="form-label mt-4">Password</label>
      <input type="password" name="pw" class="form-control" id="inputPassword" placeholder="Password" required style="width: 50%;">
      <p id="pwMsg"></p>
    </div>
    
    <div class="form-group">
      <label for="checkPassword" class="form-label mt-4">Check Password</label>
      <input type="password" class="form-control" id="checkPassword" placeholder="Check Password" required style="width: 50%;">
      <p id="cfpwMsg"></p>
    </div>
    
    <div class="form-group">
      <label for="selectClub" class="form-label mt-4" >Team</label>
<!--       club in ('Liverpool','Manchester United','Manchester City','Arsenal','Chelsea') -->
      <select class="form-select" id="selectClub" name="club" required style="width: 50%;">
        <c:forEach items="${clubList }" var="clubList">
        	<option value="${clubList.clubName }">${clubList.clubName }</option>
        </c:forEach>
      </select>
    </div>
    
    

    <button type="button" class="btn-EPL btn btn-primary" onclick="join()">Join</button>
  </fieldset>
</form>
</div>

<script type="text/javascript" src="${cpath }/resources/js/joinEvent.js"></script>

</body>
</html>