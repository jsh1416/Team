var btn = document.getElementById('search_account');
var modal = document.getElementById('account_search_option');
var span = document.getElementsByClassName('close_btn')[0];

btn.onclick = function() {
	modal.style.display = "block";
}

span.onclick = function() {
	modal.style.display = "none";
}

window.onclick = function(event) {
	if (event.target == modal) {
		modal.style.display = "none";
	}
}