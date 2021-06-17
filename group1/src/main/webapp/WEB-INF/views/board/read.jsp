<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<div class="limiter">
	<div class="container-table100">
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

				<div class="table100-body js-pscroll">
					<table>
						<tbody>
<!-- 						업로드 -->
							<tr class="row100 body">
								<c:if test="${not empty dto.uploadFile }">
								<div><img src="${cpath }/upload/${dto.uploadFile }" width="100%" height="250px"></div>
								</c:if>
								<pre>${dto.content }</pre>
							</tr>
							
							
							
<!-- 							자신이 작성한것만 수정 삭제 가능 -->
							<c:if test="${login.nickName == dto.writer}"> 
							<button style=  "float:right;" id="modifyBtn">수정</button>
							<button style=  "float:right;" id="deleteBtn">삭제 </button>
							</c:if>
					</table>
				</div>
				</div>
			</div>
		</div>
	</div>
				<script>
				document.getElementById('modifyBtn').onclick = function(event) {
				if(confirm('게시글을 수정하시겠습니까?')) {
				location.href = '${cpath }/board/modify/${dto.idxBO}'
				}
				}
				</script>
					
				<script>
				document.getElementById('deleteBtn').onclick = function(event) {
				if(confirm('게시글을 삭제하시겠습니까?')) {
				location.href = '${cpath }/board/delete?idxBO=${dto.idxBO}'
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

				</body>
				</html>