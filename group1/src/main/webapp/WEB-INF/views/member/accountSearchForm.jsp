<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="cpath">${pageContext.request.contextPath }</c:set>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    
    
    
 <div class="modal" id="account_search_option">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">아이디 / 비밀번호 찾기</h5>
			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="accountSearchOff()">
				<span aria-hidden="true"></span>
			</button>
      </div>
      <div class="modal-body">
        
        <div class="form-control mt-2">
				<a data-toggle="collapse" href="#id_search" role="search"
					aria-expanded="false" aria-controls="id_search" onclick="showIdForm()">
					<div>아이디 찾기</div>
				</a>
		</div>

			<form id="id_search" class="hide">
				<!-- 아이디 -->
				<div class="form-group row" style="margin: auto;">
					<div class="col-md-12 mt-2">
						<label for="searchForName" class="text-black mb-0 pb-0">이름
							<span class="text-danger">*</span>
						</label> 
							<input id="searchForName" class="form-control" type="text"
								   name="name" placeholder="'이름'을 입력해주세요." required>
					</div>
				</div>
				<!-- 이메일 -->
				<div class="form-group row" style="margin: auto;">
					<div class="col-md-12 mt-2">
						<label for="searchForEmail" class="text-black mb-0 pb-0">이메일 
						<span class="text-danger">*</span>
						</label>
							<input id="searchForEmail" class="form-control" type="email" 
								   name="email" placeholder="'이메일'을 입력해주세요." required>
					</div>
				</div>

				<!-- 인증번호 & 타이머 -->
				<!--  <div id="verifi_code_id"></div>-->

				<!-- Submit -->
				<div class="form-group row" style="margin: auto;">
					<div class="col-lg-12 mt-4 mb-4">
						<input id="id_search_input" type="button" class="btn btn-primary btn-lg btn-block"
							value="찾기" onclick="searchEmail()">
					</div>
				</div>
			</form>


			<!-- 비밀번호 찾기 선택 -->
			<div class="form-control mt-2">
				<a data-toggle="collapse" href="#pw_search" role="search"
					aria-expanded="false" aria-controls="pw_search" onclick="showPwForm()">
					<div>비밀번호 찾기</div>
				</a>
			</div>
			<form id="pw_search" class="hide" method="POST" >
				<!-- 이름 -->
				<div class="form-group row" style="margin: auto;">
					<div class="col-md-12 mt-2">
						<label for="nameForPw" class="text-black mb-0 pb-0">이름<span
							class="text-danger">*</span>
						</label>
							<input id="nameForPw" class="form-control" type="text"
								   name="name" placeholder="'이름'을 입력해주세요." required>
					</div>
				</div>
				
				
				<div class="form-group row" style="margin: auto;">
					<div class="col-md-12 mt-2">
						<label for="idForPw" class="text-black mb-0 pb-0">아이디
							<span class="text-danger">*</span>
						</label> 
						<input id="idForPw" class="form-control" type="text" name="id" 
							   placeholder="아이디를 입력해주세요." required>
					</div>
				</div>
				
				<div class="form-group row" style="margin: auto;">
					<div class="col-md-12 mt-2">
						<label for="emailForPw" class="text-black mb-0 pb-0">이메일<span
							class="text-danger">*</span>
						</label>
							<input id="emailForPw" class="form-control" type="email"
								   name="email" placeholder="'이메일'을 입력해주세요." required>
					</div>
				</div>
				
				<!-- 인증번호 & 타이머 -->
				<!--  <div id="verifi_code_pw"></div>-->
				
				<!-- Submit -->
				<div class="form-group row" style="margin: auto;">
					<div class="col-lg-12 mt-4 mb-4">
						<input id="pw_search_input" type="button" class="btn btn-primary btn-lg btn-block" 
							   value="찾기" onclick="searchPw()">
					</div>
				</div>
			</form>
			
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="accountSearchOff()">Close</button>
      </div>
      
    </div>
  </div>
</div>

<script>


	function showIdForm(){
		const idForm = document.getElementById('id_search');
		if(idForm.className.includes('hide')){
			idForm.classList.replace('hide', 'show');
		}else{
			idForm.classList.replace('show', 'hide');
		}
	}
	
	function showPwForm(){
		const pwForm = document.getElementById('pw_search');
		if(pwForm.className.includes('hide')){
			pwForm.classList.replace('hide', 'show');
		}else{
			pwForm.classList.replace('show', 'hide');
		}
	}
	
	function accountSearchOff(){
		const account_search_option = document.getElementById('account_search_option');
		account_search_option.style.display="none";
	}
	

	window.onclick = function(event) {
		if (event.target == searchModal) {
			searchModal.style.display = "none";
		}
	}
</script>




<script type="text/javascript" src="${cpath }/resources/js/searchId.js"></script>
<script type="text/javascript" src="${cpath }/resources/js/searchPw.js"></script>















