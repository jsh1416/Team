
/*6.11 Bong -- className을 통쨰로 바꾸면 형식이 깨지므로 classList활용*/
const WARN_CN = 'reborder';


//이메일의 keyup event 발생시 이메일 형식 체크 함수 실행 
function checkEmailFormat(event){	
	console.log('checkEmail');
	const email = document.getElementById('inputEmail');	// joinForm의 이메일 받아오기
	emailMsg = document.getElementById('emailMsg');	
	

	const regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;	// 이메일 형식
	if(regExp.test(email.value) == false){
		emailMsg.innerText = '잘못된 이메일 형식입니다';
		emailMsg.style.color = 'red';
		//event.target.className = 'reborder';
		//email.className = 'reborder';
		email.classList.add(WARN_CN);
		return false;
	}else{
		
		email.classList.remove(WARN_CN);
		
		return true;
	}
}

//이메일의 blur event 발생 시 이메일 중복 체크 함수 실행
function checkEmail(event){		
	const email = document.getElementById('inputEmail');
	emailMsg = document.getElementById('emailMsg'); 
	const request = new XMLHttpRequest();
	request.open('POST', cpath + '/member/checkEmail/');
	request.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	request.send("email=" + email.value);
	request.onreadystatechange = function() {
		if(checkEmailFormat() === false)		// 이메일 형식이 맞는지 체크
			return;		
		else {				// 이메일 형식 맞을 경우 밑의 코드 실행
			if(request.readyState == 4 && request.status == 200){
				if(request.responseText === '이미 사용중인 이메일입니다'){
					emailMsg.innerHTML = request.responseText;
					emailMsg.style.color = 'red';
					email.classList.add(WARN_CN);
					
				}
				else{
					emailMsg.innerHTML = request.responseText;
					email.classList.remove(WARN_CN);
					emailMsg.style.color = 'blue';
				}
			}
		}
	}
}


// id 중복 확인
function checkId(event){		
	const id = document.getElementById('inputId');
	idMsg = document.getElementById('idMsg'); 
	const request = new XMLHttpRequest();
	request.open('POST', cpath + '/member/checkId/');
	request.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	request.send("id=" + id.value);
	request.onreadystatechange = function() {
		
	if(request.readyState == 4 && request.status == 200){
		if(request.responseText === '이미 사용중인 계정입니다'){
			idMsg.innerHTML = request.responseText;
			idMsg.style.color = 'red';
			id.classList.add(WARN_CN);
			//event.target.className = 'reborder';
//			alert(request.responseText);
			id.focus();
			
		}
		else{
//			alert(request.responseText);
			idMsg.innerHTML = request.responseText;
			id.classList.remove(WARN_CN);
			idMsg.style.color = 'blue';
		}
			
		}
	}
}



// 비밀번호 정규식 체크
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
		//event.target.className = '';
		password.classList.remove(WARN_CN);
		
		pwMsg.className = '';
		pwMsg.innerHTML = '사용가능한 비밀번호입니다.';
		pwMsg.style.color = 'blue';
	}
}

function mccheckPasswordComplexity(event){
	const regExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,}$/; // 대소문자, 특수문자, 숫자의 조합으로 6자 이상
	
	const password = document.getElementById('password');
	const pwmsg = document.getElementById('pwmsg');
	
	console.log('=============' + password.value.length);
	if(password.length == 0){
		pwmsg.className = '';
		pwmsg.innerHTML = '';
	}
	else if(regExp.test(password) == false){		// 비밀번호 정규식과 입력값이 안맞는 경우
		console.log('=============' + password.value);
		pwmsg.innerHTML = '비밀번호는 영문,숫자, 특수문자의 조합으로 6이상';
		pwmsg.style.color = 'red';
		pwmsg.className = 'error';
	}
	else {
		pwmsg.className = '';
		pwmsg.innerHTML = '비밀번호 사용 가능';
		pwmsg.style.color = 'blue';
	}
}

// 비밀번호, 비밀번호 확인 값 비교
function checkPassword(event) {
	const inputPassword = document.getElementById('inputPassword');
	const checkPassword = document.getElementById('checkPassword');
	const cfpwMsg = document.getElementById('cfpwMsg');

	if(inputPassword.value.length == 0){
		cfpwMsg.innerHTML = '';
		cfpwMsg.className = '';
	}
	else if(inputPassword.value === checkPassword.value){
		cfpwMsg.innerHTML = '비밀번호 일치';
		cfpwMsg.style.color = 'blue';
		//event.target.className = '';
		checkPassword.classList.remove(WARN_CN);
		cfpwMsg.className = '';
	}
	else{
		document.getElementById('cfpwMsg').innerHTML = '비밀번호가 일치하지 않습니다';
		document.getElementById('cfpwMsg').style.color = 'red';
		//event.target.className = 'reborder';
		checkPassword.classList.add(WARN_CN);
		cfpwMsg.className = 'error';
	}
}


// 회원가입
function join(){
	inputs = document.querySelectorAll('input');
	//termsChks = document.querySelectorAll('.termCheck');
//	console.log(inputs.length);
	cnt = 0;
	
//	for(i=0 ; i<termsChks.length ; i++){
//		if(!termsChks[i].checked)	{		// 필수항목이 체크가 안되어있을시
//			cnt++;							
//
//		}
//	}
	
	console.log("cnt : " + cnt);
	
	for(i=0; i<inputs.length; i++){
		if(inputs[i].className.indexOf(WARN_CN) !== -1 ){	// input의 기본 클래스이름 = 없음, 입력조건에 안맞을 시 클래스이름 = reborder
			cnt++;								// input 클래스이름이 reborder인 것 카운트 
		}
	}
//	console.log(cnt);
	
	if(cnt != 0) {		// cnt가 0이 아닐 경우 reborder클래스가 있는 경우로 보고 submit 안되게 한다
		alert('필수항목을 입력해 주세요	');
		return;	
	}
	else{
		//console.log("submit!");
		document.getElementById('joinForm').submit();	// 모든 조건 만족 시 joinForm submit
	}
}



// 이용약관 모두 체크
//function checkAll(){
//	checks = document.getElementsByName('check');
//	console.log(checks.length);
//	if(document.getElementById('checkAll').checked){	// 모두체크 체크 시 
//		for(i=0; i<checks.length; i++){
//			checks[i].checked = true;		// 약관 모두 체크
//		}
//	}else{
//		for(i=0; i<checks.length; i++){
//			checks[i].checked = false;		// 모두체크 해제시 체크된 모든 항목 체크 해제
//		}
//	}
//}


