<!-- header.jsp file 생성  06.09 bong-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="cpath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>

<!-- 06.14 bcg -->
<script type="text/javascript">
	const cpath = '${cpath}';
	const logInId = '${login.id}';
</script>


	<link rel="icon" type="image/png" href="${cpath }/resources/images/icons/favicon.ico"/> 
	<title>
		 EPL Fan Site
	</title>
	
	<!-- 0609 jsh -->
	<style>	
		.mainflex { /* jsh 06.28 */
		display: flex;
		align-items: center;
		justify-content: space-around;
		}
		
		#s_left {
			margin-left: 10%;
			width: 28%;
			float: left;
			height: auto;
		}
		
		#contents {
			margin-right: 10%;
			width: 800px;
			height: auto;
			float: left;
			font-size: small;
		} /* 0625.jsh */
	
			.newsflex{
			display: flex;
			flex-direction: column;
			justify-content: space-around;
			align-content:center;
			margin-left: 12%;
			margin-right: 12%;
			}
			.titleflex{
				display: flex;
				justify-content:flex-start;
				align-items: baseline;
			}
	
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
		
		/*06.14 bcg*/
		.hide{
			display: none !important;
		}
		
		.show{
			display: block;
		}
		
/* 		06.24 ksj 스타일 */
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


<!--=============================================alertCss 06.14봉찬균 ==================================================-->
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<!--=============================================alertCss 06.17봉찬균 ==================================================-->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
	
	
</head>
<body>

	<!-- css 수정 jsh 06.14 -->
	<header>  
	<div style="display: inline-block; float: left;">
            <span style="display: inline-block; width: 45px; height: 65px;"><img src="${cpath }/resources/images/icons/premier-league-2-logo.png" style="width: 45px; height: 65px; vertical-align;"></span>
            <span style="display: inline-block;"><h1><a href="${cpath}" style="color: #3A0640;">EPL Fan Site</a></h1></span>
            
    </div>  
    	
         
 		<!-- 06.09 봉찬균 회원 관련 메뉴 -->	        
         <div style="float: right; display: inline-block; margin-right: 15px; 
         	vertical-align:middle; margin-top: 10px;">
            	
            	<!-- 06.14 로그인 파트 변경 bcg -->            		
            	<span class="${empty login ? 'show' : 'hide' }">
	            		<button id="btn-modal"><img src="${cpath }/resources/images/member/login.png"></button>
	            </span>
            	
            	<div class="${!empty login ? 'show' : 'hide'}">
						<!-- 로그인 안되어있을시 error 방지 위함 -->
						<c:if test="${!empty login }">
	            			<img src="${cpath }/resources/images/logo/${login.club}.png">
	            		</c:if>
	            		<!-- 06.18 bcg 마이페이지 링크 -->
	            		Hi, <a href="${cpath }/member/myInfo" style="color: #3A0640; font-weight: bold;">${login.nickName }</a>
	            		<div style="margin-top: 15px; text-align: right; display: inline-block; margin-left: 30px;">
	            			<a href="${cpath }/member/logout" style="color: #E94235; font-weight: bold;">Logout</a>
	            		</div>
	            </div>
			
            	
            </div>
            
            <!-- 06.14로그인 클릭 시 모달화면출력 start point -->
			<%@include file="member/loginModal.jsp" %>
			<script src="${cpath }/resources/js/login.js"></script>
			<!-- 06.14 Login modal end point -->
			
			
	
		
		<!-- img에 팀이름 클래스 삽입 jsh 06.14  -->
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
		  <div class="container-fluid">
		
		    <div class="collapse navbar-collapse" id="navbarColor03">
		      <ul class="navbar-nav me-auto" style="margin: auto;">
		        <!-- 06.23 bcg 클럽 상단 아이콘 -->
		      	<c:forEach items="${clubList }" var="clubList">
		      	<li class="nav-item">
			    	<a style="display: block; width: 50px; height: 50px; margin-left: 20px;">	
						<img class="${clubList.clubIdx }" src="${cpath }/resources/images/logo/${clubList.clubName }.png" >
				  	</a>
		        	</li>
		      	</c:forEach>
		        
		      </ul>
		      
		      
		    </div>
		  </div>
		</nav>
	</header>

<!-- footer 추가  -->	
<!-- <footer>
 	footer 
 </footer> -->

<!-- 팀 로고 클릭 시 해당 페이지로 이동 jsh 06.14 -->
<script>	
	document.querySelectorAll('nav ul > li > a').forEach(a => a.onclick = function(event) {
		const className = event.target.classList[0] // [0]LIV [1]nav-link [2]active
		console.log(className) // LIV
		// LIV page로 이동하게
		location.href="${cpath}/" + className;
	})
</script>
