function deleteBoard(){
							console.log("delete버튼작동")
							if(confirm('게시글을 삭제하시겠습니까?')) {
								location.href = cpath+'/board/delete?idxBo='+idxBo
							}
						}	
