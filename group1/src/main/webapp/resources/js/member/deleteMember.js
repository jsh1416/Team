const deleteMemberBtn = document.getElementById('deleteMember');


deleteMemberBtn.addEventListener("click", e => {
	showDeleteConfirm();
})

function doDelete(){
	const url = cpath + "/member/deleteMember/" + logInId;
	const opt = {
			method: 'POST',
	}
	fetch(url, opt).then(resp => resp.text())
	.then(text => {
		if(+text != 0){
			swal('회원탈퇴','회원탈퇴 성공','success')
			location.href(url);
		}else{
			swal('회원탈퇴','회원탈퇴 실패','error')
		}
		
	})
}

const sweetConfirm = function(msg, title, resvNum){
		swal({
			title : title,
			text : msg,
			type : "warning",
			showCancelButton : true,
			confirmButtonClass : "btn-danger",
			confirmButtonText : "예",
			cancelButtonText : "아니오",
			closeOnConfirm : false,
			closeOnCancel : true
		}, function(isConfirm) {
			if (isConfirm) {
				doDelete();
			}else{
				swal('회원탈퇴', '회원탈퇴 취소', "warning");
			}

		});
}


function showDeleteConfirm() {
	
	console.log(logInId);
	sweetConfirm('회원탈퇴', '탈퇴하시겠습니까?');
}