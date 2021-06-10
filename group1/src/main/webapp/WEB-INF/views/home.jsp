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
			cursor: pointer;
		}
		header{
			
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
		<div class="col-lg-8 col-md-7 col-sm-6">
            <span style="display: inline-block; width: 45px; height: 75px;"><img src="${cpath }/resources/images/icons/premier-league-2-logo.png" style="width: 45px; height: 75px;"></span>
            <span style="display: inline-block;"><h1><a href="${cpath}/">EPL Fan Site</a></h1></span>
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
		          <a class="LIV nav-link active">Liverpool			<!-- 팀이름 클래스로 삽입  -->
		            <span class="visually-hidden">(current)</span>
		          </a>
		        </li>
		        
		        <li class="nav-item">
		          <a class="MU nav-link">MU</a>
		        </li>
		        
		        <li class="nav-item">
		          <a class="MC nav-link">MC</a>
		        </li>
		        
		        <li class="nav-item">
		          <a class="CHE nav-link">
					<img src="${cpath }/resources/images/logo/Chelsea.png" >
				  </a>
		        </li>
		        
		        <li class="nav-item">
		          <a class="ARS nav-link">Arsenal</a>
		        </li>
		        
		        <li class="nav-item">
		          <a class="TOT nav-link">Tottenham</a>
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

	
	<div class="MAIN team ">	
		<h2>Main Page</h2>
	</div>

	<div class="LIV team hidden">	
		<div id="fullpage">
        	<div class="section">
        		<div class="limiter">
					<div class="container-table100">
						<div class="wrap-table100">
			            	<div class="table100 ver2 m-b-110">
								<div class="table100-head">
									<table>
										<thead>
											<tr class="row100 head">
												<th class="cell100 column1">Class name</th>
												<th class="cell100 column2">Type</th>
												<th class="cell100 column3">Hours</th>
												<th class="cell100 column4">Trainer</th>
												<th class="cell100 column5">Spots</th>
											</tr>
										</thead>
									</table>
								</div>
			
								<div class="table100-body js-pscroll">
									<table>
										<tbody>
											<tr class="row100 body">
												<td class="cell100 column1">Like a butterfly</td>
												<td class="cell100 column2">Boxing</td>
												<td class="cell100 column3">9:00 AM - 11:00 AM</td>
												<td class="cell100 column4">Aaron Chapman</td>
												<td class="cell100 column5">10</td>
											</tr>
			
											<tr class="row100 body">
												<td class="cell100 column1">Mind & Body</td>
												<td class="cell100 column2">Yoga</td>
												<td class="cell100 column3">8:00 AM - 9:00 AM</td>
												<td class="cell100 column4">Adam Stewart</td>
												<td class="cell100 column5">15</td>
											</tr>
			
											<tr class="row100 body">
												<td class="cell100 column1">Crit Cardio</td>
												<td class="cell100 column2">Gym</td>
												<td class="cell100 column3">9:00 AM - 10:00 AM</td>
												<td class="cell100 column4">Aaron Chapman</td>
												<td class="cell100 column5">10</td>
											</tr>
			
											<tr class="row100 body">
												<td class="cell100 column1">Wheel Pose Full Posture</td>
												<td class="cell100 column2">Yoga</td>
												<td class="cell100 column3">7:00 AM - 8:30 AM</td>
												<td class="cell100 column4">Donna Wilson</td>
												<td class="cell100 column5">15</td>
											</tr>
			
											<tr class="row100 body">
												<td class="cell100 column1">Playful Dancer's Flow</td>
												<td class="cell100 column2">Yoga</td>
												<td class="cell100 column3">8:00 AM - 9:00 AM</td>
												<td class="cell100 column4">Donna Wilson</td>
												<td class="cell100 column5">10</td>
											</tr>
			
											<tr class="row100 body">
												<td class="cell100 column1">Zumba Dance</td>
												<td class="cell100 column2">Dance</td>
												<td class="cell100 column3">5:00 PM - 7:00 PM</td>
												<td class="cell100 column4">Donna Wilson</td>
												<td class="cell100 column5">20</td>
											</tr>
			
											<tr class="row100 body">
												<td class="cell100 column1">Cardio Blast</td>
												<td class="cell100 column2">Gym</td>
												<td class="cell100 column3">5:00 PM - 7:00 PM</td>
												<td class="cell100 column4">Randy Porter</td>
												<td class="cell100 column5">10</td>
											</tr>
			
											<tr class="row100 body">
												<td class="cell100 column1">Pilates Reformer</td>
												<td class="cell100 column2">Gym</td>
												<td class="cell100 column3">8:00 AM - 9:00 AM</td>
												<td class="cell100 column4">Randy Porter</td>
												<td class="cell100 column5">10</td>
											</tr>
			
											<tr class="row100 body">
												<td class="cell100 column1">Supple Spine and Shoulders</td>
												<td class="cell100 column2">Yoga</td>
												<td class="cell100 column3">6:30 AM - 8:00 AM</td>
												<td class="cell100 column4">Randy Porter</td>
												<td class="cell100 column5">15</td>
											</tr>
			
											<tr class="row100 body">
												<td class="cell100 column1">Yoga for Divas</td>
												<td class="cell100 column2">Yoga</td>
												<td class="cell100 column3">9:00 AM - 11:00 AM</td>
												<td class="cell100 column4">Donna Wilson</td>
												<td class="cell100 column5">20</td>
											</tr>
			
											<tr class="row100 body">
												<td class="cell100 column1">Virtual Cycle</td>
												<td class="cell100 column2">Gym</td>
												<td class="cell100 column3">8:00 AM - 9:00 AM</td>
												<td class="cell100 column4">Randy Porter</td>
												<td class="cell100 column5">20</td>
											</tr>
			
											<tr class="row100 body">
												<td class="cell100 column1">Like a butterfly</td>
												<td class="cell100 column2">Boxing</td>
												<td class="cell100 column3">9:00 AM - 11:00 AM</td>
												<td class="cell100 column4">Aaron Chapman</td>
												<td class="cell100 column5">10</td>
											</tr>
			
											<tr class="row100 body">
												<td class="cell100 column1">Mind & Body</td>
												<td class="cell100 column2">Yoga</td>
												<td class="cell100 column3">8:00 AM - 9:00 AM</td>
												<td class="cell100 column4">Adam Stewart</td>
												<td class="cell100 column5">15</td>
											</tr>
			
											<tr class="row100 body">
												<td class="cell100 column1">Crit Cardio</td>
												<td class="cell100 column2">Gym</td>
												<td class="cell100 column3">9:00 AM - 10:00 AM</td>
												<td class="cell100 column4">Aaron Chapman</td>
												<td class="cell100 column5">10</td>
											</tr>
			
											<tr class="row100 body">
												<td class="cell100 column1">Wheel Pose Full Posture</td>
												<td class="cell100 column2">Yoga</td>
												<td class="cell100 column3">7:00 AM - 8:30 AM</td>
												<td class="cell100 column4">Donna Wilson</td>
												<td class="cell100 column5">15</td>
											</tr>
			
											<tr class="row100 body">
												<td class="cell100 column1">Playful Dancer's Flow</td>
												<td class="cell100 column2">Yoga</td>
												<td class="cell100 column3">8:00 AM - 9:00 AM</td>
												<td class="cell100 column4">Donna Wilson</td>
												<td class="cell100 column5">10</td>
											</tr>
			
											<tr class="row100 body">
												<td class="cell100 column1">Zumba Dance</td>
												<td class="cell100 column2">Dance</td>
												<td class="cell100 column3">5:00 PM - 7:00 PM</td>
												<td class="cell100 column4">Donna Wilson</td>
												<td class="cell100 column5">20</td>
											</tr>
			
											<tr class="row100 body">
												<td class="cell100 column1">Cardio Blast</td>
												<td class="cell100 column2">Gym</td>
												<td class="cell100 column3">5:00 PM - 7:00 PM</td>
												<td class="cell100 column4">Randy Porter</td>
												<td class="cell100 column5">10</td>
											</tr>
			
											<tr class="row100 body">
												<td class="cell100 column1">Pilates Reformer</td>
												<td class="cell100 column2">Gym</td>
												<td class="cell100 column3">8:00 AM - 9:00 AM</td>
												<td class="cell100 column4">Randy Porter</td>
												<td class="cell100 column5">10</td>
											</tr>
			
											<tr class="row100 body">
												<td class="cell100 column1">Supple Spine and Shoulders</td>
												<td class="cell100 column2">Yoga</td>
												<td class="cell100 column3">6:30 AM - 8:00 AM</td>
												<td class="cell100 column4">Randy Porter</td>
												<td class="cell100 column5">15</td>
											</tr>
			
											<tr class="row100 body">
												<td class="cell100 column1">Yoga for Divas</td>
												<td class="cell100 column2">Yoga</td>
												<td class="cell100 column3">9:00 AM - 11:00 AM</td>
												<td class="cell100 column4">Donna Wilson</td>
												<td class="cell100 column5">20</td>
											</tr>
			
											<tr class="row100 body">
												<td class="cell100 column1">Virtual Cycle</td>
												<td class="cell100 column2">Gym</td>
												<td class="cell100 column3">8:00 AM - 9:00 AM</td>
												<td class="cell100 column4">Randy Porter</td>
												<td class="cell100 column5">20</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
       	 	</div>
       	 	
        	<div class="section">
            	section 2
        	</div>
        	<div class="section">
            	section 3
        	</div>
    	</div>
	</div>
	
	<div class="MU team hidden">	
		<h2>MU table</h2>
	</div>
	
	<div class="MC team hidden">	
		<h2>MC table</h2>
	</div>
	
	<div class="CHE team hidden">	
		<h2>CHE table</h2>
	</div>
	
	<div class="ARS team hidden">	
		<h2>ARS table</h2>
	</div>
	
	<div class="TOT team hidden">	
		<h2>TOT table</h2>
	</div>

<!-- 0609 jsh  -->
<script>	
	document.querySelectorAll('nav ul > li > a').forEach(a => a.onclick = function(event) {
		const className = event.target.classList[0] // [0]LIV [1]nav-link [2]active
		console.log(className)
		document.querySelectorAll('.team').forEach(div => div.classList.add('hidden'))
		document.querySelector('div.' + className).classList.remove('hidden')
	})
</script>



	

</body>
</html>