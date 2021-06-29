<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<script>
// 	const cpath= '${cpath}';
	const idxBo = '${dto.idxBo}';
	const boardidx = '${boardidx}';
	const likemember = '${likemember}';
	const clubName = '${dto.clubName}'

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

<div style="text-align: center; width: 100%; margin-top: 80px;">
	<div style=" margin: auto; width: 70%;">
	
			<div class="table100 ver1 m-b-110" style="">
				<div class="table100-head">
					<table>
						<thead>
							<tr class="row100 head">
								<th class="cell100 column1" style="background:${clubColor};" >${dto.title}</th> <!-- 글제목 -->
								<th class="cell100 column2" style="background:${clubColor};">조회:${dto.viewCount} 댓글: ${rc}</th> 
								<th class="cell100 column5" style="background:${clubColor};">${dto.wdate}</th>
								<th class="cell100 column5" style="background:${clubColor};">${dto.writer } </th> <!-- 글쓴이 -->
							
							</tr>
						</thead>
					</table>
				</div>

				<div class="table100-body"   style="overflow:scroll; margin-top30px; overflow:hidden;">
					<table>
						<tbody>
<!-- 						업로드 -->
							<tr class="row100 body " style="">
								<c:if test="${not empty dto.uploadFile }">
								<div><img src="${dto.uploadFile }" width="100%" height="250px"></div>
									<pre style="padding-left:15px; padding-top: 30px; min-height: 180px; text-align: left; ">${dto.content }</pre>
								</c:if>
								
								<c:if test="${empty dto.uploadFile }">
									<pre style="padding-left:15px; padding-top: 30px; min-height: 180px; text-align: left; ">${dto.content }</pre>
								</c:if>
								
							</tr>
							
							<c:if test="${login.nickName!=dto.writer }">
								 <form>
									<input type="hidden" name="idxBo"  value="${idxBo}">
									<input type="hidden" name="login.nickName"  value="${login.nickName}">
									<button class="btn btn-primary btn-lg" id="likeBtn" onclick="doLike()">🏆️발롱도르 </button>&nbsp;
									<div class="btn btn-outline-primary btn-sm"> 추천:${dto.likeCount } </div> 
									&nbsp;<button class="btn btn-danger btn-lg" id="hateBtn" onclick="dohate()"> 🚪나가세요</button>
								</form>
							</c:if>
							
							<c:if test="${login.nickName ==dto.writer }">
							<div style= "background:#3A066B;" class="sb">
									<button style= "float:right; background:#3A066B;" id="modifyBtn" onclick="modify()">수정</button>
									<button style= "float:right; background:#3A066B;" id="deleteBtn" onclick="deleteBoard()">삭제</button>
							</div>
							</c:if>
							
							<c:if test="${login.nickName !=dto.writer }">
							<div style= "background:#3A066B;" class="sb">
							</div>
							</c:if>
							
							
					</table>
				</div>
				</div>
					<div class="container-table100">
						<div class="wrap-table100">
							<div class="table100 ver1 m-b-110">
									<div id="replyDiv">
									<form id="replyInputForm" 
										style="display:flex; background-color: #dadada;
										width:1170px; height : 70px;">
										<input type = "hidden" name="idxBo" value = ${dto.idxBo } >
										<input type = "hidden" name="writer" value = ${login.id } >
										<input type = "hidden" name="idxParent" value="0" >
										<textarea name = "content" placeholder="바른말 고운말을 사용합시다."
											required style="width:1070px; height:70px;"></textarea>
										<input type="submit" value="등록" 
											style="font-size: 20px; background-color: #6c7ae0;
											 width : 100px; height: 70px;">	
								
									</form>
								</div>
								<h6 id = "cnt"></h6>
								<div id = "likeContent" style="display:none; background-color: #dadada;
										width:1170px; height : 100px;"></div>
								<div id="mainReplyMain" style="background-color: #4e81c0;"></div>
							</div>
						</div>
					</div>
				
					
				
				
				
		</div>
	</div>
	
	
	
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
				
