window.onload = function(){
						document.getElementById('hateBtn').onclick= function(event){   //클릭시 
		 					const url = cpath + '/board/read/boardhate/' + idxBo + '/'
		 					const opt = { 
									method: 'POST',
		 					}
		 					fetch(url, opt) 
							.then(resp=> resp.text())
							.then(text => { 
								if(text=='1') { 
		  							console.log('I hate That! : ' + text)
	  							} else{
	  								console.log('I like that : ' + text)
	  							}
							})
						}
}