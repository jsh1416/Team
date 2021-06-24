<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<script>
// 	const cpath= '${cpath}';
	const idxBo = '${dto.idxBo}';
	console.log('idxBo : ' + idxBo)
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
								<th class="cell100 column1">${dto.title}</th> <!-- 글제목 -->
								<th class="cell100 column4">조회:${dto.viewCount} 추천:${dto.likeCount} 댓글:  ${dto.wdate }</th> 
								<th class="cell100 column5">글쓴이:${dto.writer }</th> <!-- 글쓴이 -->
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
								<div><img src="${cpath }/upload/${dto.uploadFile }" width="100%" height="250px"></div>
									<pre style="padding-left:15px; padding-top: 30px; min-height: 480px; text-align: left; ">${dto.content }</pre>
								</c:if>
								
								<c:if test="${empty dto.uploadFile }">
									<pre style="padding-left:15px; padding-top: 30px; min-height: 480px; text-align: left; ">${dto.content }</pre>
								</c:if>
								
							</tr>
							
<%-- 							<c:if test="${not empty login.nickName }"> --%>
								<div class="sb ${login.nickName == dto.writer ? 'hidden': ''}">
									<button id="likeBtn">호</button>
								</div>
<%-- 							</c:if> --%>
							
							<div class="sb ${login.nickName == dto.writer ? '' : 'hidden'}">
									<button style= "float:right;" id="modifyBtn" onclick="modify()">수정</button>
									<button style= "float:right;" id="deleteBtn" onclick="deleteBoard()">삭제</button>
							</div>
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
<!-- 				삭제 -->
				<script src="${cpath }/resources/js/board/deleteboard.js"></script>
