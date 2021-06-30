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
									<th class="cell100 column1">내 글 목록</th>
									<th class="cell100 column2">조회수</th>
									<th class="cell100 column3">추천수</th>
								</tr>
							</thead>
						</table>
					</div>

					<form method="POST"  accept-charset="UTF-8">
							
							<input type="hidden" name="writer"  value="${login.nickName }">
					</form>
					
					
					<div class="table100-body js-pscroll">
						<table>
							<tbody>
							
							
							
							<c:forEach var="dto" items="${mylist }">
								<tr class="row100 body">
								
									<td class="cell100 column1"><a href="${cpath }/board/read/${dto.idxBO}?type=${param.type }&search=${param.search }&vc=true">${dto.title}</a></td>
									<td class="cell100 column2">${ dto.viewCount}</td>
									<td class="cell100 column3">${ dto.likeCount}</td>
								</tr>
							</c:forEach>
						</table>
						
								<a style=  "float:right;" href="${cpath}/board/write">글쓰기</a>
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