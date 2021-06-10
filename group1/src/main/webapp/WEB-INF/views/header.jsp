<!-- header.jsp file 생성  06.09 bong-->

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
	
	<!-- 0609 jsh -->
	<style>	
		a {
			text-decoration: none;
			cursor: pointer;
		}
		.hidden {
			display: none;
		}	
	</style>
	
	
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
<!--=============================================섹션 스크롤 추가 0609 jsh ==================================================-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/2.6.6/jquery.fullPage.css" rel="stylesheet"> 
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/2.6.6/jquery.fullPage.min.js"></script>
<script src="${cpath }/resources/js/section.js"></script>
	
</head>
<body>

	<header>
		<div class="col-lg-8 col-md-7 col-sm-6" style="display: inline-block;">
            <span style="display: inline-block; width: 45px; height: 75px;"><img src="${cpath }/resources/images/icons/premier-league-2-logo.png" style="width: 45px; height: 75px;"></span>
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
            	
            	<c:if test="${!empty login}">
	            	<div>
	            		<img src="${cpath }/resources/images/logo/${login.club}.png">
	            		${login.nickName }
	            		<div style="margin-top: 15px; text-align: right;">
	            			<a href="${cpath }/member/logout">로그아웃</a>
	            		</div>
	            	</div>
            	</c:if>
            </div>
	
		
	
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
		  <div class="container-fluid">
		    
		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		
		    <div class="collapse navbar-collapse" id="navbarColor03">
		      <ul class="navbar-nav me-auto" style="margin: auto;">
		        <li class="nav-item">
		          <a class="LIV nav-link active">Liverpool			<!-- 팀이름 클래스로 삽입  -->
		            <span class="visually-hidden">(current)</span>
		          </a>
		        </li>
		        
		        <li class="nav-item">
		          <a class="MU nav-link">MU</a>
		        </li>
		        
		        <li class="nav-item">
		          <a class="CHE nav-link">
					<img src="${cpath }/resources/images/logo/YYkhVbB.png" >
				  </a>
		        </li>
		        
		        <li class="nav-item">
		          <a class="CHE nav-link">
					<img src="${cpath }/resources/images/logo/Chelsea_.png" >
				  </a>
		        </li>
		        
		        <li class="nav-item">
		          <a class="ARS nav-link">Arsenal</a>
		        </li>
		        
		        <li class="nav-item">
		          <a class="TOT nav-link">Tottenham</a>
		        </li>
		        
		        <!-- 0610ksj test -->
		        <li class="nav-item">
		          <a class="nav-link" href="${cpath }/board/">list</a>
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
	