<!-- 				수정 -->
				<script src="${cpath }/resources/js/board/modify.js"></script>
				<!--===============================================================================================-->
				
				</script>
				<!--===============================================================================================-->
				<script src="${cpath }/resources/js/main.js"></script>

				<script>
				//  jcw 210620 페이지 로드시 실행될 함수
				$(document).ready(function(){
					showReplyList();

				});

				//jcw 210620 필요 인자 불러오기
				const writer = '${login.id }'

				// jcw 210614 ajax list로 호출 >>>> 수정 할 것
				function showReplyList(){
							$("#mainReplyMain").empty();		// reply div의 내용을 초기화
					const url = "${cpath}/board/read/replyList/"
					const paramData = {"idx" : "${dto.idxBo}"};
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
					$("#cnt").text("등록된 댓글 - " + replys.length)
					// 부모 댓글 번호를 받아서 댓글 입력창을 만든다.
					replys.forEach(function(reply){ 
						if (reply.idxParent == 0) {
							let rc = 0;
							replys.forEach(function(i){
								if (reply.idxRe == i.idxParent) rc++;
							})
							replyWindow(reply, rc)				
						}
					})					
						replys.forEach(function(reply){ 
						if (reply.idxParent != 0) {
							let rc = 0;
							replys.forEach(function(i){
								if (reply.idxRe == i.idxParent) rc++;
							})
							replyWindow(reply, rc)	
							}
						})
					}
				
				// jcw 210614 댓글 출력부분 스크립트
				function replyWindow(reply, rc){
					const replyMainDiv = document.createElement('div')
					replyMainDiv.setAttribute("id", "replyMainDiv" + reply.idxRe)

					const replySecondDiv = document.createElement('div')
					replySecondDiv.setAttribute("id", "replySecondDiv" + reply.idxRe)
					replySecondDiv.setAttribute("class", "replySecondDiv")
					replySecondDiv.style = "display:block;"
					
					const replyMainStyleDiv = document.createElement('div')
					replyMainStyleDiv.style = "display:flex; width:1170px;"
					
					
					//사용자 정보 입력 div
					const replyUserDiv = document.createElement('div')
					replyUserDiv.style = "margin: 0.7%; background-color:#FFF; width:130px;  height :85px;"
						
						const replyNameMainDiv = document.createElement('div')
						replyNameMainDiv.style = " line-height :58px;"
							const replyNameDiv = document.createElement('div')
							replyNameDiv.style = "font-weight: 700; text-align: "
							replyNameDiv.innerHTML = reply.writer
							replyNameMainDiv.appendChild(replyNameDiv)
							replyUserDiv.appendChild(replyNameMainDiv)

						const replyWdateDiv = document.createElement('div')
						replyWdateDiv.style = "height: 12px;  font-size: 10px; text-align: right;"
						replyWdateDiv.innerHTML = reply.wdate
						replyUserDiv.appendChild(replyWdateDiv)
					
					//댓글 리스트, 수정, 삭제 관련 div
					const replyListMainDiv = document.createElement('div')
					replyListMainDiv.style = "margin: 0.7%; background-color:#fff; width:990px; height :85px;"
					
					const replyListSecondDiv = document.createElement('div')
					
					const replyListInnerDiv = document.createElement('div')
					replyListInnerDiv.style = "display:flex;"
					
					// 댓글 내용과 댓글 정보, 수정, 버튼 div
					const replyListListDiv = document.createElement('div')
					replyListListDiv.style = "width:990px; border: 1px solid #dadada;  height :85px;"
					
					const replyListContentDiv = document.createElement('div')
					replyListContentDiv.style = "display:flex; line-height :58px;"
						const replyContentPtag =  document.createElement('div')
						replyContentPtag.style = "valign:middle;"
						if(rc != 0){						
						replyContentPtag.innerHTML = reply.content + "(" + rc + ")"
						} else {
						replyContentPtag.innerHTML = reply.content
						}
						
						replyListContentDiv.appendChild(replyContentPtag)
										
					//대댓글, 수정, 삭제 버튼
					const replyListSelectBtnDiv = document.createElement('div')
					replyListSelectBtnDiv.style = "text-align: right;"
											
						// 대댓글 입력 버튼
						if (writer != "") {							
						if (reply.idxParent == 0){	
						const replyReplyBtn = document.createElement('button')
						replyReplyBtn.setAttribute("id", "replyReplyBtn" + reply.idxRe)
						replyReplyBtn.setAttribute("idxre", reply.idxRe)
						replyReplyBtn.setAttribute("idxparent", reply.idxParent)
						replyReplyBtn.setAttribute("idxbo", reply.idxBo)
						replyReplyBtn.setAttribute("writer", writer)
						replyReplyBtn.addEventListener ("click", function() {
						const idx = $(this).attr("idxre");
						const writer = $(this).attr("writer");
						const idxBo = $(this).attr("idxbo");
						replyReplyBTN(idx, writer, idxBo)	//댓글창 form 생성을 구현할 것. class 초기화후 id생성.	
						})
						replyReplyBtn.innerText="↘답글"
						replyListSelectBtnDiv.appendChild(replyReplyBtn)
						}
						
						}
						
					
					
						//댓글 수정, 삭제 버튼
						if (reply.writer == writer) {
						const updateReplyBtn = document.createElement('button')
						updateReplyBtn.setAttribute("id", "updateReplyBtn" + reply.idxRe)
						updateReplyBtn.setAttribute("idxre", reply.idxRe)
						updateReplyBtn.setAttribute("content", reply.content)
						updateReplyBtn.setAttribute("idxparent", reply.idxParent)
						updateReplyBtn.addEventListener ("click", function() {
						const idx = $(this).attr("idxre");
						const content = $(this).attr("content");
						const idxParent = $(this).attr("idxparent");
						updateReplyBTN(idx, content, idxParent)   //댓글창 form 생성을 구현할 것. class 초기화후 id생성.
						
						})
						updateReplyBtn.innerText="↘수정"
						replyListSelectBtnDiv.appendChild(updateReplyBtn)
										
						// jcw 210617 댓글 삭제 >> 속성값에 idxRe 인자를 주어 삭제 실행
						const deleteReplyBtn = document.createElement('button')
						deleteReplyBtn.setAttribute("id", "deleteReplyBtn")
						deleteReplyBtn.setAttribute("idxre", reply.idxRe)
						deleteReplyBtn.innerText="↘삭제"
						deleteReplyBtn.addEventListener ("click", function() {
							const idx = $(this).attr("idxre");
							deleteReplyBTN(idx)	//댓글창 form 생성을 구현할 것. class 초기화후 id생성.
						         	
						})
						replyListSelectBtnDiv.appendChild(deleteReplyBtn)
						}
										
					replyListListDiv.appendChild(replyListContentDiv)
					replyListListDiv.appendChild(replyListSelectBtnDiv)
					//
					replyListInnerDiv.appendChild(replyListListDiv)
					//
					
					// 좋아요 구현할 버튼 부분
					const replyListMainBtnDiv = document.createElement('div')
					replyListMainBtnDiv.style = "background-color:#dadada; width:100px;"
					replyListInnerDiv.appendChild(replyListMainBtnDiv)
										
					// 버튼으로 생성된 form이 붙을 위치
					const replySelectSubDiv = document.createElement('div')
					replySelectSubDiv.setAttribute("id", "replySelectSubDiv" + reply.idxRe)
					replySelectSubDiv.setAttribute("class", "replySelectSubDiv")
					replySelectSubDiv.style = "background-color: #4e81c0; width:1170px; height :85px; display:none;"
													
					replyListSecondDiv.appendChild(replyListInnerDiv)
					//					
					replyListMainDiv.appendChild(replyListSecondDiv)
					
					
					
					//추가
					replyMainStyleDiv.appendChild(replyUserDiv)
					replyMainStyleDiv.appendChild(replyListMainDiv)
					
					replySecondDiv.appendChild(replyMainStyleDiv)
					
					replyMainDiv.appendChild(replySecondDiv)
					replyMainDiv.appendChild(replySelectSubDiv)
					
					
					//대댓글이 보일 위치
					const replySubListDiv = document.createElement('div')
					replySubListDiv.setAttribute("id", "replySubListDiv" + reply.idxRe)
					replySubListDiv.style = "background-color: #2d5986; width:1170px;"
					replyMainDiv.appendChild(replySubListDiv)
					
					// 댓글 분배 디브
					if(reply.idxParent == 0 || document.getElementById("replySubListDiv" + reply.idxParent) == null){
						mainReplyMain.appendChild(replyMainDiv)
					
					}else{
					document.getElementById("replySubListDiv" + reply.idxParent).appendChild(replyMainDiv)
					}
					
				}
					
				
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
							replyInputMainStyleDiv.style = "display:flex;background-color: #2d5986; width:1170px;"
							
							const replyInputUserDiv = document.createElement('div')
							replyInputUserDiv.style = "margin: 0.7%; width:130px;  height :75px;"
						
							const replyInputNameMainDiv = document.createElement('div')
							replyInputNameMainDiv.style = " line-height :58px;"
							const replyInputNameDiv = document.createElement('div')
							replyInputNameDiv.style = "font-weight: 700; text-align: "
							
							replyInputNameMainDiv.appendChild(replyInputNameDiv)
							replyInputUserDiv.appendChild(replyInputNameMainDiv)
							replyInputMainStyleDiv.appendChild(replyInputUserDiv)
							
							
							//댓글 리스트, 수정, 삭제 관련 div//
							const replyInputMainDiv = document.createElement('div')
							replyInputMainDiv.style = "margin: 0.7%; background-color:#fff; display:flex; width:990px; height :70px;"
							
							
							
							const replyInputSecondDiv = document.createElement('div')
							replyInputSecondDiv.style = " width:990px;"
											
							const replyInputContentDiv = document.createElement('div')
							replyInputContentDiv.style = ""
								const replyContentArea =  document.createElement('div')
								replyContentArea.style = "valign:middle;"
								
										//
										const testForm = document.createElement('form')
										testForm.setAttribute("id", "testForm")
										testForm.style = "display:flex;"
										//
								
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
									textarea.placeholder="바른말 고운말을 사용합시다."
									textarea.style = "width : 990px; height : 70px; "
									textarea.required="required"
									testForm.appendChild(textarea)
									
									//
									replyContentArea.appendChild(testForm)
									//
								replyInputContentDiv.appendChild(replyContentArea)
								replyInputSecondDiv.appendChild(replyInputContentDiv)

								replyInputMainDiv.appendChild(replyInputSecondDiv)
								

							// 서브밋 버튼 부분
															
								const submit = document.createElement('input')
								submit.style = "font-size:20px; width : 100px; height : 70px; "
								submit.type = 'submit'
								submit.value = '등록'
								testForm.appendChild(submit)
							
							
									
							replyInputMainStyleDiv.appendChild(replyInputMainDiv)
						
						
							//추가
							
							replyReplyMainDiv.appendChild(replyInputMainStyleDiv)
						
						//test end
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
							console.log(formData)
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
						
					}
						
					}	
			// 수정 버튼을 누르면 replySecondDiv를 숨기고 수정 폼을 생성한다.
			function updateReplyBTN(idx, content, idxParent){
 					$(".replySelectSubDiv").empty();
 					$(".replySelectSubDiv").hide();
 					$(".replySecondDiv").show()
 					document.getElementById("replySecondDiv" + idx).style.display='none' 					
					document.getElementById("replySelectSubDiv" + idx).style.display='block'
					
					
						//수정 test start
						
						
						//사용자 정보 입력 div >> 공백으로 변경
						const replyReplyMainDiv = document.createElement('div')

						const replyInputMainStyleDiv = document.createElement('div')
						if(idxParent == 0){
						replyInputMainStyleDiv.style = "display:flex;background-color: #4e81c0; width:1170px;"
						} else {
						replyInputMainStyleDiv.style = "display:flex;background-color: #2d5986; width:1170px;"	
						}
						
						
						
						const replyInputUserDiv = document.createElement('div')
						replyInputUserDiv.style = "margin: 0.7%; width:130px;  height :75px;"
					
						const replyInputNameMainDiv = document.createElement('div')
						replyInputNameMainDiv.style = " line-height :58px;"
						const replyInputNameDiv = document.createElement('div')
						replyInputNameDiv.style = "font-weight: 700; text-align: "
						
						replyInputNameMainDiv.appendChild(replyInputNameDiv)
						
						
						
						
						replyInputNameMainDiv.appendChild(replyInputNameDiv)
						replyInputUserDiv.appendChild(replyInputNameMainDiv)
						replyInputMainStyleDiv.appendChild(replyInputUserDiv)
						

						
						//댓글 리스트, 수정, 삭제 관련 div//
						const replyInputMainDiv = document.createElement('div')
						replyInputMainDiv.style = "margin: 0.7%; background-color:#fff; display:flex; width:990px; height :70px;"
						
						
						
						const replyInputSecondDiv = document.createElement('div')
						replyInputSecondDiv.style = " width:990px;"
										
						const replyInputContentDiv = document.createElement('div')
						replyInputContentDiv.style = ""
							const replyContentArea =  document.createElement('div')
							replyContentArea.style = "valign:middle;"
							
									//
									const updateForm = document.createElement('form')
									updateForm.setAttribute("id", "updateForm")
									updateForm.style = "display:flex;"
									//
									
									const inputIdxparent = document.createElement('input')
								    inputIdxparent.name="idxRe"
								    	inputIdxparent.value = idx
								    	inputIdxparent.type = 'hidden'
								    		updateForm.appendChild(inputIdxparent)
							
								const textarea = document.createElement('textarea')
								textarea.name="content"
								textarea.placeholder=content
								textarea.style = "width : 990px; height : 70px; "
								textarea.required="required"
									updateForm.appendChild(textarea)
								
								//
								replyContentArea.appendChild(updateForm)
								//
							replyInputContentDiv.appendChild(replyContentArea)
							replyInputSecondDiv.appendChild(replyInputContentDiv)

							replyInputMainDiv.appendChild(replyInputSecondDiv)
							

						// 서브밋 버튼 부분
														
							const submit = document.createElement('input')
							submit.style = "font-size:20px; width : 100px; height : 70px; "
							submit.type = 'submit'
							submit.value = '수정'
								updateForm.appendChild(submit)
						
						
								
						replyInputMainStyleDiv.appendChild(replyInputMainDiv)
					
					
						//추가
						
						replyReplyMainDiv.appendChild(replyInputMainStyleDiv)
					
					//test end

					
					
					
					
					document.getElementById("replySelectSubDiv" + idx).appendChild(replyReplyMainDiv)
					

			
					///// 오류
					document.getElementById('updateForm').onsubmit = function(event) {
						event.preventDefault();						
						const formData = new FormData(event.target)	// formData는 내부 속성이 없다.
						const ob = {}
						for (key of formData.keys()) {
							ob[key] = formData.get(key)	// formData에서 key가 name에 해당한다. key를 전달하여 value를 받는다
						}
						console.log(JSON.stringify(ob))
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
					
							
						
						//취소버튼
							const updateReplyCancleBtn = document.createElement('button')
							updateReplyCancleBtn.setAttribute("idx", idx)
							updateReplyCancleBtn.addEventListener ("click", function() {
								event.preventDefault();	
							const idx = $(this).attr("idx");
							$(".replySelectSubDiv").empty()
			 				$(".replySelectSubDiv").hide()
			 				$(".replySecondDiv").show()
							})
							updateReplyCancleBtn.innerText="↘취소"
							replyInputNameMainDiv.appendChild(updateReplyCancleBtn)
						}
					
			</script>
			
			<script>
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
				console.log(formData)
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



				
				</body>
				</html>