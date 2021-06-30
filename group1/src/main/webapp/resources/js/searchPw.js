//const doSearch = document.getElementById('pw_search_input') 
//
//doSearch.addEventListener("click", e => {
//	searchPw()
//})

const searchPw = () => {	
	const name = document.getElementById('nameForPw').value;
    const id = document.getElementById('idForPw').value;
    const email = document.getElementById('emailForPw').value;
    console.log(name + email);

   	const url = cpath + '/member/helpPw/' + name + '/' + id + '/' + email+"/";
    const opt = {
    		method: 'GET',
    }
    fetch(url, opt).then(resp => resp.text())
	.then(text => {
		if(text != ""){
			swal(name + '님의 임시비멀번호를 ' + email + '로 보내드렸습니다.', '이메일을 확인해주세요', 'success')
		}else{
			swal('입력하신 정보와 일치하는 계정이 없습니다.', '정보를 확인해주세요', 'error');
		}
		
	})
        	
}

