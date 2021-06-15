<!-- header.jsp file 생성  06.09 bong-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="cpath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<!-- 풀페이지 스크롤 링크 jsh 06.14  -->
	<link rel="stylesheet" type="text/css" href="resources/scroll/jquery.fullPage.css" />
	<link rel="stylesheet" type="text/css" href="resources/scroll/examples.css" />
	<link rel="icon" type="image/png" href="${cpath }/resources/images/icons/favicon.ico"/> 
	<title>
		 EPL Fan Site
	</title>
	
	<!-- 0609 jsh -->
	<style>	
			a {
			text-decoration: none;
			cursor: pointer;
			/* 06.11 봉찬균 a tag color 변경 */
/* 			color: #3A0640;
			font-size: 13pt;   EPL PAN SITE 폰트 효과 깨져서 주석 처리 jsh 06.14   */
			}
			
			
			nav {
				border: 0px !important;	
				height: 60px;
			}
			
			header {
				position: fixed;
				height: 65px;
				display: block;
				width: 100%;
				background-color: white;
				z-index: 9;
				text-align: center;
				padding: 0 0 0 0;
				top: 0px;
			}

			footer {
				position: fixed;
				height: 45px;
				display: block;
				width: 100%;
				background: #333;
				z-index: 9;
				text-align: center;
				color: #f2f2f2;
				padding: 0 0 0 0;
				bottom: 0px;
			}
			
			img {
				margin-right: 20px;
			}

		<!-- 06.11 봉찬균 한글폰트-->
		@import url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Noto+Sans+KR&display=swap');

		
		.google-font{
/* 			font-family: 'Black Han Sans', sans-serif; */
			font-family: 'Noto Sans KR', sans-serif;
		}
		
		.checkmsg{
			font-family: cursive;
		}
		
		/* 6.11 봉찬균 */
		/* 입력조건에 따라 테두리 색 바꾸는 클래스  / join에서 사용*/
		input.reborder { border: 1px solid red }		
		
		.btn-EPL{
			background-color: #3A066B !important;
			border-color: #37003C !important;
		}
		
	</style>
	
	
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- 링크 복붙 jsh 06.14  -->
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
	<link rel="stylesheet" href="${cpath }/resources/css/main.css">
	<link rel="stylesheet" href="${cpath }/resources/css/util.css">

<!--=============================================섹션 스크롤 추가 0610 jsh ==================================================-->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
	<script type="text/javascript" src="resources/scroll/scrolloverflow.js"></script>
	<script type="text/javascript" src="resources/scroll/jquery.fullPage.js"></script>
	<script type="text/javascript" src="resources/scroll/examples.js"></script>
	<!-- 스크롤 기능 jsh 06.14  -->
	<script type="text/javascript">
		$(document).ready(function() {
			$('#fullpage').fullpage({
				anchors: ['firstPage', 'secondPage', 'thirdPage'],
				navigation: true,
				css3: true,
				keyboardScrolling: true
			});
		});
	</script>
	
</head>
<body>

	<!-- css 수정 jsh 06.14 -->
	<header>  
	<div style="display: inline-block; float: left;">
            <span style="display: inline-block; width: 45px; height: 65px;"><img src="${cpath }/resources/images/icons/premier-league-2-logo.png" style="width: 45px; height: 65px; vertical-align;"></span>
            <span style="display: inline-block;"><h1><a href="${cpath}" style="color: #3A0640;">EPL Fan Site</a></h1></span>
<!--             <p class="lead">The medium is the message</p> -->
            
    </div>  
         
 		<!-- 06.09 봉찬균 회원 관련 메뉴 -->	        
         <div style="float: right; display: inline-block; margin-right: 15px; 
         	vertical-align:middle; margin-top: 10px;">
            	
            	<c:if test="${empty login}">
	            	<span><a href="${cpath }/member/login" style="color: #3A0640;">
	            		<img src="${cpath }/resources/images/member/login.png">
	            	</a></span>
            	</c:if>
            	
            	<!-- 06.10 11:34 봉찬균 -->
            	<c:if test="${!empty login}">
	            	<div>
	            		<img src="${cpath }/resources/images/logo/${login.club}.png">
	            		${login.nickName }
	            		<div style="margin-top: 15px; text-align: right; display: inline-block; margin-left: 30px;">
	            			<a href="${cpath }/member/logout" style="color: #E94235; font-weight: bold;">Logout</a>
	            		</div>
	            	</div>
            	</c:if>
            </div>
	
		
		<!-- img에 팀이름 클래스 삽입 jsh 06.14  -->
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
		  <div class="container-fluid">
		    
<!-- 		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button> -->
		
		    <div class="collapse navbar-collapse" id="navbarColor03">
		      <ul class="navbar-nav me-auto" style="margin: auto;">
		        <li class="nav-item">
		          <a>	<!-- nav-link 클래스 제거  -->
					<img class="liv" src="${cpath }/resources/images/logo/Liverpool.png" >
				  </a>
		        </li>
		        
		        <li class="nav-item">
		          <a>
					<img class="mu" src="${cpath }/resources/images/logo/Manchester United.png" >
				  </a>
		        </li>
		        
		        <li class="nav-item">
		          <a>
					<img class="mc" src="${cpath }/resources/images/logo/Manchester City.png" >
				  </a>
		        </li>
		        
		        <li class="nav-item">
		          <a>
					<img class="che" src="${cpath }/resources/images/logo/Chelsea.png" >
				  </a>
		        </li>
		        
		        <li class="nav-item">
		          <a>
					<img class="ars" src="${cpath }/resources/images/logo/Arsenal.png" >
				  </a>
		        </li>
		        
		        
		        <!-- 0610ksj test -->
		        <li class="nav-item">
		          <a href="${cpath }/board/">list</a>
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

<!-- footer 추가  -->	
<footer>
 	footer 
 </footer>

<!-- 팀 로고 클릭 시 해당 페이지로 이동 jsh 06.14 -->
<script>	
	document.querySelectorAll('nav ul > li > a').forEach(a => a.onclick = function(event) {
		const className = event.target.classList[0] // [0]LIV [1]nav-link [2]active
		console.log(className) // LIV
		// LIV page로 이동하게
		location.href="${cpath}/" + className;
	})
</script>
