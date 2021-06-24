window.onload = function(){
						document.getElementById('likeBtn').onclick= function(event){   //클릭시 
							location.reload()
		 					const url = cpath + '/board/read/boardLike/' + idxBo + '/'
		 					const opt = { 
									method: 'POST',
		 					}
		 					fetch(url, opt) 
							.then(resp=> resp.text())
							.then(text => { 
								if(text=='1') { 
									alert("좋아용");
		  							console.log('I Like That! : ' + text)
		  							
	  							} else{
	  								console.log('I hate that : ' + text)
	  							}
								
							})
							
							
						}
						
}