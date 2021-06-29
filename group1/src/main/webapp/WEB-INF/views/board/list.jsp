<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../header.jsp" %>
<script>
// 	const cpath= '${cpath}';
	const idxBo = '${dto.idxBo}';
	
	console.log('idxBo : ' + idxBo)
	
	
</script>



<style>
.sb {
		max-width: 1300px;
		padding: 10px 0px;
		display: flex;
		justify-content: space-between;
		background-color: #6c7ae0;
}
.sb > form >span{
		display: inline-block;

}

.sb > form >span >select {
		border:none;
		border-radius:0;
		display: inline-block;
		background-color: #6c7ae0;
		color: #FFFFFF;
}


.sb > form> span >input {
		background-color: #6c7ae0;
		color: #FFFFFF;
}

.sb > form> span >input::placeholder {
		background-color: #6c7ae0;
		color: #FFFFFF;
}

.sb >span > a {
		color: #FFFFFF;
		margin: 10px;
}
		
	

</style>
	<div class="limiter" style="padding-top: 75px; width:1000px; height:800px;">
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100 ver1 m-b-110">
					<div class="table100-head">
						<table>
							<thead>
								<tr class="row100 head">
									<th class="cell100 column1"><button style="color: #FFFFFF;" id="newNumber" >최신</button></th>
									<th class="cell100 column2"><button style="color: #FFFFFF;" id="viewNumber" >조회수</button></th>
									<th class="cell100 column3"><button style="color: #FFFFFF;" id="likeNumber">추천수</button></th>
								</tr>
							</thead>
						</table>
					</div>

					<div class="table100-body js-pscroll">
							<table>
							<tbody>
							<c:forEach var="dto" items="${list }">
								<tr class="row100 body">
									<td class="cell100 column1 titleArea"><a href="${cpath }/board/read/${dto.idxBo}?type=${param.type }&search=${param.search}&vc=true">${dto.title}</a></td>
									<td class="cell100 column2 viewCountArea">${ dto.viewCount}</td>
									<td class="cell100 column3 likeCountArea">${ dto.likeCount}</td>
								</tr>
							</c:forEach>
						</table>
						
					<div class= "sb">
							<form>
								<span >
								<select  name="type">
									<option ${param.type == 'title' ? 'selected' : '' } value="title">제목</option>
									<option ${param.type == 'writer' ? 'selected' : '' } value="writer">글쓴이</option>
									<option ${param.type == 'content' ? 'selected' : '' } value="content">내용</option>
								</select>
								</span>
								
								<span><input type="text" name="search" value="${param.search }" placeholder="검색어를 입력하세요"></span>
                        		<span><input type="submit" value="검색"></span>
                    			 </form>
                    			 
								<c:if test="${not empty login.nickName }">
								<span style=  "justify-content: space-between; "><a href="${cpath}/board/mylist/${login.nickName}">나의 글</a><a href="${cpath}/board/write">글쓰기</a></span>
								</c:if>
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
	<script src="${cpath }/resources/js/board/sortList.js"></script>
	
</body>
</html>