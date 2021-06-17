const searchEmail = () => {	
    const name = document.getElementById('searchForName').value;
    const email = document.getElementById('searchForEmail').value;
    console.log(name);

   	axios.get(cpath + '/helpId/' + name + '/' + email)
    	.then((response) => {
    	
    		if(response.data === ''){
    	
    			alert('해당하는 아이디를 찾을 수 없습니다. ');
    	
    		}else{
    			alert(name + '님의 아이디는 ' + response.data + '입니다.');
                //location.href = cpath + '/loginForm/';
    		}
    		
    		
    		
    	});    	
    }

