window.onload =function (){
	document.getElementById('likeNumber').onclick=function(event){
		const titleArea = document.querySelectorAll('.titleArea')
		const viewCountArea = document.querySelectorAll('.viewCountArea')
		const likeCountArea = document.querySelectorAll('.likeCountArea')
		
		console.log('click!')
		const url = cpath + '/board/orderByLike/'
		const opt = {
				method: 'GET',
		}
		fetch(url, opt).then(resp => resp.json())
		.then(json => { 
			if(json != null) {
				
				for(let i = 0 ; i < titleArea.length ; i++){
					titleArea[i].innerText = '';
					viewCountArea[i].innerText = '';
					likeCountArea[i].innerText = '';
				}
				
				for(let i = 0 ; i < titleArea.length ; i++){
					titleArea[i].innerText = json[i].title;
					viewCountArea[i].innerText = json[i].viewCount;
					likeCountArea[i].innerText = json[i].likeCount;
				}
				
			
			}
			else {
				console.log("실패")
			}
		})
	}
	
	
	
	document.getElementById('viewNumber').onclick=function(event){
		const titleArea = document.querySelectorAll('.titleArea')
		const viewCountArea = document.querySelectorAll('.viewCountArea')
		const likeCountArea = document.querySelectorAll('.likeCountArea')
		
		console.log('click!')
		const url = cpath + '/board/orderByView/'
		const opt = {
				method: 'GET',
		}
		fetch(url, opt).then(resp => resp.json())
		.then(json => { 
			if(json != null) {
				
				for(let i = 0 ; i < titleArea.length ; i++){
					titleArea[i].innerText = '';
					viewCountArea[i].innerText = '';
					likeCountArea[i].innerText = '';
				}
				
				for(let i = 0 ; i < titleArea.length ; i++){
					titleArea[i].innerText = json[i].title;
					viewCountArea[i].innerText = json[i].viewCount;
					likeCountArea[i].innerText = json[i].likeCount;
				}
				
			
			}
			else {
				console.log("실패")
			}
		})
	}
	
	document.getElementById('newNumber').onclick=function(event){
		const titleArea = document.querySelectorAll('.titleArea')
		const viewCountArea = document.querySelectorAll('.viewCountArea')
		const likeCountArea = document.querySelectorAll('.likeCountArea')
		
//		console.log("클릭클릭")
		
		const url = cpath + '/board/orderByNew/'
		const opt = {
				method: 'GET',
		}
		fetch(url, opt).then(resp => resp.json())
		.then(json => { 
			if(json != null) {
				console.log(json)
				for(let i = 0 ; i < titleArea.length ; i++){
					titleArea[i].innerText = '';
					viewCountArea[i].innerText = '';
					likeCountArea[i].innerText = '';
				}
				
				for(let i = 0 ; i < titleArea.length ; i++){
					titleArea[i].innerText = json[i].title;
					viewCountArea[i].innerText = json[i].viewCount;
					likeCountArea[i].innerText = json[i].likeCount;
				}
			
			}
			else {
				console.log("실패")
			}
			
			
		})
	}
}


