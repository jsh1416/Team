
const WARN_CN = 'reborder';

document.getElementById('inputPassword').addEventListener('blur',checkPasswordComplexity);		// 비밀번호 형식 체크 함수 호출
document.getElementById('checkPw').addEventListener('blur',checkPassword);			// 비밀번호 일치 체크 함수 호출



function checkPasswordComplexity(event){
	const regExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,}$/; // 대소문자, 특수문자, 숫자의 조합으로 6자 이상

	const password = document.getElementById('inputPassword');
	const pwmsg = document.getElementById('pwMsg');

	if(regExp.test(password.value) == false){		// 비밀번호 정규식과 입력값이 안맞는 경우
		password.classList.add(WARN_CN);
		pwMsg.innerHTML = '비밀번호는 영문,숫자, 특수문자의 조합으로 6이상으로 설정해주십시오';
		pwMsg.style.color = 'red';
		pwMsg.className = 'error';
		
	}
	else {
		password.classList.remove(WARN_CN);
		
		pwMsg.className = '';
		pwMsg.innerHTML = '사용가능한 비밀번호입니다.';
		pwMsg.style.color = 'blue';
	}
}


function checkPassword(event) {
	const inputPassword = document.getElementById('inputPassword');
	const checkPw = document.getElementById('checkPw');
	const cfpwMsg = document.getElementById('cfpwMsg');

	if(inputPassword.value.length == 0){
		cfpwMsg.innerHTML = '';
		cfpwMsg.className = '';
	}
	else if(inputPassword.value === checkPw.value){
		cfpwMsg.innerHTML = '비밀번호 일치';
		cfpwMsg.style.color = 'blue';
		//event.target.className = '';
		checkPw.classList.remove(WARN_CN);
		cfpwMsg.className = '';
	}
	else{
		document.getElementById('cfpwMsg').innerHTML = '비밀번호가 일치하지 않습니다';
		document.getElementById('cfpwMsg').style.color = 'red';
		//event.target.className = 'reborder';
		checkPw.classList.add(WARN_CN);
		cfpwMsg.className = 'error';
	}
}


function currentPasswordCheck(event){
	const hiddenEmail = document.getElementById('hiddenEmail').value;
	const hiddenName = document.getElementById('hiddenName').value;
	const currentPwMsg = document.getElementById('currentPwMsg');
	const currentPwDiv = document.getElementById('currentPw');
	const changePwConfirm = document.getElementById('changePwConfirm');
	const currentPw = currentPwDiv.value;
	
	const url = cpath + "/member/passwordCheck/" + currentPw + "/" + hiddenEmail + "/" + hiddenName + "/"
	const opt = {
			method: 'GET',
			
	}
	fetch(url, opt).then(resp => resp.text())
	.then(text => {
		if(+text != 0 ){
			swal('비밀번호 일치','변경할 비밀번호를 입력하세요','success')
			changePwConfirm.classList.remove('hide')
		}else{
			swal('비밀번호 불일치','비밀번호를 변경할 수 없습니다','error');
			changePwConfirm.classList.add('hide')
		}
		
	})
}

function chageCheck(){
	let cnt = 0;
	inputs = document.querySelectorAll('input');
	
	for(i=0; i<inputs.length; i++){
		if(inputs[i].className.indexOf(WARN_CN) !== -1 ){	
			cnt++;								
		}
	}
	
	if(cnt != 0) {		
		swal('Input error!','비밀번호를 변경할 수 없습니다.\n 입력 항목을 확인해주세요', 'error')
		return;	
	}
	else{
		changePw();	// 모든 조건 만족 시 joinForm submit
	}
	
	
}

function changePw() {
	const formData = new FormData(document.getElementById('passwordChangeForm'));
	console.log(formData)
	const url = cpath + '/member/changePw' 
	
	const opt = {
		method: 'POST',
		body: formData,
	}
	fetch(url, opt)
	.then(resp => resp.text())
	.then(text => {
		if(+text == 1){
			swal('비밀번호 변경 완료!','','success');
			setTimeout(function reload(){
				location.reload()
			} ,1500);
			
		}else{
			
			swal('비밀번호 변경 실패!','','error');
			setTimeout(function reload(){
				location.reload()
			} ,1500);
			
		}
	})
}

const passwordChangeForm = document.getElementById('passwordChange')
const changePwBtn = document.getElementById('changePwBtn')


changePwBtn.addEventListener("click", e => {
				showPasswordChange();
})


function clear(){
	inputs = document.querySelectorAll('.showInput');
	p = document.querySelectorAll('.changePwP')
	
	for(let i=0; i<inputs.length; i++){
		inputs[i].value="";
		
	}
	
	for(let i =0 ; i<p.length; i++){
		
		p[i].innerHTML = '';
		p[i].innerText = '';
		
	}
}

const numClubDiv = document.getElementById('numClubDiv')

function showPasswordChange(){
	
	clear();
	
	if(passwordChangeForm.classList.contains('hide')){
		passwordChangeForm.classList.remove('hide');
		deleteMemberForm.classList.add('hide');
		numClubDiv.classList.add('hide');
		
	}else{
		passwordChangeForm.classList.add('hide');
		numClubDiv.classList.remove('hide');
		
	}
}








