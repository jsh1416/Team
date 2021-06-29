document.getElementById('hateBtn').addEventListener('click',dohate);

function dohate(){
	
	const url = cpath + '/board/read/boardHate/' + idxBo + '/'
	const opt = { 
		method: 'POST',
	}
	fetch(url, opt) 
.then(resp=> resp.text())
.then(text => { 
	
	if(+text!=0) { 
			swal('싫어요!',idxBo,'번 글에 싫어요!','success');
											// error
			console.log('I hate That! : ' + text)
			
		} else{
			swal('에러!','에러발생!','error');
			console.log('I Like That! : ' + text)
		}
	
})


}
