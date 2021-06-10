<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="../header.jsp" %>

	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100 ver1 m-b-110">
					
					<form method="POST" enctype="multipart/form-data">
					<div class="table100-head">
						<table>
							<thead>
								<tr>
									<th>글제목</th>
									<th><input type="text" name="title"  placeholder="제목을 입력하세요" required></th>
									<th>작성자</th>
									<th><input type="text" name="writer"  placeholder="작성자" required></th>
<%--             						<th>${sessionScope.sessionID}</th> --%>
								</tr>
							</thead>
						</table>
					</div>

			
					<div class="table100-body js-pscroll">
								<textarea style="resize: none;" rows="5" cols="164" name="content"  placeholder="내용을 입력하세요" required> </textarea>	
					
					</div>
					
					<div>
					<input type="file" name="file">
			
					<input style=  "float:right;" type="submit" value="작성하기">
					</div>
						
					</form>
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