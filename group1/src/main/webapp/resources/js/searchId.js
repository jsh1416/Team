const searchEmail = () => {	
    const name = document.getElementById('searchForName').value;
    const email = document.getElementById('searchForEmail').value;

    console.log('input email : ' + email)
    	
   	axios.get(cpath + '/member/helpId/' + name + '/' + email)
    	.then((response) => {
    		if(response.data === ''){
    			swal('해당하는 아이디를\n찾을 수 없습니다.', '이름 혹은 이메일을 확인해주세요','error')
    		}else{
    			swal(name + '님의 아이디는 ' + response.data + '입니다.','','success')
    		}
    	});    	
    }

