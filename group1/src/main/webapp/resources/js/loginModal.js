const btn = document.getElementById('search_account');
const searchModal = document.getElementById('account_search_option');
const span = document.getElementsByClassName('btn-close')[0];

btn.onclick = function() {
	searchModal.style.display = "block";
}

//span.onclick = function() {
//	searchModal.style.display = "none";
//}

window.onclick = function(event) {
	if (event.target == searchModal) {
		searchModal.style.display = "none";
	}
}

window.onclick = function(event){
	if(event.target==modal){
		modal.style.display="none";
	}
}