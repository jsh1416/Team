function doLike(){
	
			const url = cpath + '/board/read/boardLike/' + idxBo + '/'
			const opt = { 
				method: 'POST',
			}
			fetch(url, opt) 
		.then(resp=> resp.text())
		.then(text => { 
			
			if(+text!=0) { 
					swal('좋아요!','이 글이 좋아요!','success');
					setTimeout(function() {
						location.reload();

						}, 2000);
					console.log('I Like That! : ' + text)
					
				} else{
					swal('에러발생!','이 글 평가를 이미 하셨습니다!','error');
					console.log('I hate that : ' + text)
				}
			
		})
		
		
	}



