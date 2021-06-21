<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<script>
	const cpath= '${cpath}';
	const idxBo = '${dto.idxBo}';
</script>

<style>
.sb {

		max-width: 100%;
		display: flex;
		background-color: #6c7ae0;
		justify-content: flex-end ;

		
}


.sb >button {
		color: #FFFFFF;
		margin:10px;
}


</style>

<div class="limiter" style="padding-top: 75px; width:1000px; height:800px;">
	<div class="container-table100" style="width:1000px; height:705px;">
		<div class="wrap-table100">
			<div class="table100 ver1 m-b-110">
				<div class="table100-head">
					<table>
						<thead>
							<tr class="row100 head">
								<th class="cell100 column1">${dto.title}</th> <!-- 글제목 -->
								<th class="cell100 column4">조회:${dto.viewCount} 추천:${dto.likeCount} 댓글:  ${dto.wdate }</th> 
								<th class="cell100 column5">글쓴이:${dto.writer }</th> <!-- 글쓴이 -->
							</tr>
						</thead>
					</table>
				</div>

				<div class="table100-body"   style="width:1000px; height:800px; overflow:scroll; overflow:hidden;">
					<table>
						<tbody>
<!-- 						업로드 -->
							<tr class="row100 body ">
								<c:if test="${not empty dto.uploadFile }">
								<div><img src="${cpath }/upload/${dto.uploadFile }" width="100%" height="250px"></div>
								<pre style="width:1000px; height:280px;">${dto.content }</pre>
								</c:if>
								
								<c:if test="${empty dto.uploadFile }">
								<pre style="width:1000px; height:530px;">${dto.content }</pre>
								</c:if>
								
								
							</tr>
							
							<c:if test="${not empty login.nickName && login.nickName != dto.writer}">
								<div class="sb">
									<button id="likeBtn">호</button>
									<button id="hateBtn">불</button>
								</div>
							</c:if>
					
							
<!-- 							자신이 작성한것만 수정 삭제 가능 -->
<%-- 							<c:if test="${login.nickName == dto.writer}">  --%>
								<div class="sb ${login.nickName == dto.writer ? '' : 'hidden'}">
									<button style= "float:right;" id="modifyBtn" onclick="modify()">수정</button>
									<button style= "float:right;" id="deleteBtn" onclick="delete()">삭제</button>
								</div>
<%-- 							</c:if> --%>
					</table>
				</div>
				</div>
			</div>
		</div>
	</div>
	
				<script>
					
					function modify(){
						if(confirm('게시글을 수정하시겠습니까?')) {
							location.href = '${cpath }/board/modify/${dto.idxBo}'
						}
						
					}
				</script>
					
<!-- 					window.onload = function(){ -->
<!-- 						document.getElementById('deleteBtn').onclick = function(event) { -->
<!-- 							if(confirm('게시글을 삭제하시겠습니까?')) { -->
<%-- 								location.href = '${cpath }/board/delete?idxBo=${dto.idxBo}' --%>
<!-- 							} -->
<!-- 						}	 -->
<!-- 					} -->
				<script>
					function delete(){
							console.log("delete버튼작동")
							if(confirm('게시글을 삭제하시겠습니까?')) {
								location.href = '${cpath }/board/delete?idxBo=${dto.idxBo}'
							}
						}	
					}
				</script>
				
				<!--===============================================================================================-->
				<script src="${cpath }/resources/vendor/jquery/jquery-3.2.1.min.js"></script>
				<!--===============================================================================================-->
				<script src="${cpath }/resources/vendor/bootstrap/js/popper.js"></script>
				<script
					src="${cpath }/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
				<!--===============================================================================================-->
				<script src="${cpath }/resources/vendor/select2/select2.min.js"></script>
				<!--===============================================================================================-->
				<script
					src="${cpath }/resources/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
				<script>
					$('.js-pscroll').each(function() {
						var ps = new PerfectScrollbar(this);

						$(window).on('resize', function() {
							ps.update();
						})
					});
				</script>
				<!--===============================================================================================-->
				<script src="${cpath }/resources/js/main.js"></script>
				
				<script src="${cpath }/resources/js/board/like.js"></script>
				
<%-- 				<script src="${cpath }/resources/js/board/hate.js"></script> --%>

<script>
	//  jcw 210616 페이지 로드시 실행될 함수
	$(document).ready(function(){
		showReplyList();
	});


//jcw 210614 필요 인자 불러오기
const idxBo = '${dto.idxBO }'
const writer = '${login.id }'

