<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="cpath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" href="${cpath }/resources/style/images/icons/favicon.ico"/>
	<title>
		 EPL Fan Site
	</title>
	
	
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="stylesheet" href="${cpath }/resources/boots.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${cpath }/resources/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${cpath }/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${cpath }/resources/vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${cpath }/resources/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${cpath }/resources/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" href="${cpath }/resources/css/main.css">
	<link rel="stylesheet" href="${cpath }/resources/css/util.css">
<!--===============================================================================================-->
	
</head>
<body>

	<header>
		<div class="col-lg-8 col-md-7 col-sm-6">
            <span style="display: inline-block; width: 45px; height: 75px;"><img src="${cpath }/resources/images/icons/premier-league-2-logo.png" style="width: 45px; height: 75px;"></span>
            <span style="display: inline-block;"><h1>EPL Fan Site</h1></span>
            <p class="lead">The medium is the message</p>
         </div>
	
		
	
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
		  <div class="container-fluid">
		    
		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		
		    <div class="collapse navbar-collapse" id="navbarColor03">
		      <ul class="navbar-nav me-auto" style="margin: auto;">
		        <li class="nav-item">
		          <a class="nav-link active" href="#">Liverpool
		            <span class="visually-hidden">(current)</span>
		          </a>
		        </li>
		        
		        <li class="nav-item">
		          <a class="nav-link" href="#">MU</a>
		        </li>
		        
		        <li class="nav-item">
		          <a class="nav-link" href="#">MC</a>
		        </li>
		        
		        <li class="nav-item">
		          <a class="nav-link" href="#">
					<img src="${cpath }/resources/images/logo/Chelsea.png" >
				  </a>
		        </li>
		        
		        <li class="nav-item">
		          <a class="nav-link" href="#">Arsenal</a>
		        </li>
		        
		        <li class="nav-item">
		          <a class="nav-link" href="#">Tottenham</a>
		        </li>
		        
<!-- 		        <li class="nav-item dropdown"> -->
<!-- 		          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Dropdown</a> -->
<!-- 		          <div class="dropdown-menu"> -->
<!-- 		            <a class="dropdown-item" href="#">Action</a> -->
<!-- 		            <a class="dropdown-item" href="#">Another action</a> -->
<!-- 		            <a class="dropdown-item" href="#">Something else here</a> -->
<!-- 		            <div class="dropdown-divider"></div> -->
<!-- 		            <a class="dropdown-item" href="#">Separated link</a> -->
<!-- 		          </div> -->
<!-- 		        </li> -->
		        
		      </ul>
		      
		      
		    </div>
		  </div>
		</nav>
	</header>

	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100 ver1 m-b-110">
					<div class="table100-head">
						<table>
							<thead>
								<tr>
									<th>글제목<input type="text" name="title"  placeholder="제목을 입력하세요" required></th>
									
								</tr>
							</thead>
						</table>
					</div>

			
					<div class="table100-body js-pscroll">
								<textarea style="resize: none;" rows="5" cols="164"   name="content"  placeholder="내용을 입력하세요" required> </textarea>	
					
					</div>
					
					<div style= padding-bottom: 20px; margin-bottom: 20px;">
					
					<td>첨부이미지</td>
					<input type="file" name="file">
					
					</div>
					<div style=  "float:right;">
					<input type="submit" value="작성하기">
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