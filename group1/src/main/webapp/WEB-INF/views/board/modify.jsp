<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="../header.jsp" %>
 <% 	request.setCharacterEncoding("UTF-8"); %>
 <style>
.sb {
		max-width: 1300px;
		padding: 10px 0px;
		display: flex;
		justify-content: space-between;
		background-color: #6c7ae0;
}


.sb > input {
color: #FFFFFF;
float:right;
}
</style>
<!-- 611 김선진 -->
	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100 ver1 m-b-110">
					
					<form method="POST" enctype="multipart/form-data" accept-charset="UTF-8">
					<div class="table100-head">
						<table>
							<thead>
								<tr>
									<th style="background:${clubColor}; color: #FFFFFF;" ><input style="background:${clubColor}; type="text" name="title"  placeholder="${dto.title }" required></th>
									<input type="hidden" name="writer"  value="${login.nickName }">
								</tr>
							</thead>
						</table>
					</div>

			
					<div class="table100-body js-pscroll">
								<textarea style="resize: none;" rows="5" cols="164" name="content"  placeholder="${dto.content}"  required> </textarea>	
					
					</div>
					
					<div class='sb' style="background:#3A066B; color="#FFFFFF;">
					
					<input type="file" name="file">
					<c:if test="${not empty dto.uploadFile }">
					현재 파일 : ${dto.uploadFile }
					</c:if>
				
					<input style= background:#3A066B; type="submit" value="수정하기">
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