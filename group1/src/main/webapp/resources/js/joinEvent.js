//document.querySelector('input[name="email"]').addEventListener('keyup',checkEmailFormat);	// 이메일 형식 체크 함수 호출
//document.querySelector('input[name="email"]').addEventListener('blur',checkEmail);			// 이메일 중복 체크 함수 호출
document.getElementById('inputPassword').addEventListener('blur',checkPasswordComplexity);		// 비밀번호 형식 체크 함수 호출
document.getElementById('checkPassword').addEventListener('blur',checkPassword);			// 비밀번호 일치 체크 함수 호출
