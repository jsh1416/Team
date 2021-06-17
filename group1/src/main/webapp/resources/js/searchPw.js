const searchPw = () => {	
	const name = document.getElementById('nameForPw').value;
    const id = document.getElementById('idForPw').value;
    const email = document.getElementById('emailForPw').value;
    console.log(name + email);

   	axios.get(cpath + '/helpPw/' + name + '/' + id + '/' + email)
    	.then((response) => {
    		
    		if(response.data === ''){
    	
    			alert('입력하신 정보와 일치하는 계정이 없습니다. ');
    	
    		}else{
    			alert(name + '님의 임시비멀번호를 ' + email + '로 보내드렸습니다.');
                //location.href = cpath + '/loginForm/';
    		}
    		
    	});    	
}

