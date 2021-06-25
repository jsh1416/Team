<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<script>
// 	const cpath= '${cpath}';
	const idxBo = '${dto.idxBo}';
	const boardidx = '${boardidx}';
	const likemember = '${likemember}';
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
								<form>
									<input type="hidden" name="idxBo"  value="${idxBo}">
									<input type="hidden" name="login.nickName"  value="${login.nickName}">
									<button id="likeBtn" onclick="doLike()">메</button>
								</form>
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
		

				
				</body>
				</html>