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
}

input::placeholder {color:#FFFFFF;}
	

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
<!-- 									<th>글제목</th> -->
									<c:if test="${login.club== 'Manchester United' }">
									<th style="background:#C70101; color: #FFFFFF;"><input type="text" name="title" placeholder="제목을 입력하세요" required style="background:#C70101; color: #FFFFFF;" ></th>
		<%-- 									<th>작성자:${login.nickName}</th> --%>
									<th style="background:#C70101; color: #FFFFFF;"><input type="hidden" name="writer"  value="${login.nickName } style="background:#C70101; color: #FFFFFF;"></th>
									<th><input type="hidden" name="clubName"  value="${login.club } style="background:#C70101; color: #FFFFFF;"></th>
									</c:if>
									
									<c:if test="${login.club== 'Liverpool' }">
									<th style="background:#E31B23; color: #FFFFFF;"><input type="text" name="title" placeholder="제목을 입력하세요" required style="background:#E31B23; color: #FFFFFF;" ></th>
		<%-- 									<th>작성자:${login.nickName}</th> --%>
									<th style="background:#E31B23; color: #FFFFFF;"><input type="hidden" name="writer"  value="${login.nickName }" ></th>
									<th style="background:#E31B23; color: #FFFFFF;"><input type="hidden" name="clubName"  value="${login.club } " ></th>
									</c:if>
									
									<c:if test="${login.club== 'Chelsea' }">
									<th style="background:#162E59; color: #FFFFFF;"><input type="text" name="title" placeholder="제목을 입력하세요" required style="background:#162E59; color: #FFFFFF;" ></th>
		<%-- 									<th>작성자:${login.nickName}</th> --%>
									<th style="background:#162E59; color: #FFFFFF;"><input type="hidden" name="writer"  value="${login.nickName }" ></th>
									<th style="background:#162E59; color: #FFFFFF;"><input type="hidden" name="clubName"  value="${login.club } " ></th>
									</c:if>
									
									<c:if test="${login.club== 'Manchester City' }">
									<th style="background:#98C5E9; color: #FFFFFF;"><input type="text" name="title" placeholder="제목을 입력하세요" required style="background:#98C5E9; color: #FFFFFF;" ></th>
		<%-- 									<th>작성자:${login.nickName}</th> --%>
									<th style="background:#98C5E9; color: #FFFFFF;"><input type="hidden" name="writer"  value="${login.nickName }" ></th>
									<th style="background:#98C5E9; color: #FFFFFF;"><input type="hidden" name="clubName"  value="${login.club } " ></th>
									</c:if>
									
									<c:if test="${login.club== 'Arsenal' }">
									<th style="background:#F00000; color: #FFFFFF;"><input type="text" name="title" placeholder="제목을 입력하세요" required style="background:#F00000; color: #FFFFFF;" ></th>
		<%-- 									<th>작성자:${login.nickName}</th> --%>
									<th style="background:#F00000; color: #FFFFFF;"><input type="hidden" name="writer"  value="${login.nickName }" ></th>
									<th style="background:#F00000; color: #FFFFFF;"><input type="hidden" name="clubName"  value="${login.club } " ></th>
									</c:if>
								</tr>
							</thead>
						</table>
					</div>

			
					<div class="table100-body js-pscroll">
								<textarea style="resize: none;" rows="5" cols="164" name="content"  placeholder="내용을 입력하세요" required> </textarea>	
					
					</div>
					
					<c:if test="${login.club== 'Liverpool' }">
					<div class='sb' style="background:#E31B23;">
					
					<input type="file" name="file"  id="file" style="background:#E31B23; ">
				
					<input style= background:#E31B23;  "float:right;" type="submit" value="작성하기"  >
					</div>
					</c:if>
					
					
					<c:if test="${login.club== 'Manchester United' }">
					<div class='sb' style="background:#FFFFFF;">
					
					<input type="file" name="file" style="background:#FFFFFF;">
				
					<input style= background:#FFFFFF;  "float:right;" type="submit" value="작성하기"  >
					</div>
					</c:if>
					
					<c:if test="${login.club== 'Chelsea' }">
					<div class='sb' style="background:#162E59;">
					
					<input type="file" name="file" style="background:#162E59;">
				
					<input style= background:#162E59;  "float:right;" type="submit" value="작성하기"  >
					</div>
					</c:if>
					
					
					<c:if test="${login.club== 'Manchester City' }">
					<div class='sb' style="background:#98C5E9;">
					
					<input type="file" name="file" style="background:#98C5E9;">
				
					<input style= background:#98C5E9;  "float:right;" type="submit" value="작성하기"  >
					</div>
					</c:if>
					
					<c:if test="${login.club== 'Arsenal' }">
					<div class='sb' style="background:#F00000;">
					
					<input type="file" name="file" style="background:#F00000;">
				
					<input style= background:#F00000;  "float:right;" type="submit" value="작성하기"  >
					</div>
					</c:if>
						
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