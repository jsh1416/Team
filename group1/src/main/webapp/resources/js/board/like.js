
document.getElementById('likeBtn').addEventListener('click',doLike);

function doLike(){
	
			const url = cpath + '/board/read/boardLike/' + idxBo + '/'
			const opt = { 
				method: 'POST',
			}
			fetch(url, opt) 
		.then(resp=> resp.text())
		.then(text => { 
			
			if(+text!=0) { 
					swal('좋아요!',idxBo,'번 글에 좋아요!','success');
													// error
					console.log('I Like That! : ' + text)
					
				} else{
					swal('싫어요!','68번 글에 좋아요 실패!','error');
					console.log('I hate that : ' + text)
				}
			
		})
		
		
	}

