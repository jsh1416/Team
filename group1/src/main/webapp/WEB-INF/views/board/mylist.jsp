<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../header.jsp" %>


<!--  0630 bcg -->
<style>
	.limiter::before{
		content: "";
        background: url(${cpath}/resources/images/background/${login.club}/4.png);
        background-size: cover;
        opacity: 0.5;
        position: absolute;
        top: 0px;
        left: 0px;
        right: 0px;
        bottom: 0px;
	}
</style>


	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100 ver1 m-b-110">
					<div class="table100-head">
						<table>
							<thead>
								<tr class="row100 head">
									<th class="cell100 column1" style="background:${clubColor};"><button style="color: #FFFFFF;" id="newNumber" ><h6>Title</h6></button></th>
									<th class="cell100 column2" style="background:${clubColor};"><button style="color: #FFFFFF;" id="viewNumber" ><h6>View</h6></button></th>
									<th class="cell100 column3" style="background:${clubColor};"><button style="color: #FFFFFF;" id="likeNumber"><h6>Like</h6></button></th>
									<th class="cell100 column3" style="background:${clubColor};"><button style="color: #FFFFFF;" id="writer"><h6>Writer</h6></button></th>
									<th class="cell100 column3" style="background:${clubColor};"><button style="color: #FFFFFF;" id="wdate"><h6>Date</h6></button></th>
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
									<td class="cell100 column1"><a href="${cpath }/board/read/${dto.idxBo}?type=${param.type }&search=${param.search }&vc=true">${dto.title}</a></td>
									<td class="cell100 column2">${ dto.viewCount}</td>
									<td class="cell100 column3">${ dto.likeCount}</td>
									<td class="cell100 column3">${ dto.writer}</td>
									<td class="cell100 column3">${ dto.wdate}</td>
								</tr>
							</c:forEach>
						</table>
						<div class="sb" style="justify-content: right;  background:${clubColor};">
								<span style="margin-left: 90%;">
									<a href="${cpath}/board/write">글쓰기</a>
								</span>
						</div>			
								
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