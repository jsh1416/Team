const searchPw = () => {	
	const name = document.getElementById('nameForPw').value;
    const id = document.getElementById('idForPw').value;
    const email = document.getElementById('emailForPw').value;
    console.log(name + email);

   	axios.get(cpath + '/member/helpPw/' + name + '/' + id + '/' + email)
    	.then((response) => {
    		
    		if(response.data === ''){
    			swal('입력하신 정보와 일치하는\n계정이 없습니다.', '정보를 확인해주세요', 'error');
    	
    		}else{
    			swal(name + '님의 임시비멀번호를 ' + email + '로 보내드렸습니다.', '이메일을 확인해주세요', 'success')
    		}
    		
    	});    	
}