// jcw 210614 ajax list로 호출
function showReplyList(){
			$("#replyDiv").empty();		// reply div의 내용을 초기화
	const url = "${cpath}/board/read/replyList"
	const paramData = {"idx" : "${dto.idxBO}"};
	$.ajax({
        type: 'GET',
        url: url,
        data: paramData,
        dataType: 'json',
		success : function(replys){
			drawReply(replys)
		}, error : function(replys){


		}

	});
}

//jcw 210616 댓글 입력
	//댓글 저장 버튼 클릭 이벤트
	
	
	document.getElementById('replyInputForm').onsubmit = function(event) {	
		event.preventDefault();						
		
		const formData = new FormData(event.target)	
		const url = '${cpath}/board/read/replyWrite'
		const opt = {
			method: 'POST',
			body: formData,
		}
		fetch(url, opt)
		.then(resp => resp.text())
		.then(text => {
 			console.log(text)
			if(+text == 1) {
				event.target.reset();
				window.alert('댓글 입력 성공 !!')
//				document.getElementById('msg').innerText = '';
//				alert('댓글 입력 성공 !!');
			} 
			else {
				window.alert('댓글 입력 실패 !!')
//				alert('댓글 입력 실패...')
			}
		})
		
		showReplyList()
	}
	
	


// jcw 210616 댓글창 생성
function drawReply(replys) {
	
	// 부모 댓글 번호를 받아서 댓글 입력창을 만든다.
	replys.forEach(function(reply){ 
		if (reply.idxParent == 0) {
			let rc = 0;
			replys.forEach(function(i){
				if (reply.idxRe == i.idxParent) rc++;
			})
			let idxReValue = reply.idxRe
			idxParentValue = reply.idxParent
			
			replyWindow(idxParentValue, idxReValue, reply)				
		}
	})
	
		replys.forEach(function(reply){ 
		if (reply.idxParent != 0) {
			let rc = 0;
			replys.forEach(function(i){
				if (reply.idxRe == i.idxParent) rc++;
			})
			let idxReValue = reply.idxRe
			idxParentValue = reply.idxParent
			
			replyWindow(idxParentValue, idxReValue, reply)			
		}
	})
}


