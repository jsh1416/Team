const deleteMemberForm = document.getElementById('deleteMember')
const deleteMemberBtn = document.getElementById('deleteMemberBtn');

deleteMemberBtn.addEventListener("click", e => {
	showDeleteMember();
})


function showDeleteMember(){
	clear();
	
	if(deleteMemberForm.classList.contains('hide')){
		deleteMemberForm.classList.remove('hide');
		passwordChangeForm.classList.add('hide');
		numClubDiv.classList.add('hide');
	}else{
		deleteMemberForm.classList.add('hide');
		numClubDiv.classList.remove('hide');
	}
}

function doDelete(){
	
	const formData = new FormData(document.getElementById('deleteMemberForm'));
	const url = cpath + "/member/deleteMember";
	const opt = {
			method: 'POST',
			body: formData,
	}
	fetch(url, opt).then(resp => resp.text())
	.then(text => {
		if(+text != 0){
			swal('회원탈퇴','회원탈퇴 성공','success')
			setTimeout(function go(){
				location.replace(cpath)
			},1500)
		}else{
			swal('회원탈퇴','회원탈퇴 실패','error')
		}
		
	})
}