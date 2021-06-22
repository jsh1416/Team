window.onload =function (){
	document.getElementById('newNumber').onclick=function(event){
		console.log("새로운 넘버")
		const url = cpath + '/board/'+idxBo+'/'
		const opt = {
				method: 'GET',
		}
		fetch(url, opt)
		.then(text => { 
			
		})
	}
}






