const modal = document.getElementById("modal")
			
				function modalOn() {
				    modal.style.display = "flex"
				}
				function isModalOn() {
				    return modal.style.display === "flex"
				}
				function modalOff() {
				    modal.style.display = "none"
				}
				
				const btnModal = document.getElementById("btn-modal")
				window.onload = function(){
					btnModal.addEventListener("click", e => {
					    modalOn();
					})	
				}
				
				
				const closeBtn = modal.querySelector(".close-area")
				closeBtn.addEventListener("click", e => {
				    modalOff()
				})
				modal.addEventListener("click", e => {
				    const evTarget = e.target
				    if(evTarget.classList.contains("modal-overlay")) {
				        modalOff()
				    }
				})
				window.addEventListener("keyup", e => {
				    if(isModalOn() && e.key === "Escape") {
				        modalOff()
				    }
				})
				
				
				document.getElementById('loginForm').onsubmit = function (event) {
					event.preventDefault();
					const formData = new FormData(event.target);
					const url = cpath + '/member/login';
					const opt = {
							method: 'POST',
							body: formData,
					}
					fetch(url, opt)
					.then(resp => resp.json())
					.then(json => {
						if(json != null){
							console.log(json);
							location.reload();
						}else{
							const loginMsg = document.getElementById('loginMsg');
							loginMsg.innerText = '아이디 혹은 패스워드가 일치하지 않습니다.';
							loginMsg.style.color = 'red';
						}
					})
				}