// jcw 210614 댓글 출력부분 스크립트
function replyWindow(idxParentValue, idxReValue, reply){
	const replyDiv = document.createElement('div')
	// 댓글 출력 div
	const replyMainDiv = document.createElement('div')
	replyMainDiv.setAttribute("class", "replyList")
	replyMainDiv.style = "justify-content: center; width: 900px; border: 2px solid #ff0000;"

	const replySecondDiv = document.createElement('div')
	replySecondDiv.setAttribute("id", "replyList")

	const replyThirdDiv = document.createElement('div')
	replyThirdDiv.style = "width: 900px; display : flex;"

	const replyNameDiv = document.createElement('div')
	replyNameDiv.style = "width: 800px; font-weight: 700;"
	replyNameDiv.innerHTML = reply.writer
	replyThirdDiv.appendChild(replyNameDiv)

	const replyLikeDiv = document.createElement('div')
	replyLikeDiv.style = "text-align: right; width: 100px;"

	const replyLikeAtag = document.createElement('a')
	replyLikeAtag.href = ""
	replyLikeAtag.innerHTML = "&#128151;&#128150; 1"
	replyLikeDiv.appendChild(replyLikeAtag)

	replyThirdDiv.appendChild(replyLikeDiv)
	replySecondDiv.appendChild(replyThirdDiv)

	const replyContentDiv = document.createElement('div')
	const replyContentPtag =  document.createElement('p')
	replyContentPtag.innerHTML = reply.content
	replyContentDiv.appendChild(replyContentPtag)
	replySecondDiv.appendChild(replyContentDiv)

	const replySelectDiv = document.createElement('div')
	replySelectDiv.style = "text-align: right;"

		const updateReplyBtn = document.createElement('button')
		updateReplyBtn.setAttribute("id", "updateReplyBtn")
		updateReplyBtn.innerText="수정"
		replySelectDiv.appendChild(updateReplyBtn)
		
		const deleteReplyBtn = document.createElement('button')
		deleteReplyBtn.setAttribute("id", "deleteReplyBtn")
		deleteReplyBtn.innerText="삭제"
		replySelectDiv.appendChild(deleteReplyBtn)

		if (reply.idxParent == 0) {
		const replyBtn = document.createElement('button')
		replyBtn.setAttribute("id", "replyBtn")
		replyBtn.innerText="댓글"
		replyBtn.addEventListener ("click", function() {
			  alert("did something");
		})
		replySelectDiv.appendChild(replyBtn)		
		} else {
		
		}
		
			
	replySecondDiv.appendChild(replySelectDiv)
	replyMainDiv.appendChild(replySecondDiv)
	replyDiv.appendChild(replyMainDiv)
	
	// 댓글 입력 div
		
	const inputReply = document.getElementById('inputReply')

	const inputReplyDiv = document.createElement('div')
	inputReplyDiv.setAttribute("id", "inputReply")
	inputReplyDiv.style = "justify-content: center; width: 900px; border: 2px solid #dadada;"

	const replyInputForm = document.createElement('form')
	replyInputForm.setAttribute("id", "replyInputForm")
	replyInputForm.setAttribute("method", "POST")
	replyInputForm.style = "width: 800px;"

		for (i=1; i<4; i++) {
		const input = document.createElement('input')
	
		input.type = 'hidden'
	
			switch (i) {
				case '1' : input.name="idxBo"; input.value="idxBo"; 	break
				case '2' : input.name="writer"; input.value="writer";	break
				case '3' : input.name="idxParent"; input.value="idxParentValue";	break
			}

		replyInputForm.appendChild(input)
	}

	const p1  = document.createElement('p')
	p1.innerHTML = writer
	replyInputForm.appendChild(p1)
	
	const p2  = document.createElement('p')
	const textarea = document.createElement('textarea')
	textarea.name="content"
	textarea.placeholder="바른말 고운말을 사용합시다."
	textarea.required="required"
	p2.appendChild(textarea)

	const submit = document.createElement('input')
	submit.type = 'submit'
	submit.value = '입력'
	p2.appendChild(submit)
	
	replyInputForm.appendChild(p2)
	
	inputReplyDiv.appendChild(replyInputForm)
	replyDiv.appendChild(inputReplyDiv)	
	
	// 댓글 수정 div
	const updateReplyDiv = document.createElement('div')
	updateReplyDiv.setAttribute("id", "updateReplyDiv")
    updateReplyDiv.style = "justify-content: center; width: 900px; border: 2px solid #8080ff;"
    
    const updateReplyForm = document.createElement('form')
	updateReplyForm.setAttribute("method", "POST")
    updateReplyForm.style="width: 900px;"
    
    		for (i=1; i<4; i++) {
		const input = document.createElement('input')
	
		input.type = 'hidden'
	
			switch (i) {
				case '1' : input.name="idxBo"; input.value="idxBo"; 	break
				case '2' : input.name="writer"; input.value="writer";	break
				case '3' : input.name="idxParent"; input.value="idxParentValue";	break
			}

		updateReplyForm.appendChild(input)
	}
    
	const p3  = document.createElement('p')
	p3.innerHTML = reply.writer
	updateReplyForm.appendChild(p3)
	
	const p4  = document.createElement('p')
	const textarea2 = document.createElement('textarea')
	textarea2.name="content"
	textarea2.placeholder = reply.content
	textarea2.required="required"
	p4.appendChild(textarea2)
    updateReplyForm.appendChild(p4)
    
   	const replyUpdateSelectDiv = document.createElement('div')
   	replyUpdateSelectDiv.style = "text-align: right;"
   
   	const submit2 = document.createElement('input')
	submit2.type = 'submit'
	submit2.value = '수정'
	replyUpdateSelectDiv.appendChild(submit2)
    
    const replyUpdateCancelBtn = document.createElement('button')
	replyUpdateCancelBtn.setAttribute("id", "replyUpdateCancelBtn")
	replyUpdateCancelBtn.innerText="취소"
	replyUpdateSelectDiv.appendChild(replyUpdateCancelBtn)
   
    updateReplyForm.appendChild(replyUpdateSelectDiv)
    updateReplyDiv.appendChild(updateReplyForm)
    
    const ReplySubDiv = document.createElement('div')
	ReplySubDiv.setAttribute("id", "ReplySubDiv" + reply.idxRe)
    ReplySubDiv.setAttribute("class", "ReplySubDiv" + reply.idxRe)
    updateReplyDiv.appendChild(ReplySubDiv)
	replyDiv.appendChild(updateReplyDiv)		
		
			
		
	if (reply.idxParent == 0) {
		inputReply.appendChild(replyDiv)
	}else{
		("ReplySubDiv" + reply.idxParent).appendChild(replyDiv)
	}
}
</script>


				</body>
				</html>