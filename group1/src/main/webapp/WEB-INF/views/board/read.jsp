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
								<th class="cell100 column4">조회${dto.viewCount} 추천${dto.likeCount} 댓글</th>
								<th class="cell100 column5">${dto.wdate }</th> <!-- 날짜 -->
							</tr>
						</thead>
					</table>
				</div>

				<div class="table100-body js-pscroll">
					<table>
						<tbody>
							<tr class="row100 body">
								<td>${dto.content }</td>
							</tr>

							<tr>
								<td>첨부이미지</td>
								<%-- <td><img src="${cpath }/upload/${dto.uploadFile}" width="200px"></td> --%>
							</tr>
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