window.onload =function (){
	
	document.getElementById('viewNumber').onclick=function(event){
		const url = cpath + '/board/'+viewCount+'/'
		const opt = {
				method: 'GET',
				
		}
		fetch(url, opt)
		.then(text => { 
			if(text == 1) {	
				selectView();
				console.log("조회수별 출력")
			}
			
		})
	}
}



