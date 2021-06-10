<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../header.jsp" %>

	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100 ver1 m-b-110">
					<div class="table100-head">
						<table>
							<thead>
								<tr class="row100 head">
									<th class="cell100 column1">최신</th>
									<th class="cell100 column2">조회수</th>
									<th class="cell100 column3">추천수</th>
<%-- 									<th class="cell100 column4"><a href="${cpath}/board/write">글쓰기</a></th> --%>
<%-- 									<th class="cell100 column4"><a href="${cpath}/board/write">글쓰기</a></th> --%>
<!-- 									<th class="cell100 column5">Spots</th> -->
								</tr>
							</thead>
						</table>
					</div>

					<div class="table100-body js-pscroll">
						<table>
							<tbody>
							<c:forEach var="dto" items="${list }">
								<tr class="row100 body">
									<td class="cell100 column1"><a href="${cpath }/board/read/${dto.idxBO}">${dto.title}</a></td>
									<td class="cell100 column2">${dto.viewCount}</td>
									<td class="cell100 column3">${dto.likeCount}</td>
									<td colspan="2 "class="cell100 column4"></td>
<!-- 									<td class="cell100 column4">Aaron Chapman</td> -->
<!-- 									<td class="cell100 column5">10</td> -->
								</tr>
								
								<tr class="row100 body">
								<td class="cell100 column"><a href="${cpath}/board/write">글쓰기</a></td>
								</tr>
								</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
<!--===============================================================================================-->	
	<script src="${cpath }/resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="${cpath }/resources/vendor/bootstrap/js/popper.js"></script>
	<script src="${cpath }/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="${cpath }/resources/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="${cpath }/resources/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function(){
			var ps = new PerfectScrollbar(this);

			$(window).on('resize', function(){
				ps.update();
			})
		});
			
		
	</script>
<!--===============================================================================================-->
	<script src="${cpath }/resources/js/main.js"></script>

</body>
</html>