<!-- 				좋아요 -->
				<script src="${cpath }/resources/js/board/like.js"></script>
				<script src="${cpath }/resources/js/board/hate.js"></script>
<!-- 				삭제 -->
				<script src="${cpath }/resources/js/board/deleteboard.js"></script>
<!-- 				수정 -->
				<script src="${cpath }/resources/js/board/modify.js"></script>
				<!--=============================================================================================== ksj 영역--> 
				
				<script>
				// jcw 06-25 코드 정리 시작
				//  jcw 210620 페이지 로드시 실행될 함수
				$(document).ready(function(){
					showReplyList();
					
					// textarea의 글자수를 체크해서 입력할 수 있는 수를 제한한다.
					$('#replyInputCheck').on('keyup', function() {
				        $('#replyInputCheck_cnt').html("("+$(this).val().length+" / 150)");
				 
				        if($(this).val().length > 150) {
				           $(this).val($(this).val().substring(0, 150));
				           $('replyInputCheck_cnt').html("(150 / 150)");
				    	}
					});
				 	
				});
				//jcw 210620 필요 인자 불러오기
				const writer = '${login.id }'
				// jcw 210614 ajax reply 리스트 호출 파라미터를 받아서 해쉬맵으로 전달
				function showReplyList(){
					$("#mainReplyMain").empty();		// reply 리스트를 보여줄 div 초기화
					const url = "${cpath}/board/read/replyList/"
					const paramData = {"idx" : "${dto.idxBo}", "likeId" : "${login.id }"};
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
				// jcw 210616 댓글창 생성
				function drawReply(replys) {
					// 받은 json에서 좋아요 최대수를 구한다.
					let replyMaxCnt = replys.map(function(r){
						return r.replyCount;
					})
					replyMaxCnt = Math.max.apply(null, replyMaxCnt)
					// 게시판에 좋아요가 0 이상을 때 조건에 맏는 리스트르 불러온다.
					$("#likeReplyList").empty();
					if(replyMaxCnt != 0){
						callRplMCnt(replyMaxCnt)
					}
					// json의 수를 구하여 댓글수로 등록
					$("#cnt").text("등록된 댓글 - " + replys.length)
					// 리스트를 조건에 따라 생성하도록 한다. 이 과정에서 대댓글 수(rc)를 계산한다.
					// RlikeCheck는 코드 재사용을 위해 부여한 값이다. 0, 1
					replys.forEach(function(reply){ 
						if (reply.idxParent == 0) {
							let rc = 0;
							RlikeCheck = 0
							replys.forEach(function(i){
								if (reply.idxRe == i.idxParent) rc++;
							})
							replyWindow(reply, rc, RlikeCheck)				
						}
					})					
						replys.forEach(function(reply){ 
						if (reply.idxParent != 0) {
							let rc = 0;
							RlikeCheck = 0
							replys.forEach(function(i){
								if (reply.idxRe == i.idxParent) rc++;
							})
							replyWindow(reply, rc, RlikeCheck)	
							}
						})
					}
				// 좋아요 최대 수를 이용하여 조건에 맞는 리스트를 다시 받는다.
				function callRplMCnt(replyMaxCnt){
					const url = "${cpath}/board/read/callRplMax/"
					const paramData = {"idx" : "${dto.idxBo}", "likeId" : "${login.id }", "replyMaxCnt": replyMaxCnt};
					$.ajax({
				      type: 'GET',
				      url: url,
				      data: paramData,
				      dataType: 'json',
						success : function(replys){
							drawCallRplMax(replys)
						}, error : function(replys){
	
						}
					});
				}
				// 리스트를 조건에 따라 생성하도록 한다. 이 과정에서 대댓글 수(rc)를 계산한다.
				// RlikeCheck는 코드 재사용을 위해 부여한 값이다. 0, 1
				function drawCallRplMax(replys){
					replys.forEach(function(reply){ 
						let rc = 0
						let RlikeCheck = 1
						replys.forEach(function(i){
							if (reply.idxRe == i.idxParent) rc++;
							})
						replyWindow(reply, rc, RlikeCheck)
					})
				}
				
		
				
				// jcw 210614 댓글 리스트를 createElement로 만들어 appendChild 붙인다.
				// RlikeCheck는 코드를 통해서 결과가 달라진다.
				function replyWindow(reply, rc, RlikeCheck){
					const replyMainDiv = document.createElement('div')
					if(RlikeCheck == 1){} 
					else {
						replyMainDiv.setAttribute("id", "replyMainDiv" + reply.idxRe)
					}
					replyMainDiv.style = "width : 100%;"
					
					const replySecondDiv = document.createElement('div')
					if(RlikeCheck == 1){} 
					else {
						replySecondDiv.setAttribute("id", "replySecondDiv" + reply.idxRe)
					}
					replySecondDiv.setAttribute("class", "replySecondDiv")
					replySecondDiv.style = "display:block;"
					
					const replyMainStyleDiv = document.createElement('div')
					replyMainStyleDiv.style = "display:flex; width: 100%;" // 댓글창 너비 조절
										
					//사용자 정보 입력 div
					const replyBlank = document.createElement('div')
					if(reply.idxParent == 0){
					replyBlank.style ="margin:2px;width:60px;"							// 댓글창 깊이 조절
					} else {
					replyBlank.style ="margin:2px;width:150px;"							// 댓글창 깊이 조절
					}
					replyMainStyleDiv.appendChild(replyBlank)
					
					const replyUserDiv = document.createElement('div')
					replyUserDiv.style = "margin-top : 20px; margin-right: 30px; width: 60px;"
					
					const replyUserImg = document.createElement('img')
					replyUserImg.style = "width:60px;  height :60px;"
					replyUserImg.src = "${cpath }/resources/images/logo/" + reply.club + ".png"
					
					replyUserDiv.appendChild(replyUserImg)
					replyMainStyleDiv.appendChild(replyUserDiv)
					
					

					
										
					// 댓글 중간 부분 이름, 날짜, 좋아요, 내용
					const replyBody = document.createElement('div')
					replyBody.style = "margin:0%; display:flex; width : 90%;"
					
					const replyBodySub = document.createElement('div')
					if(reply.idxParent == 0){
					replyBodySub.style = "margin:0%; width:90%;"		// 댓글창 내용 너비 조절
					} else {
					replyBodySub.style = "margin:0%; width:90%;"		// 댓글창 내용 너비 조절
					}
					const replyInfo = document.createElement('div')
					replyInfo.style = "margin:10px; margin-top:20px; text-align: right; display:flex;border-bottom: 2px solid #dadada;"
					// 이름 출력
					const replyNameDiv = document.createElement('div')
					replyNameDiv.innerHTML = reply.nickName
					replyNameDiv.style = "margin-right:17px; font-size : 22px;"
					replyInfo.appendChild(replyNameDiv)
					// 댓글 등록 날짜 출력
					const replyWdateDiv = document.createElement('div')
					replyWdateDiv.style = "font-size: 3px;"
					replyWdateDiv.innerHTML	= reply.wdate
					replyUserDiv.appendChild(replyWdateDiv)
					
					
					//좋아요 구현 부분
					const likeBtnTagA = document.createElement('button')
					likeBtnTagA.style = ""
					likeBtnTagA.setAttribute("id", "likeBtnTagA" + reply.idxRe)
					likeBtnTagA.setAttribute("idxre", reply.idxRe)
					likeBtnTagA.setAttribute("userid", writer)
					if(reply.replyCheck == 0){
						likeBtnTagA.style = ""
					} else {
						likeBtnTagA.style = "color:#ff0000;"
					}					
					
					// 좋아요 수에 따라서 표시 변경
					if (reply.replyCount == 0){
						likeBtnTagA.innerText= "👍?"				
					} else {
						likeBtnTagA.innerText= "좋아요👍" + reply.replyCount
					}
					// 본인 좋아요 여부에 따라서 다른 동작을 수행
					likeBtnTagA.addEventListener ("click", function() {
						const likeIdxRe = $(this).attr("idxre");
						const likeId = $(this).attr("userid");
						if(reply.replyCheck == 0){		
							replyLikeDo(likeIdxRe, likeId)
						} else {
							replyLikeUndo(likeIdxRe, likeId)
						}	         	
					})
					replyInfo.appendChild(likeBtnTagA)
					replyBodySub.appendChild(replyInfo)
					//댓글 내용을 출력
					const replyListContentDiv = document.createElement('div')
					replyListContentDiv.style = "line-height :24px; font-size: 100%; width : 95%;"
					
					const replyContentPtag =  document.createElement('div')
					if(reply.idxParent == 0){
					replyContentPtag.style = "width : 100%; margin : 10px; text-align:left; valign:middle;white-space: pre-wrap; word-wrap: break-word; word-break: break-word;"
					} else {
					replyContentPtag.style = "width : 100%; margin : 10px; text-align:left; valign:middle;white-space: pre-wrap; word-wrap: break-word; word-break: break-word;"
					}
					
					
					// 댓글 내용에 대댓글의 수와 삭제된 댓글의 댓글을 찾아서 표시한다.
					let orphanReply = (document.getElementById("replySubListDiv" + reply.idxParent) == null)
						
					if(rc != 0){
						replyContentPtag.innerHTML = reply.content + "(" + rc + ")"
					} else {
						if (orphanReply == 1 && reply.idxParent != 0) {
							replyContentPtag.innerHTML = "[삭제된 댓글의 댓글입니다.] <br>" + reply.content
						} else if (reply.idxParent != 0){
								replyContentPtag.innerHTML = "[↘]" + reply.content
						} else {
								replyContentPtag.innerHTML = reply.content
						}
					}
						
					replyListContentDiv.appendChild(replyContentPtag)				
					replyBodySub.appendChild(replyListContentDiv)				
					replyBody.appendChild(replyBodySub)
					
					//대댓글, 수정, 삭제 버튼
					const replyListSelectBtnDiv = document.createElement('div')
					replyListSelectBtnDiv.style = "display:block; margin-top:23px; width: 150px;"
											
						// 대댓글 입력 버튼
						if (writer != "") {							
							if (reply.idxParent == 0){	
								const replyReplyBtn = document.createElement('button')
								replyReplyBtn.style = "display:block; margin-bottom:5px;"
								replyReplyBtn.setAttribute("id", "replyReplyBtn" + reply.idxRe)
								replyReplyBtn.setAttribute("idxre", reply.idxRe)
								replyReplyBtn.setAttribute("idxparent", reply.idxParent)
								replyReplyBtn.setAttribute("idxbo", reply.idxBo)
								replyReplyBtn.setAttribute("writer", writer)
								// 버튼에 속성을 부여하여 값을 넘긴다.
								replyReplyBtn.addEventListener ("click", function() {
									const idx = $(this).attr("idxre");
									const writer = $(this).attr("writer");
									const idxBo = $(this).attr("idxbo");
									replyReplyBTN(idx, writer, idxBo)
								})
								replyReplyBtn.innerText="💬댓글"
							replyListSelectBtnDiv.appendChild(replyReplyBtn)
							}
						}
						
						//댓글 수정, 삭제 버튼 // 로그인 여부에 따라 표시를 결정한다.
						if (reply.writer == writer) {
							const updateReplyBtn = document.createElement('button')
							updateReplyBtn.style = "display:block;"
							updateReplyBtn.setAttribute("id", "updateReplyBtn" + reply.idxRe)
							updateReplyBtn.setAttribute("idxre", reply.idxRe)
							updateReplyBtn.setAttribute("content", reply.content)
							updateReplyBtn.setAttribute("idxparent", reply.idxParent)
							updateReplyBtn.addEventListener ("click", function() {
								const idx = $(this).attr("idxre");
								const content = $(this).attr("content");
								const idxParent = $(this).attr("idxparent");
								updateReplyBTN(idx, content, idxParent)
							})
							updateReplyBtn.innerText="✏️수정"
							replyListSelectBtnDiv.appendChild(updateReplyBtn)
											
							// jcw 210617 댓글 삭제 >> 속성값에 idxRe 인자를 주어 삭제 실행
							const deleteReplyBtn = document.createElement('button')
							deleteReplyBtn.style = "display:block;"
							deleteReplyBtn.setAttribute("id", "deleteReplyBtn")
							deleteReplyBtn.setAttribute("idxre", reply.idxRe)
							deleteReplyBtn.innerText="🗑️삭제"
							deleteReplyBtn.addEventListener ("click", function() {
								const idx = $(this).attr("idxre");
								deleteReplyBTN(idx)
							})
							replyUserDiv.appendChild(deleteReplyBtn)
						}
						
					
										
					
					
					if(RlikeCheck == 1){}
					else{
					replyBody.appendChild(replyListSelectBtnDiv)
					}
					
					
					
					
					

					
					// 버튼으로 생성된 form이 붙을 위치
					const replySelectSubDiv = document.createElement('div')
					if(RlikeCheck == 1){
						replySelectSubDiv.setAttribute("id", "RlikeCheckSubDiv" + reply.idxRe)
					} else {
						replySelectSubDiv.setAttribute("id", "replySelectSubDiv" + reply.idxRe)
					}
					replySelectSubDiv.setAttribute("class", "replySelectSubDiv")
					replySelectSubDiv.style = "display:none;"
													
					
					replyMainStyleDiv.appendChild(replyBody)
					
					replySecondDiv.appendChild(replyMainStyleDiv)
					
					replyMainDiv.appendChild(replySecondDiv)
					
					//// 댓글 폼을 붙이는 위치      
					replyMainDiv.appendChild(replySelectSubDiv)
					
					//대댓글이 보일 위치
					const replySubListDiv = document.createElement('div')
					if(RlikeCheck == 1){} else {
					replySubListDiv.setAttribute("id", "replySubListDiv" + reply.idxRe)
					}
					replySubListDiv.style = "width: 100%;"
					replyMainDiv.appendChild(replySubListDiv)
					
					// 분배부: 댓글을 조건에 따라 다른 곳에 붙인다.
									
					if(RlikeCheck == 1){
						document.getElementById("likeReplyList").appendChild(replyMainDiv)
					} else {
						if(reply.idxParent == 0 || 
							document.getElementById("replySubListDiv" + reply.idxParent) == null){
							mainReplyMain.appendChild(replyMainDiv)
						}else{
							document.getElementById("replySubListDiv" + reply.idxParent).appendChild(replyMainDiv)
						}
					}
				}
				// replyWindow(reply, rc, RlikeCheck) 끝.
					
			// 버튼 작동 함수 부분	
			// 대댓글 버튼을 누르면 입력 폼을 생성한다.	
		 		function replyReplyBTN(idx, writer, idxBo){
				
					if(document.getElementById("replySelectSubDiv" + idx).style.display == 'block'){
					// 대댓글 입력 창이 열려 있으면 닫는다	
		 				$(".replySelectSubDiv").empty()
		 				$(".replySelectSubDiv").hide()
		 				$(".replySecondDiv").show()
		 				document.getElementById("replySelectSubDiv" + idx).style.display='none'
						
					}else{
					// 대댓글 입력 창을 만든다.
		 				$(".replySelectSubDiv").empty()
		 				$(".replySelectSubDiv").hide()
		 				$(".replySecondDiv").show()
		 				document.getElementById("replySelectSubDiv" + idx).style.display='block'
						//test start
					
					
						//사용자 정보 입력 div >> 공백으로 변경
						const replyReplyMainDiv = document.createElement('div')

						const replyInputMainStyleDiv = document.createElement('div')
						replyInputMainStyleDiv.style = "display:flex;background-color: #2d5986; width:100%;"
							
						const replyInputUserDiv = document.createElement('div')
						replyInputUserDiv.style = "margin: 0.7%; width:80px;  height :87px;"
						
						const replyInputNameMainDiv = document.createElement('div')
						replyInputNameMainDiv.style = " line-height :58px;"
						const replyInputNameDiv = document.createElement('div')
						replyInputNameDiv.style = "font-weight: 700; text-align: "
							
						replyInputNameMainDiv.appendChild(replyInputNameDiv)
						replyInputUserDiv.appendChild(replyInputNameMainDiv)
						replyInputMainStyleDiv.appendChild(replyInputUserDiv)
							
						//댓글 리스트, 수정, 삭제 관련 div//
						const replyInputMainDiv = document.createElement('div')
						replyInputMainDiv.style = "margin: 0.7%; background-color:#fff; display:flex; width: 100%; height :70px;"
							
						const replyInputSecondDiv = document.createElement('div')
						replyInputSecondDiv.style = "width:100%"
											
						const testForm = document.createElement('form')
						testForm.setAttribute("id", "testForm")
						testForm.style = "display:flex; width:100%;"
								
						const inputIdxbo = document.createElement('input')
						inputIdxbo.name = "idxBo"									
						inputIdxbo.value = idxBo
						inputIdxbo.type = 'hidden'
						testForm.appendChild(inputIdxbo)
										
						const inputWriter = document.createElement('input')
						inputWriter.name="writer"
						inputWriter.value = writer
						inputWriter.type = 'hidden'
						testForm.appendChild(inputWriter)
										
						const inputIdxparent = document.createElement('input')
						inputIdxparent.name="idxParent"
						inputIdxparent.value = idx
						inputIdxparent.type = 'hidden'
						testForm.appendChild(inputIdxparent)
								

									
								
						const textarea = document.createElement('textarea')
						textarea.name="content"
						////////////////////////////////////textarea 글자 체크
						textarea.setAttribute("id", "replyReplyCheck")
						////////////////////////////////////textarea 글자 체크
						textarea.placeholder="바른말 고운말을 사용합시다."
						textarea.style = "width : 100%; height : 70px;  resize:none;"
						textarea.required="required"
						testForm.appendChild(textarea)
						replyInputSecondDiv.appendChild(testForm)
						////////////////////////////////////textarea 글자 체크
						const testCntDiv = document.createElement('div')
						testCntDiv.setAttribute("id", "replyReplyCheck_cnt")
						testCntDiv.style = "text-align: right;"
						testCntDiv.innerHTML = "(0/150)"
						replyInputSecondDiv.appendChild(testCntDiv)
						////////////////////////////////////textarea 글자 체크
						
						replyInputMainDiv.appendChild(replyInputSecondDiv)
								

						// 서브밋 버튼 부분
						const submit = document.createElement('input')
						submit.style = "font-size:20px; width : 70px; height : 70px; "
						submit.type = 'submit'
						submit.value = '✔️'
						testForm.appendChild(submit)
							
						replyInputMainStyleDiv.appendChild(replyInputMainDiv)
						
						replyReplyMainDiv.appendChild(replyInputMainStyleDiv)
						
						document.getElementById("replySelectSubDiv" + idx).appendChild(replyReplyMainDiv)
						
						// 폼 생성 후에 스크립트가 생성되도록 버튼 내부에 스크립트 작성
						document.getElementById('testForm').onsubmit = function(event) {
							event.preventDefault();						
							const formData = new FormData(event.target)	
							const url = '${cpath}/board/read/' + idxBo
							const opt = {
								method: 'POST',
								body: formData,
							}
							fetch(url, opt)
							.then(resp => resp.text())
							.then(text => {
								if(+text == 1) {
									event.target.reset();
									showReplyList();
								} 
								else {
									alert('댓글 입력 실패')
								}
							})
						}
						////////////////////////////////////textarea 글자 체크
						$('#replyReplyCheck').on('keyup', function() {
					        $('#replyReplyCheck_cnt').html("("+$(this).val().length+" / 150)");
					 
					        if($(this).val().length > 150) {
					           $(this).val($(this).val().substring(0, 150));
					           $('replyReplyCheck_cnt').html("(150 / 150)");
					    	}
						});
						////////////////////////////////////textarea 글자 체크
						
					}
				}
				// replyReplyBTN(idx, writer, idxBo) 끝.
				
			// 수정 버튼을 누르면 replySecondDiv를 숨기고 수정 폼을 생성한다.
			function updateReplyBTN(idx, content, idxParent){
 					$(".replySelectSubDiv").empty();
 					$(".replySelectSubDiv").hide();
 					$(".replySecondDiv").show()
 					document.getElementById("replySecondDiv" + idx).style.display='none' 					
					document.getElementById("replySelectSubDiv" + idx).style.display='block'
					
					//사용자 정보 입력 div >> 공백으로 변경
						const replyReplyMainDiv = document.createElement('div')

						const replyInputMainStyleDiv = document.createElement('div')
						if(idxParent == 0){
						replyInputMainStyleDiv.style = "display:flex;background-color: #4e81c0; width:100%;"
						} else {
						replyInputMainStyleDiv.style = "display:flex;background-color: #2d5986; width:100%;"	
						}
						
												
						//댓글 리스트, 수정, 삭제 관련 div//
						const replyInputMainDiv = document.createElement('div')
						replyInputMainDiv.style = "margin: 0.7%; display:flex; height :87px; width:100%;"
						
						const replyInputSecondDiv = document.createElement('div')
						replyInputSecondDiv.style = "width:100%;"
							
						const updateForm = document.createElement('form')
						updateForm.setAttribute("id", "updateForm")
						updateForm.style = "display:flex; width:100%;"
						
						const updateFormBlank = document.createElement('div')
						updateForm.appendChild(updateFormBlank)
						
						
									
						const inputIdxparent = document.createElement('input')
						inputIdxparent.name="idxRe"
						inputIdxparent.value = idx
						inputIdxparent.type = 'hidden'
						updateForm.appendChild(inputIdxparent)
							
						const textarea = document.createElement('textarea')
						textarea.name="content"
						////////////////////////////////////textarea 글자 체크
						textarea.setAttribute("id", "replyReplyCheck")
						////////////////////////////////////textarea 글자 체크
						textarea.placeholder=content
						textarea.style = "width : 100%; height : 70px;  resize:none;"
						textarea.required="required"
						updateForm.appendChild(textarea)
						replyInputSecondDiv.appendChild(updateForm)
						////////////////////////////////////textarea 글자 체크
						const testCntDiv = document.createElement('div')
						testCntDiv.setAttribute("id", "replyReplyCheck_cnt")
						testCntDiv.style = "text-align: right;"
						testCntDiv.innerHTML = "(0/150)"
						replyInputSecondDiv.appendChild(testCntDiv)
						////////////////////////////////////textarea 글자 체크


						replyInputMainDiv.appendChild(replyInputSecondDiv)
						
						// 서브밋 버튼 부분														
						const submit = document.createElement('input')
						submit.style = "font-size:20px; width : 70px; height : 70px; "
						submit.type = 'submit'
						submit.value = '✔️'
						updateForm.appendChild(submit)
						
						replyInputMainStyleDiv.appendChild(replyInputMainDiv)
					
						replyReplyMainDiv.appendChild(replyInputMainStyleDiv)
					
						document.getElementById("replySelectSubDiv" + idx).appendChild(replyReplyMainDiv)
						
						document.getElementById('updateForm').onsubmit = function(event) {
							event.preventDefault();						
							const formData = new FormData(event.target)	// formData는 내부 속성이 없다.
							const ob = {}
							for (key of formData.keys()) {
								ob[key] = formData.get(key)	// formData에서 key가 name에 해당한다. key를 전달하여 value를 받는다
							}
							const url = '${cpath}/board/read/updateReply/'
							const opt = {
								method: 'PUT',
								body: JSON.stringify(ob),
								headers: {
									'Content-Type' : 'application/json; charset=utf-8',	
								}
							}
						
							fetch(url, opt)
							.then(resp => resp.text())
							.then(text => {
								if(+text == 1) {
									event.target.reset();
									showReplyList();
									
								} 
								else {
									alert('댓글 수정 실패')
								}
							})
						}
						
						////////////////////////////////////textarea 글자 체크
						$('#replyReplyCheck').on('keyup', function() {
					        $('#replyReplyCheck_cnt').html("("+$(this).val().length+" / 150)");
					 
					        if($(this).val().length > 150) {
					           $(this).val($(this).val().substring(0, 150));
					           $('replyReplyCheck_cnt').html("(150 / 150)");
					    	}
						});
						////////////////////////////////////textarea 글자 체크
						
						//취소버튼
							const updateReplyCancleBtn = document.createElement('button')
							updateReplyCancleBtn.setAttribute("idx", idx)
							updateReplyCancleBtn.style = "font-size:20px; width : 70px; height : 70px; background-color : #efefef;"
							updateReplyCancleBtn.addEventListener ("click", function() {
								event.preventDefault();	
							const idx = $(this).attr("idx");
							$(".replySelectSubDiv").empty()
			 				$(".replySelectSubDiv").hide()
			 				$(".replySecondDiv").show()
							})
							updateReplyCancleBtn.innerText="❌"
							updateFormBlank.appendChild(updateReplyCancleBtn)
						}
						// updateReplyBTN(idx, content, idxParent) 끝
			</script>
			
			<script>
			// 삭제 버튼 동작
			function deleteReplyBTN(idx){
          		const url = "${cpath}/board/read/replyDelete/" + idx
	         	const opt = {
	        			method: 'DELETE'		
	        		}
	        		fetch(url, opt)
	        		.then(resp => resp.text())		
	        		.then(text => {
	        			if(text == 1) {	
	        				showReplyList();
	        			}
	        			else {
	        				window.alert('댓글 삭제 실패 ')
	        			}
	        		})

	          	}
			</script>
			
			<script>
			// 메인 댓글 입력
			document.getElementById('replyInputForm').onsubmit = function(event) {
				event.preventDefault();						
				const formData = new FormData(event.target)	
				const url = '${cpath}/board/read/' + idxBo
				const opt = {
					method: 'POST',
					body: formData,

				}
				fetch(url, opt)
				.then(resp => resp.text())
				.then(text => {
					if(+text == 1) {
						event.target.reset();
						showReplyList();
					} 
					else {
						alert('댓글 입력 실패')
					}
				})

			}
			</script>
			
			<script>
			// 좋아요 버튼 실행 insert
			function replyLikeDo(likeIdxRe, likeId){
				const ob = {"likeIdxRe" : likeIdxRe, "likeId" : likeId}
				const url = '${cpath}/board/read/replyLikeDo/'
				const opt = {
					method: 'POST',
					body: JSON.stringify(ob),
					headers: {
						'Content-Type' : 'application/json; charset=utf-8',	
					}
				}
				fetch(url, opt).then(resp => resp.text())
				.then(text => {
					if(text == 1) {
						showReplyList()
					} else {
						alert("좋아요 실패")
					}
				})
				
			}
			// 좋아요 버튼 취소 delete
			function replyLikeUndo(likeIdxRe, likeId){
				const ob = {"likeIdxRe" : likeIdxRe, "likeId" : likeId}
				const url = '${cpath}/board/read/replyLikeUndo/'
				const opt = {
					method: 'POST',
					body: JSON.stringify(ob),
					headers: {
						'Content-Type' : 'application/json; charset=utf-8',	
					}
				}
				fetch(url, opt).then(resp => resp.text())
				.then(text => {
					if(text == 1) {
						showReplyList()
					} else {
						alert("취소 실패")
					}
				})
				
			}
			
			// jcw 06-25 코드 정리 끝
			</script>
		

				
				</body>
				</html>