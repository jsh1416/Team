<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="../header.jsp" %>
 <% 	request.setCharacterEncoding("UTF-8"); %>
<style>
.sb {
		max-width: 1300px;
		padding: 0px;
		display: flex;
		justify-content: space-between;
		background-color: #6c7ae0;
}


.sb > input {
color: #FFFFFF;
float:right;
}

.file_input label {
    position:relative;
    cursor:pointer;
    display:inline-block;
    vertical-align:middle;
    overflow:hidden;
    width:100px;
    height:30px;
    background: #3A066B ;
    color:#fff;
    text-align:center;
    line-height:30px;
}
.file_input label input {
    position:absolute;
    width:0;
    height:0;
    overflow:hidden;
}
.file_input input[type=text] {
    vertical-align:middle;
    display:inline-block;
    width:400px;
    height:28px;
    line-height:28px;
    font-size:11px;
    padding:0;
    border:0;
    border:1px solid #777;
}

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
									<th style="background:${clubColor}; color: #FFFFFF;"><input type="text" name="title" placeholder="제목을 입력하세요" required style="background:${clubColor}; color: #FFFFFF;"></th>
 									<th style="background:${clubColor}; color: #FFFFFF; text-align: right;">작성자:${login.nickName}</th>
									<input type="hidden" name="writer"  value="${login.nickName}">
									<input type="hidden" name="clubName"  value="${login.club}">
								</tr>
							</thead>
						</table>
					</div>

			
					<div class="table100-body js-pscroll" style="overflow:auto;">
								<textarea style="wrap=:hard;  white-space: pre-wrap; word-wrap: break-word; word-break: break-word;
								resize: none;" rows="5" cols="164" name="content"  placeholder="내용을 입력하세요"  required> </textarea>	
					
					</div>
					
					
					<div 	class="sb" style="background:#343a40;">
					
					
					
<!-- 				    <input  class="btn btn-dark"    style="padding-top:5px; padding-left:0px;height:36px"type="file" name="file"> -->
				
					<input type="file" name="file"  id="file" style="background:#343a40; display: none; ">
					<button  type="button" class="btn btn-dark" onclick="document.all.file.click()">파일</button>
					
					<input  class="btn btn-dark"    type="submit" value="작성하기"  >
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