//window.onload = function(){
//						document.getElementById('likeBtn').onsubmit= function(event){   //클릭시 
//							event.preventDefault();	
//							
//							
//		 					const url = cpath + '/board/read/boardLike/' + idxBo + '/'
//		 					const opt = { 
//									method: 'POST',
//		 					}
//		 					fetch(url, opt) 
//							.then(resp=> resp.text())
//							.then(text => { 
//								
//								if(text=='1') { 
//									alert("좋아용");
//		  							console.log('I Like That! : ' + text)
//		  							
//	  							} else{
//	  								console.log('I hate that : ' + text)
//	  							}
//								
//							})
//							
//							
//						}
//						
//}


function doLike(){
			
	
			const url = cpath + '/board/read/boardLike/' + idxBo + '/'
			const opt = { 
				method: 'POST',
			}
			fetch(url, opt) 
		.then(resp=> resp.text())
		.then(text => { 
			
			if(+text!=0) { 
					swal('좋아요!','68번 글에 좋아요!','success');
													// error
					console.log('I Like That! : ' + text)
					
				} else{
					console.log('I hate that : ' + text)
				}
			
		})
		
		
	}
